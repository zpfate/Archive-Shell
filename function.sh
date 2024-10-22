#!/bin/zsh

demoFun() {
   echo "这是我的第一个shell函数!"
}

# echo "-----函数开始执行-----"
# demoFun
# echo "-----函数执行完毕-----"

funcWithReturn() {
   echo "这个函数会对输入的两个数字进行相加运算..."
   echo "输入第一个数字: "
   read aNum
   echo "输入第二个数字: "
   read anthorNum
   echo "两个数字分别为 $aNum 和 $anthorNum !"
   return $(($aNum+$anthorNum))
}

# funcWithReturn
# echo "输入的两个数字之和为 $? !"


funcWithSum() {
      echo "这个函数会对输入的两个数字进行相加运算..."
   echo "输入第一个数字: "
   read aNum
   echo "输入第二个数字: "
   read anthorNum
   sum=$(($anthorNum + $aNum))
   echo "两个数字分别为 $aNum 和 $anthorNum !"
   echo $sum
}

# funcWithSum
# $#    传递到脚本或函数的参数个数
# $*    以一个单字符串显示所有向脚本传递的参数
# $$    脚本运行的当前进程ID号
# $!    后台运行的最后一个进程的ID号
# $@    与$*相同，但是使用时加引号，并在引号中返回每个参数。
# $-    显示Shell使用的当前选项，与set命令功能相同。
# $?    显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。

funcWithParams() {
   echo "第一个参数为 $1 !"
   echo "第一个参数为 $2 !"
   echo "第一个参数为 $10 !"
   echo "第一个参数为 ${11} !"
   echo "参数总数有 $# 个!"
   echo "作为一个字符串输出所有参数 $* !"
}

funcWithParams 1 2 3 4 5 6 7 8 9 34 73



