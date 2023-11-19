## Vim9

Since the neovim API is not stable, I quit using neovim, so this is the configuaration of Original Vim with the version 9

## Liked fonts

1. Monolisa(13, 100, 135)
2. Menlo(13, 100, 110)
3. JetBrainsMono
4. version 9.0.1833 works

Note: all fonts are nerd-font patched.

## Notes

// https://vi.stackexchange.com/questions/28489/how-to-make-vim-colorscheme-work-on-big-sur-terminal?newreg=30ec2c296a4b4287b7f255754c8b8443

1. remove `set termguicolors`

// https://apple.stackexchange.com/questions/165158/where-are-terminal-app-profiles-files-located 2. you can backup terminal.app config file
// 如果移除了那么应该使用 ctermfg, 否则 guifg 即可。

2. Meta key

In terminal setting, you can set 'option' key as 'meta' key.

3. change zsh full path
https://stackoverflow.com/a/64441730

4. dont use `f` as prefix to map since it overlap with vim search
5. use /* stylelint-disable */ to disable autofix certain line

注：tmux session 可以按照需求来 group 代码库来做成一个 project, dev server 可以放到 tmux split 里，平时开发就直接全屏 tmux 里开发的那个 split。

1. Ctrl + b + % to split the current pane vertically.
2. Ctrl + b + " to split the current pane horizontally.
3. You can toggle the full-screen mode by using the same keyboard shortcut – Prefix + z

6. 注意 im-select 需要看下自己的默认键盘
7. lsp config https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
8. current version neovim 0.10.0
9. 很多插件直接参考了这里 https://www.lazyvim.org/plugins
10. 有了鼠标的能力之后，你会发现 neo-tree 也可以直接拖动宽度了
11. 找不到要改那个颜色， 可以直接去插件代码仓库看怎么定义的
12. 出现一个很奇怪的现象就是 vim 一打开 telscope 就自动打开了，我现在用了 iterm2 nightly 的版本倒是解决了，很奇怪
13. bufferline 插件会让进入的vim的时候抖动一下，所以移除了

## TODO

- [x] Vim git previous commit up down in fzf(虽然不能用 key map 但是发现可以直接 鼠标/触摸板 进行滚动）
- [x] tmux copy vi mode not work in terminal.app(but you can use `fn` to select), maybe because xclip?
- [x] jsx color heighlight
- [x] zsh，回车后下一行开头会回显命令
- [ ] react 多行 comment 的时候，会出现多个 {} 想要一个怎么半
