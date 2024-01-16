local status, plugin = pcall(require, "translate")
if not status then
	return
end
local function show_floating_popup(lines, selection)
	-- Get the current cursor position
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	-- Define the buffer and window options
	local opts = {
		style = "minimal",
		relative = "cursor",
		row = 1,
		col = 0,
		width = 30,
		height = 2,
		border = "rounded",
	}
	-- Create a buffer for the floating window
	local buf = vim.api.nvim_create_buf(false, true)
	-- Set lines in the buffer (your popup text)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	-- Create the floating window
	local win = vim.api.nvim_open_win(buf, false, opts)

	-- Define a function to close the floating window
	local function close_window()
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end
	end

	-- Set a buffer-local autocmd to close the window when the cursor moves
	-- I dont know why the cursor moved, maybe becasuse it exit visual mode?
	-- I see the cursor col jumped, so i wrapped it into a defer_fn
	vim.defer_fn(function()
		vim.api.nvim_create_autocmd("CursorMoved", {
			callback = close_window,
			buffer = 0, -- the buffer number 0 is the current buffer
			once = true, -- ensure the autocmd only runs once
		})
	end, 1000)
end

require("translate").setup({
	default = {
		parse_before = "natural",
		command = "google",
		parse_after = "head",
		output = "replace",
	},
})
-- vim.keymap.set("v", "<leader>gt", ":Translate en -output=replace<CR>")
vim.keymap.set("v", "<leader>gg", ":Translate en<CR>", { silent = true })
vim.keymap.set("v", "<leader>gp", ":Translate en -output=floating<CR>", { silent = true })

local function doubleTranslateToOrignal()
	-- vim.cmd("Translate zh -output=register<CR>")
end

-- TODO: get selected not right
-- https://neovim.discourse.group/t/function-that-return-visually-selected-text/1601
function _G.get_visual_selection()
	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")
	local n_lines = math.abs(s_end[2] - s_start[2]) + 1
	local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
	lines[1] = string.sub(lines[1], s_start[3], -1)
	if n_lines == 1 then
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
	else
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
	end
	vim.g.lines = lines
	return {
		pos = { start = s_start, ["end"] = s_end },
		text = table.concat(lines, "\n"),
	}
end

local function trimStringWithEllipsis(str, maxLength)
	-- Check if the string needs to be trimmed
	if #str > maxLength then
		-- Trim the string to maxLength - 3 to account for the ellipsis
		-- and append "..."
		return str:sub(1, maxLength - 3) .. "..."
	else
		-- If the string is within the maxLength, return it unchanged
		return str
	end
end

function _G.translateInChatGPT()
	local selection = _G.get_visual_selection()
	local selected_text = selection.text
	-- creat a .local.config.lua file
	local apiKey = vim.g.chatgpt
	-- TODO: role? change to assistant? will it be better?
	local script = string.format(
		[[
    curl --location 'https://api.baizhi.ai/v1/chat/completions' \
    --header 'Authorization: Bearer %s' \
    --header 'Content-Type: application/json' \
    --data '{
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "user",
          "content": "%s"
        }
      ],
      "stream": false
    }']],
		apiKey,
		"show me the authentic way to express this sentense: '" .. selected_text .. "'"
	)

	local function extract_json(text)
		-- Pattern to match a JSON object. This is a simplistic pattern and might need to be adjusted
		-- for more complex JSON structures. It looks for the opening and closing braces of the JSON object.
		local json_pattern = "{.*}"

		-- Find the JSON object in the text
		local json_object = text:match(json_pattern)

		if json_object then
			return json_object
		else
			return "No JSON object found."
		end
	end

	-- TODO: try catch
	local original = extract_json(vim.fn.system(script))
	local result = vim.json.decode(original)
	local _lines = { "original text: " .. trimStringWithEllipsis(selected_text, 10) }
	for _, choice in ipairs(result.choices) do
		local msg = choice.message.content
		table.insert(_lines, msg)
	end
	vim.g.o = { selected_text, _lines }
	show_floating_popup(_lines, selection)
	-- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)

	-- Check if the command was successful
	if vim.v.shell_error == 0 then
	-- print("API call successful!")
	-- print(result) -- Print the result from the API call
	else
		print("API call failed. Check your configuration and try again.")
	end
end

-- NOTE: 看上去 <c-u> 非常的重要，或者说直接写函数名是不会生效的
-- When you enter command-line mode from visual mode with :, Neovim automatically inserts '<,'> to indicate that the command should operate on the visually selected lines. The <C-u> is used to clear the command line, which is useful when you don't want to operate on the range '<,'>. - from chatgpt
vim.keymap.set("v", "<leader>go", ":<C-u>lua translateInChatGPT()<CR>", { silent = true })
