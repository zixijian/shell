#!/bin/bash
#双色球随机选号
#定义红球、蓝球随机选择函数
red(){
 i=$RANDOM
 while [ $i -gt 33 ] || [ $i -eq 0 ] || grep -q "$i" /tmp/ball
 do i=$RANDOM
 done
 echo $i >> /tmp/ball
}
blue(){
 j=$RANDOM
 while [ $j -gt 16 ] || [ $j -eq 0 ]
 do j=$RANDOM
 done
 echo " |  $j"
}
#主程序
#随机生成6个红球号码，及1个蓝球号码
read -p '请输入想要随机产生的双色球组数: ' count
echo
echo $count | grep -q '^[1-9][0-9]*$'
if [ $? -ne 0 ]; then echo "您未输入任何有效数字，程序退出。"
else
 for n in `seq $count`
 do
 > /tmp/ball
 echo 第$n组号码如下：
  for i in `seq 6`
   do red
   echo -n "$i "
  done
 rm -f /tmp/ball
 blue
 echo -----------------------------
 done
fi
