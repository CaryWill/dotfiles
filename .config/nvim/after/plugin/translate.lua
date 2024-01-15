local status, plugin = pcall(require, "translate")
if not status then
  return
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

local function callBaizhiApi()
  local api = ""
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
          "content": "Hello, World!"
        }
      ],
      "stream": false
    }']],
    api
  )

  local function extract_json(text)
    -- Pattern to match a JSON object. This is a simplistic pattern and might need to be adjusted
    -- for more complex JSON structures. It looks for the opening and closing braces of the JSON object.
    local json_pattern = "{.-}"

    -- Find the JSON object in the text
    local json_object = text:match(json_pattern)

    if json_object then
      return json_object
    else
      return "No JSON object found."
    end
  end

  local result = vim.fn.system(script)
  vim.g.result = result

  -- Check if the command was successful
  if vim.v.shell_error == 0 then
    print("API call successful!")
    print(result) -- Print the result from the API call
  else
    print("API call failed. Check your configuration and try again.")
  end
end

vim.keymap.set("v", "<leader>go", callBaizhiApi, { silent = true })
