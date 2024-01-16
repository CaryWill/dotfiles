local status, plugin = pcall(require, "translate")
if not status then
	return
end

-- part code floating window are from translate package itself
local api = vim.api
local M = {
	window = {},
}
function M.max_width_in_string_list(list)
	local max = api.nvim_strwidth(list[1])
	for i = 2, #list do
		local v = api.nvim_strwidth(list[i])
		if v > max then
			max = v
		end
	end
	return max
end

function M.cmd(lines, _)
	if type(lines) == "string" then
		lines = { lines }
	end

	M.window.close()

	local options = {
		row = 1,
		col = 1,
		border = "single",
		filetype = "translate",
		relative = "cursor",
		style = "minimal",
		zindex = 50,
	}

	local buf = api.nvim_create_buf(false, true)
	api.nvim_buf_set_lines(buf, 0, -1, true, lines)
	api.nvim_set_option_value("filetype", options.filetype, { buf = buf })

	local width = M.max_width_in_string_list(lines)
	local height = #lines

	local win = api.nvim_open_win(buf, false, {
		relative = options.relative,
		style = options.style,
		width = width,
		height = height,
		row = options.row,
		col = options.col,
		border = options.border,
		zindex = options.zindex,
	})

	M.window._current = { win = win, buf = buf }

	api.nvim_create_autocmd("CursorMoved", {
		callback = M.window.close,
		once = true,
	})
end

function M.window.close()
	if M.window._current then
		api.nvim_win_close(M.window._current.win, false)
		api.nvim_buf_delete(M.window._current.buf, {})
		M.window._current = nil
	end
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

local function get_visual_selection()
	-- Save the original cursor position
	local original_cursor = vim.api.nvim_win_get_cursor(0)

	-- Get the start and end position of the last visual selection
	-- '< and '> are marks for the start and end of the visual selection
	local start_pos = vim.api.nvim_buf_get_mark(0, "<")
	local end_pos = vim.api.nvim_buf_get_mark(0, ">")

	-- Adjust the end position to include the last character in the selection
	end_pos[2] = end_pos[2] + 1

	-- Get the text of the visual selection
	local lines = vim.api.nvim_buf_get_text(0, start_pos[1] - 1, start_pos[2], end_pos[1] - 1, end_pos[2], {})

	-- Restore the original cursor position
	vim.api.nvim_win_set_cursor(0, original_cursor)

	-- Join the lines and return the text
	return table.concat(lines, "\n")
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

local function callBaizhiApi()
	local selected_text = get_visual_selection()
	local apiKey = ""
	local script = string.format(
		[[
    curl --location 'https://api.baizhi.ai/v1/chat/completions' \
    --header 'Authorization: Bearer %s' \
    --header 'Content-Type: application/json' \
    --data '{
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "assistant",
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
	local result = vim.json.decode(extract_json(vim.fn.system(script)))
	local _lines = { "original text: " .. trimStringWithEllipsis(selected_text, 10) }
	for _, choice in ipairs(result.choices) do
		local msg = choice.message.content
		table.insert(_lines, msg)
	end
	M.cmd(_lines)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)

	-- Check if the command was successful
	if vim.v.shell_error == 0 then
		print("API call successful!")
		print(result) -- Print the result from the API call
	else
		print("API call failed. Check your configuration and try again.")
	end
end

vim.keymap.set("v", "<leader>go", callBaizhiApi, { silent = true })
