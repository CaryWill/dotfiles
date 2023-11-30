require('ts_context_commentstring').setup({
  -- nvim-ts-context-commentstring 插件会影响性能很严重
  -- 因为开启了 autocmd
  -- 这样每次都会在 cursorhold 的时候进行一次 commentstring 的计算
  -- 所以关掉就行了，关掉的缺点就是大文件需要计算 commentstring 的时候
  -- 你需要等待计算出来后然后才能进行 comment 所以看上去会有延迟
  enable_autocmd = false
})

local status, plugin = pcall(require, "SingleComment")
if (not status) then return end
plugin.setup()
