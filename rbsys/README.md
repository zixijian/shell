本文转自[如有乐享](http://51.ruyo.net/5561.html)

实战案例：
滴滴云dc2云服务器默认centos 及ubuntu，
成功换成debian并修改原脚本为debian2.sh ，并对文中的脚本进行了留存。
修改项目：
修改脚本中的镜像站为国内镜像站aliyun（否则慢死）

重要：滴滴云默认是静态分配ip，DHCP的话会卡死
重要：安装前先弄清楚本地的ip 、掩码、及网关并记下来。

重装开始后登录滴滴云自带的控制台进行操作。

CentOS/Debian/Ubuntu网络重装系统一键脚本

背景
运行要求
安装脚本
```
Debian 7 x32
Debian 7 x64
Debian 8 x32
Debian 8 x64
Debian 9 x32
Debian 9 x64
Ubuntu 14.04 x32
Ubuntu 14.04 x64
Ubuntu 16.04 x32
Ubuntu 16.04 x64
Ubuntu 17.04 x32
Ubuntu 17.04 x64
CentOS 6+ X64
```

注意事项:

文章转载自 萌咖 && 狗仔小分队

特别注意: OpenVZ构架不适用，安装之前备份重要数据。

特别注意: OpenVZ构架不适用，安装之前备份重要数据。

特别注意: OpenVZ构架不适用，安装之前备份重要数据。

背景:  
适用于由GRUB引导的CentOS,Ubuntu,Debian系统。  
使用官方发行版去掉模板预装的软件。  
同时也可以解决内核版本与软件不兼容的问题。  
只要有root权限,还您一个纯净的系统。

 
运行要求：
Debian/Ubuntu/CentOS 系统(由 GRUB引导)；  
wget 用来下载文件，获取公网IP;
ip 获取网关，掩码等;  
sed awk grep 处理文本流；  
VNC 安装系统(此项为可选)。
 
安装脚本：  
全自动安装默认 root 密码: Vicer,安装完成后请立即更改密码。

```
Debian 7 x32

wget --no-check-certificate -qO DebianNET.sh 'https://moeclub.org/attachment/LinuxShell/DebianNET.sh' && chmod -x DebianNET.sh && bash DebianNET.sh -d 7 -v 32
 
 

Debian 7 x64


wget --no-check-certificate -qO DebianNET.sh 'https://moeclub.org/attachment/LinuxShell/DebianNET.sh' && chmod -x DebianNET.sh && bash DebianNET.sh -d 7 -v 64
 

Debian 8 x32

wget --no-check-certificate -qO DebianNET.sh 'https://moeclub.org/attachment/LinuxShell/DebianNET.sh' && chmod -x DebianNET.sh && bash DebianNET.sh -d 8 -v 32
 

Debian 8 x64


wget --no-check-certificate -qO DebianNET.sh 'https://moeclub.org/attachment/LinuxShell/DebianNET.sh' && chmod -x DebianNET.sh && bash DebianNET.sh -d 8 -v 64
 

Debian 9 x32


wget --no-check-certificate -qO DebianNET.sh 'https://moeclub.org/attachment/LinuxShell/DebianNET.sh' && chmod -x DebianNET.sh && bash DebianNET.sh -d 9 -v 32
 

Debian 9 x64


wget --no-check-certificate -qO DebianNET.sh 'https://moeclub.org/attachment/LinuxShell/DebianNET.sh' && chmod -x DebianNET.sh && bash DebianNET.sh -d 9 -v 64
 

Ubuntu 14.04 x32


wget --no-check-certificate -qO DebianNET.sh 'https://moeclub.org/attachment/LinuxShell/DebianNET.sh' && chmod -x DebianNET.sh && bash DebianNET.sh -d trusty -v 32
 

Ubuntu 14.04 x64


wget --no-check-certificate -qO DebianNET.sh 'https://moeclub.org/attachment/LinuxShell/DebianNET.sh' && chmod -x DebianNET.sh && bash DebianNET.sh -d trusty -v 64
 

Ubuntu 16.04 x32


wget --no-check-certificate -qO DebianNET.sh 'https://moeclub.org/attachment/LinuxShell/DebianNET.sh' && chmod -x DebianNET.sh && bash DebianNET.sh -d xenial -v 32
 

Ubuntu 16.04 x64


wget --no-check-certificate -qO DebianNET.sh 'https://moeclub.org/attachment/LinuxShell/DebianNET.sh' && chmod -x DebianNET.sh && bash DebianNET.sh -d xenial -v 64
 

Ubuntu 17.04 x32


wget --no-check-certificate -qO DebianNET.sh 'https://moeclub.org/attachment/LinuxShell/DebianNET.sh' && chmod -x DebianNET.sh && bash DebianNET.sh -d zesty -v 32
 

Ubuntu 17.04 x64


wget --no-check-certificate -qO DebianNET.sh 'https://moeclub.org/attachment/LinuxShell/DebianNET.sh' && chmod -x DebianNET.sh && bash DebianNET.sh -d zesty -v 64
 

CentOS 6+ X64


wget xiaofd.github.io/centos.sh && bash centos.sh

```

安装时间（Vultr 2.5刀机器 重装大概15分钟） root用户密码为 xiaofd.win

注意事项：
确保安装了所需软件:  

```
#Debian/Ubuntu:
apt-get install -y gawk sed grep
 
#RedHat/CentOS:
yum install -y gawk sed grep

如果出现了错误,请运行:
#Debian/Ubuntu:
apt-get update
 
#RedHat/CentOS:
yum update
```

在安装Ubuntu时,可能会遇到:

Getting the time form a network time server...

界面进度条很长时间不会动,可以等待它超时或者更换别的版，该问题是Ubuntu系统的问题。

 
