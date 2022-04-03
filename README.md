### 安装配置

> 克隆项目

```shell
git clone git@github.com:CaryWill/dotfiles.git ~/.workspace/github/dotfiles
```

> 执行 shell

```shell
cd ~/workspace/github/dotfiles && sh bootstrap.sh
// 等 bootstrap.sh 完成后，执行 sh bootstrap2.sh
// 来安装 fish 插件，因为自动安装完 oh my fish 后的命令发现不会
// 跑，所以暂时分成了两个脚本
sh bootstrap2.sh
```

### Coc.nvim 插件

> 查看

```vim
:CocList extensions
```

### 编辑配置文件

`:PlugInstall` 安装配置