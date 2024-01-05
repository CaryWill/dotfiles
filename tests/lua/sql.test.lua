local dbpath = "/Users/cary/dotfiles/tests/lua/test.db"
local sqlite = require("sqlite.db")
local table_name = "example_table"

describe("sql", function()
	it("test", function()
		sqlite:with_open(dbpath, function(db)
			local data = db:select(table_name, {})
			vim.print(data)
		end)
		assert.equals(1, 6)
	end)
end)
