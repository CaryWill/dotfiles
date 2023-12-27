local function findMatches(input)
  -- local pattern = "%[%[.*%]%]"
  local pattern = "%[%[([^%[%]]-)%]%]"
  local matches = {}
  for start_col, end_col, match in input:gmatch("()" .. pattern .. "()") do
    table.insert(matches, { start_col, end_col, match })
  end
  return matches
end

describe("misc", function()
  it("find [[ ]]", function()
    local str = "like [[https://github.com/DinkDonk/kitty-icon/blob/main/kitty-dark.png]], in this "
    local matches = findMatches(str)
    local first_match = matches[1]
    if first_match ~= nil then
      local start_col = first_match[1]
      local url = first_match[2]
      local end_col = first_match[3]
      assert.equals(start_col, 6)
      assert.equals(end_col, 73)
      assert.equals(url, "https://github.com/DinkDonk/kitty-icon/blob/main/kitty-dark.png")
    end
  end)
end)
