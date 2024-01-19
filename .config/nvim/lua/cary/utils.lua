local function max_width_in_string_list(list)
	local max = vim.api.nvim_strwidth(list[1])
	for i = 2, #list do
		local v = vim.api.nvim_strwidth(list[i])
		if v > max then
			max = v
		end
	end
	return max
end

local function get_wrapped_lines(text_lines, max_width)
	local current_win = vim.api.nvim_get_current_win()
	local width = vim.api.nvim_win_get_width(current_win)
	max_width = width / 2 or 35
	vim.g.max_width = max_width

	local wrapped_lines = {}

	for _, line in ipairs(text_lines) do
		-- If the line is shorter than the max width, just add it to the result
		if #line <= max_width then
			table.insert(wrapped_lines, line)
		else
			-- If the line is longer, split it into wrapped lines
			local current_line = line
			while #current_line > max_width do
				local wrapped_line = current_line:sub(1, max_width)
				table.insert(wrapped_lines, wrapped_line) -- Trim whitespaces
				current_line = current_line:sub(max_width + 1) -- Get the remaining part of the line
			end

			-- Don't forget to add the last part of the wrapped line
			if #current_line > 0 then
				table.insert(wrapped_lines, current_line)
			end
		end
	end

	vim.g.l = wrapped_lines
	return wrapped_lines
end

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

local function show_floating_popup(lines, selection)
	-- Get the current cursor position
	-- local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	-- Define the buffer and window options
	local opts = {
		style = "minimal",
		relative = "cursor",
		row = 1,
		col = 0,
		width = max_width_in_string_list(lines),
		height = #lines,
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

-- https://neovim.discourse.group/t/function-that-return-visually-selected-text/1601
local function get_visual_selection()
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

local function table_merge(t1, t2)
	for k, v in ipairs(t2) do
		table.insert(t1, v)
	end
	return t1
end

return {
	max_width_in_string_list = max_width_in_string_list,
	get_wrapped_lines = get_wrapped_lines,
	extract_json = extract_json,
	show_floating_popup = show_floating_popup,
	get_visual_selection = get_visual_selection,
	trimStringWithEllipsis = trimStringWithEllipsis,
	table_merge = table_merge,
}
