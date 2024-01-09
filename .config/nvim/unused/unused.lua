local last_image = nil
local clear_last_image = function()
	if last_image ~= nil then
		last_image:clear()
		last_image = nil
	end
end

local api = require("image")
local is_image = function(filepath)
	-- Supported image formats
	local image_extensions = { "png", "jpg", "jpeg" }
	local split_path = vim.split(filepath:lower(), ".", { plain = true })
	local extension = split_path[#split_path]
	return vim.tbl_contains(image_extensions, extension)
end

telescope.setup({
	defaults = {
		preview = {
			mime_hook = function(filepath, bufnr, opts)
				-- get the idea from https://www.reddit.com/r/neovim/comments/18f8sbd/help_configure_telescope_to_preview_images/
				if is_image(filepath) then
					local image = api.from_file(filepath, {
						buffer = bufnr,
						-- it seems like you can not use float for the x,y
						-- and i should take image width/height into account
						-- but here i just hard-coded
						x = math.floor(vim.api.nvim_win_get_width(opts.winid or 0) * 2),
						y = math.floor(vim.api.nvim_win_get_height(opts.winid or 0) / 2) - 0,
						-- width = 40,
						-- height = 10,
					})
					clear_last_image()
					image:render()
					last_image = image
				else
					clear_last_image()
					require("telescope.previewers.utils").set_preview_message(
						bufnr,
						opts.winid,
						"Binary cannot be previewed"
					)
				end
			end,
		},
	},
})
