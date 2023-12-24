local status, harpoon = pcall(require, "org-bullets")
if not status then
	return
end

require("org-bullets").setup({
	symbols = {
		checkboxes = {
			half = { "-", "OrgTSCheckboxHalfChecked" },
			done = { "✓", "OrgDone" },
			todo = { " ", "OrgTODO" },
		},
	},
})
