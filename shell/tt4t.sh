#!/data/data/com.termux/files/usr/bin/bash
####
#快速配置tintin在termux中使用
#author：xgg
#version: v1.0
####

#检查存储权限
folder=~/storage
check_storage()
{
if [ -d "$folder" ];then
  first=1
	echo "-->内部存储授权通过。"
fi
if [ "$first" != 1 ];then
  echo "-->请在弹出的权限请求中点击允许。"
  termux-setup-storage
  sleep 5s
  check_storage
fi
}
check_storage

#创建工作目录
echo "-->创建工作目录：~/storage/shared/tintin"
mkdir -p ~/storage/shared/tintin
echo "-->创建软连接：链接 tintin 目录至 ~/tt"
ln -s ~/storage/shared/tintin ~/tt

#替换清华源
echo "-->替换软件源为国内清华开源镜像站..."
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-main stable main@' $PREFIX/etc/apt/sources.list
apt update && apt upgrade -y

#安装tintin相关软件
echo "-->安装 tintin++ 及相关软件..."
pkg install screen tintin++ git vim -y

#工具条设置
mkdir ~/.termux
file=~/.termux/termux.properties
touch $file
echo "-->设置工具条，左滑长按 KEYBOARD 开关..."
cat>$file<<EOF
extra-keys = [['ESC','|','BACKSLASH','HOME','UP','END','PGUP','chat '],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','KEYBOARD']]
EOF

#转码设置
echo "-->GBK 转码设置..."
echo defencoding GBK > ~/.screenrc
echo mousetrack off >> ~/.screenrc

#个性化设置
echo "-->个性化设置..."
cat>~/.bashrc<<EOF
export PS1='[\w]\$ '
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias tt='cd ~/tt && screen tt++ init.tt'
alias ck='vim ~/.termux/termux.properties'
EOF
. ~/.bashrc

echo "-->请将脚本放入内存卡(内部存储) tintin 目录。"
echo "-->请重启 termux 并输入 tt 开始游戏。"

