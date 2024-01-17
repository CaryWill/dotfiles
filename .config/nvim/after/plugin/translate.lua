local status, plugin = pcall(require, "translate")
if not status then
	return
end

local utils = require("cary.utils")
local model = "gpt-4"
local max_width_in_string_list = utils.max_width_in_string_list
local get_wrapped_lines = utils.get_wrapped_lines
local extract_json = utils.extract_json
local show_floating_popup = utils.show_floating_popup
local get_visual_selection = utils.get_visual_selection
_G.get_visual_selection = get_visual_selection
local trimStringWithEllipsis = utils.trimStringWithEllipsis

require("translate").setup({
	default = {
		parse_before = "natural",
		command = "google",
		parse_after = "head",
		output = "replace",
	},
})

vim.keymap.set("v", "<leader>gg", ":Translate en<CR>", { silent = true })
vim.keymap.set("v", "<leader>gp", ":Translate en -output=floating<CR>", { silent = true })

-- TODO: different prompt key mapping
-- async version
-- creat a .local.config.lua file
local function ask(input, opts)
	opts = opts or {}
	local prePrompt = opts.prePrompt or ""
	local sufPrompt = opts.sufPrompt or ""
	local job = require("plenary.job")
	job:new({
		command = "curl",
		args = {
			"--location",
			"https://api.baizhi.ai/v1/chat/completions",
			"--header",
			"Authorization: Bearer " .. vim.g.chatgpt,
			"--header",
			"Content-Type: application/json",
			"--data",
			string.format(
				[[{
      "model": "%s",
      "messages": [
        {
          "role": "user",
          "content": "%s"
        }
      ],
      "stream": false
    }]],
				model,
				prePrompt .. input:gsub('"', '\\"') .. sufPrompt
			),
		},
		on_exit = function(j, exit_code)
			local res = table.concat(j:result(), "\n")
			local result = vim.json.decode(res)
			local _lines = {}
			for _, choice in ipairs(result.choices) do
				local msg = choice.message.content
				for line in msg:gmatch("([^\n]+)") do
					table.insert(_lines, line)
				end
			end
			local type = "Success!"
			if exit_code ~= 0 then
				type = "Error!"
				print("error: " .. res)
			else
				vim.schedule(function()
					local wrapped_lines = get_wrapped_lines(_lines)
					show_floating_popup(_lines)
				end)
			end
		end,
	}):start()
end

local function translateInChatGPT()
	local selection = _G.get_visual_selection()
	local selected_text = selection.text
	ask(selected_text)
end

local function askChatGPT()
	local input = vim.fn.input("What do you want buddy: ")
	ask(input)
end

local function askChatGPTLookUp()
	local selection = _G.get_visual_selection()
	local selected_text = selection.text
	ask(selected_text, { prePrompt = "what does '", sufPrompt = "'mean?" })
end

_G.askChatGPT = askChatGPT
_G.translateInChatGPT = translateInChatGPT
_G.askChatGPTLookUp = askChatGPTLookUp

-- NOTE: 看上去 <c-u> 非常的重要，或者说直接写函数名是不会生效的
-- When you enter command-line mode from visual mode with :, Neovim automatically inserts '<,'> to indicate that the command should operate on the visually selected lines. The <C-u> is used to clear the command line, which is useful when you don't want to operate on the range '<,'>. - from chatgpt
vim.keymap.set("v", "<leader>go", ":<C-u>lua translateInChatGPT()<CR>", { silent = true })
vim.keymap.set("n", "<leader>gt", ":<C-u>lua askChatGPT()<CR>", { silent = true })
vim.keymap.set("v", "<leader>gl", ":<C-u>lua askChatGPTLookUp()<CR>", { silent = true })
