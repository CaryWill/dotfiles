local status, plugin = pcall(require, "translate")
if not status then
	return
end

local utils = require("cary.utils")
-- TODO: 后面可以让用户选通过一个变量 vim.g.model 一类的
local model = "gpt-4"
-- for review, after you dismissed the floating
local lastResult = {}

local prompts = {
	translate = { label = "translate", desc = "translate", prePrompt = "what does '", sufPrompt = "'mean?" },
	grammarCheck = {
		label = "grammar check",
		desc = "check grammar",
		prePrompt = "Check the grammar of sentence '",
		sufPrompt = "'",
	},
	betterExpression = {
		label = "better expression",
		desc = "authentic way to express",
		prePrompt = "What is the authentic way to express '",
		sufPrompt = "'",
	},
}
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
				lastResult = _lines
				vim.schedule(function()
					local wrapped_lines = get_wrapped_lines(_lines)
					show_floating_popup(wrapped_lines)
				end)
			end
		end,
	}):start()
end

local function translateInChatGPT()
	local selection = _G.get_visual_selection()
	local selected_text = selection.text
	ask(selected_text, prompts.betterExpression)
end

local function askChatGPT()
	local input = vim.fn.input("What do you want buddy: ")
	ask(input)
end

local function askChatGPTByPromptLookUp()
	local selection = _G.get_visual_selection()
	local selected_text = selection.text

	local options = {}
	local options_key = {}
	local index = 1
	for label, item in pairs(prompts) do
		local _label = item.label or ""
		local _desc = item.desc
		if _desc then
			_desc = "(" .. _desc .. ")"
		else
			_desc = ""
		end
		options[index] = string.format("%d. %s", index, _label)
		options_key[index] = label
		index = index + 1
	end
	local choice = vim.fn.inputlist(options) or 1
	local key = options_key[choice]
	local ask_options = prompts[key]
	ask(selected_text, ask_options)
end

local function printTable()
	vim.g.c = lastResult
	for _, line in ipairs(lastResult) do
		print(line)
	end
end

_G.askChatGPT = askChatGPT
_G.translateInChatGPT = translateInChatGPT
_G.askChatGPTByPromptLookUp = askChatGPTByPromptLookUp

-- NOTE: 看上去 <c-u> 非常的重要，或者说直接写函数名是不会生效的
-- When you enter command-line mode from visual mode with :, Neovim automatically inserts '<,'> to indicate that the command should operate on the visually selected lines. The <C-u> is used to clear the command line, which is useful when you don't want to operate on the range '<,'>. - from chatgpt
vim.keymap.set("v", "<leader>go", ":<C-u>lua translateInChatGPT()<CR>", { silent = true })
vim.keymap.set("n", "<leader>gi", ":<C-u>lua askChatGPT()<CR>", { silent = true })
vim.keymap.set("v", "<leader>gl", ":<C-u>lua askChatGPTByPromptLookUp()<CR>", { silent = true })

vim.keymap.set("v", "<leader>gg", ":Translate en<CR>", { silent = true })
vim.keymap.set("v", "<leader>gp", ":Translate en -output=floating<CR>", { silent = true })
vim.keymap.set("n", "<leader>gr", printTable, { silent = true })
