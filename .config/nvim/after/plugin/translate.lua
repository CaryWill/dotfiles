local status, plugin = pcall(require, "translate")
if not status then
	return
end

local utils = require("cary.utils")
vim.g.model = "gpt-3-turbo"
local url = "https://api.theb.ai/v1"
local url2 = "https://api.baizhi.ai/v1"
local all_models = {
	"gpt-3.5-turbo",
	"gpt-4-turbo",
	"dall-e-2",
	"google-imagen",
	"theb-ai",
	"gpt-3.5-turbo-16k",
	"gpt-4-1106-preview",
	"gpt-4",
	"gpt-4-32k",
	"claude-2",
	"claude-1",
	"claude-1-100k",
	"claude-instant-1",
	"claude-instant-1-100k",
	"gemini-pro",
	"palm-2",
	"palm-2-codey",
	"vicuna-13b-v1.5",
	"llama-2-7b-chat",
	"llama-2-13b-chat",
	"llama-2-70b-chat",
	"code-llama-7b",
	"code-llama-13b",
	"code-llama-34b",
	"qwen-7b-chat",
}
-- 用来记录历史消息这样就可以和chatgpt聊天了
local messages = {}
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
	ask = {
		label = "ask question",
		desc = "selected text will be the question",
		prePrompt = "",
		sufPrompt = "",
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

-- async version
-- creat a .local.config.lua file
local function ask(input, opts)
	opts = opts or {}
	local prePrompt = opts.prePrompt or ""
	local sufPrompt = opts.sufPrompt or ""

	table.insert(messages, { role = "user", content = prePrompt .. input:gsub('"', '\\"') .. sufPrompt })

	local job = require("plenary.job")
	job:new({
		command = "curl",
		args = {
			"--location",
			url2 .. "/chat/completions",
			"--header",
			"Authorization: Bearer " .. vim.g.chatgpt,
			"--header",
			"Content-Type: application/json",
			"--data",
			string.format(
				[[{
           "model": "%s",
           "messages": %s,
           "stream": false
        }]],
				vim.g.model,
				vim.json.encode(messages)
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
					lastResult = wrapped_lines
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

local function askChatGPT(isNewConversation)
	if isNewConversation then
		messages = {}
	end
	local welcome_msg = "What do you want to ask buddy: "
	if #messages then
		welcome_msg = "input: "
	end
	local input = vim.fn.input(welcome_msg)
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

local function showLastResult()
	show_floating_popup(lastResult)
end

local function selectAiModel()
	local options = {}
	for index, item in ipairs(all_models) do
		options[index] = string.format("%d. %s", index, item)
	end
	local choice = vim.fn.inputlist(options) or 1
	vim.g.model = all_models[choice]
end

_G.askChatGPT = askChatGPT
_G.translateInChatGPT = translateInChatGPT
_G.askChatGPTByPromptLookUp = askChatGPTByPromptLookUp

-- NOTE: 看上去 <c-u> 非常的重要，或者说直接写函数名是不会生效的
-- When you enter command-line mode from visual mode with :, Neovim automatically inserts '<,'> to indicate that the command should operate on the visually selected lines. The <C-u> is used to clear the command line, which is useful when you don't want to operate on the range '<,'>. - from chatgpt
vim.keymap.set("v", "<leader>go", ":<C-u>lua translateInChatGPT()<CR>", { silent = true })
vim.keymap.set("n", "<leader>gi", ":<C-u>lua askChatGPT()<CR>", { silent = true })
vim.keymap.set("n", "<leader>gc", ":<C-u>lua askChatGPT(true)<CR>", { silent = true })
vim.keymap.set("v", "<leader>gl", ":<C-u>lua askChatGPTByPromptLookUp()<CR>", { silent = true })

vim.keymap.set("v", "<leader>gg", ":Translate en<CR>", { silent = true })
vim.keymap.set("v", "<leader>gp", ":Translate en -output=floating<CR>", { silent = true })
vim.keymap.set("n", "<leader>gr", showLastResult, { silent = true })
vim.keymap.set("n", "<leader>gm", selectAiModel, { silent = true })
