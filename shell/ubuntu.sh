#!/data/data/com.termux/files/usr/bin/bash
folder=ubuntu-fs
if [ -d "$folder" ]; then
	first=1
	echo "skipping downloading"
fi
tarball="ubuntu.tar.gz"
if [ "$first" != 1 ];then
	if [ ! -f $tarball ]; then
		echo "downloading ubuntu-image"
		case `dpkg --print-architecture` in
		aarch64)
			archurl="arm64" ;;
		arm)
			archurl="armhf" ;;
		amd64)
			archurl="amd64" ;;
		i*86)
			archurl="i386" ;;
		x86_64)
			archurl="amd64" ;;
		*)
			echo "unknown architecture"; exit 1 ;;
		esac
		wget "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cdimage/ubuntu-base/releases/18.04.5/release/ubuntu-base-18.04.5-base-${archurl}.tar.gz" -O $tarball
	fi
	cur=`pwd`
	mkdir -p "$folder"
	cd "$folder"
	echo "decompressing ubuntu image"
	proot --link2symlink tar -xf ${cur}/${tarball} --exclude='dev'||:
	echo "fixing nameserver, otherwise it can't connect to the internet"
	echo "nameserver 114.114.114.114" > etc/resolv.conf
	echo "nameserver 8.8.8.8" >> etc/resolv.conf
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic main universe multiverse" > etc/apt/sources.list
	echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic main universe" >> etc/apt/sources.list
	echo "export LC_ALL=C" >> root/.bashrc
	echo "export LANG=zh_CN.UTF-8" >> root/.bashrc
	cd "$cur"
fi
mkdir -p binds
bin=start-ubuntu.sh
echo "writing launch script"
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A binds)" ]; then
    for f in binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to / 
#command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

echo "fixing shebang of $bin"
termux-fix-shebang $bin
echo "making $bin executable"
chmod +x $bin
echo "You can now launch Ubuntu with the ./${bin} script"
