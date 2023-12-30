local status, hologram = pcall(require, "hologram")
if not status then
	return
end

require("hologram").setup({
	auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
})
