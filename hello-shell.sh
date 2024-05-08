#!/bin/zsh

# echo输出
echo "Hello World"
# 定义变量,不需要$符号
# 只能使用数字/字母/下划线 不能包含其他特殊字符
# 不能以数字开头
# 避免使用shell关键字
# 习惯上使用全大写字母表示常量
your_name="Jessi"
PI=3.14
# 使用变量的时候 加$获取
echo $your_name

# for file in `./`
# 或者
# for file in $(./)

# 变量名外面的花括号是可选的，加不加都行，加花括号是为了帮助解释器识别变量的边界
for skill in Ada Coffe Action Java; do
    echo "I am good at ${skill}Script"
done

# readonly命令可以将变量定义为只读
myUrl="https://www.google.com"
readonly myUrl
# myUrl="https://www.runoob.com" #报错


# 删除变量 unset
newUrl="https://www.runoob.com"
unset newUrl  # unset删除变量
echo $newUrl # 实际没有任何输出

# 整数型变量 使用declare或者typeset命令来声明整数变量
declare -i my_integer=42

#数组变量
my_array=(1 2 3 4 5)


# 关联数组(或者说字典??)
# -A 选项就是用于声明一个关联数组。
declare -A associative_array
associative_array["name"]="John"
associative_array["age"]=30

#环境变量
echo "打印环境变量: $PATH \n"

# 单引号 
# 单引号字符串的限制:
# 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
# 单引号字符串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用。
str='this is a string'


# 双引号
# 双引号里可以有变量
# 双引号里可以出现转义字符
str="Hello, I know you are \"$your_name\"! \n"
echo -e $str


# 使用双引号拼接
greeting="hello, "$your_name" !"
# 使用单引号拼接
greeting_2='hello, '$your_name' !'


# 获取字符串长度
string='abcd'
echo ${#string}      # 输出 4
echo ${#string[0]}   # 输出 4

# 提取字符串
string="runoob is a great site"
echo ${string:1:4} 



# 传递参数
# $# 传递到脚本的参数个数
# $* 以一个单字符串显示所有向脚本传递的参数。 以一个单字符串显示所有向脚本传递的参数。
# $$ 脚本运行的当前进程ID号
# $! 后台运行的最后一个进程的ID号
# $@ 与$*相同，但是使用时加引号，并在引号中返回每个参数。 如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。
# $- 显示Shell使用的当前选项，与set命令功能相同。
# $? 显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。


# ###### Shell基本运算符 #######
# 原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。
# expr 是一款表达式计算工具，使用它能完成表达式的求值操作。
# 例如，两个数相加(注意使用的是反引号 ` 而不是单引号 ')：

val=`expr 2 + 2`
echo "两数之和为: $val"

# ##### 算术运算符 #####

a=10
b=20

val=`expr $a + $b`
echo "a + b : $val"

val=`expr $a - $b`
echo "a - b : $val"

val=`expr $a \* $b`
echo "a * b : $val"

val=`expr $b / $a`
echo "b / a : $val"

val=`expr $b % $a`
echo "b % a : $val"

if [ $a == $b ]
then
   echo "a 等于 b"
fi
if [ $a != $b ]
then
   echo "a 不等于 b"
fi

# ##### 关系运算符 #####
:<<EOF
-eq	 检测两个数是否相等，相等返回 true。	
-ne	 检测两个数是否不相等，不相等返回 true。	
-gt	 检测左边的数是否大于右边的，如果是，则返回 true。	
-lt	 检测左边的数是否小于右边的，如果是，则返回 true。	
-ge	 检测左边的数是否大于等于右边的，如果是，则返回 true。	
-le	 检测左边的数是否小于等于右边的，如果是，则返回 true。	
EOF


if [ $a -eq $b ]
then
   echo "$a -eq $b : a 等于 b"
else
   echo "$a -eq $b: a 不等于 b"
fi
if [ $a -ne $b ]
then
   echo "$a -ne $b: a 不等于 b"
else
   echo "$a -ne $b : a 等于 b"
fi
if [ $a -gt $b ]
then
   echo "$a -gt $b: a 大于 b"
else
   echo "$a -gt $b: a 不大于 b"
fi
if [ $a -lt $b ]
then
   echo "$a -lt $b: a 小于 b"
else
   echo "$a -lt $b: a 不小于 b"
fi
if [ $a -ge $b ]
then
   echo "$a -ge $b: a 大于或等于 b"
else
   echo "$a -ge $b: a 小于 b"
fi
if [ $a -le $b ]
then
   echo "$a -le $b: a 小于或等于 b"
else
   echo "$a -le $b: a 大于 b"
fi


# ##### 布尔运算符 #####
# !	    非运算，表达式为 true 则返回 false，否则返回 true。	
# -o    或运算，有一个表达式为 true 则返回 true。		
# -a	与运算，两个表达式都为 true 才返回 true。	

if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a == $b: a 等于 b"
fi
if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a 小于 100 且 $b 大于 15 : 返回 true"
else
   echo "$a 小于 100 且 $b 大于 15 : 返回 false"
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a 小于 5 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 5 或 $b 大于 100 : 返回 false"
fi

# ##### 逻辑运算符 #####
# &&    逻辑的 AND	
# ||	逻辑的 OR	

if [[ $a -lt 100 && $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi

if [[ $a -lt 100 || $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi


# ##### 字符串运算符 #####
# =     检测两个字符串是否相等，相等返回 true。	
# !=	检测两个字符串是否不相等，不相等返回 true。	
# -z	检测字符串长度是否为0，为0返回 true。	
# -n	检测字符串长度是否不为 0，不为 0 返回 true。	
# $	    检测字符串是否不为空，不为空返回 true。	

a="abc"
b="efg"

if [ $a = $b ]
then
   echo "$a = $b : a 等于 b"
else
   echo "$a = $b: a 不等于 b"
fi
if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a != $b: a 等于 b"
fi
if [ -z $a ]
then
   echo "-z $a : 字符串长度为 0"
else
   echo "-z $a : 字符串长度不为 0"
fi
if [ -n "$a" ]
then
   echo "-n $a : 字符串长度不为 0"
else
   echo "-n $a : 字符串长度为 0"
fi
if [ $a ]
then
   echo "$a : 字符串不为空"
else
   echo "$a : 字符串为空"
fi


# ##### 文件测试运算符 #####
file="/var/www/runoob/test.sh"
if [ -r $file ]
then
   echo "文件可读"
else
   echo "文件不可读"
fi
if [ -w $file ]
then
   echo "文件可写"
else
   echo "文件不可写"
fi
if [ -x $file ]
then
   echo "文件可执行"
else
   echo "文件不可执行"
fi
if [ -f $file ]
then
   echo "文件为普通文件"
else
   echo "文件为特殊文件"
fi
if [ -d $file ]
then
   echo "文件是个目录"
else
   echo "文件不是个目录"
fi
if [ -s $file ]
then
   echo "文件不为空"
else
   echo "文件为空"
fi
if [ -e $file ]
then
   echo "文件存在"
else
   echo "文件不存在"
fi



# ##################### echo ##########################

echo "It is a test"
echo It is a test
# 显示转义符
echo "\" It is a test\""
read name 
echo "$name It is a test"
# 显示换行
echo -e "OK! \n" # -e 开启转义
# 显示不换号
echo -e "OK! \c" # -e 开启转义 \c 不换行

# 显示结果至定向文件
echo "It is a test" > myfile

# 显示命令执行结果
# 这里使用的是反引号 `, 而不是单引号 '。结果将显示当前日期
echo `date`


# ###### printf基本运算符 #######

# printf 命令模仿 C 程序库（library）里的 printf() 程序。
# printf 由 POSIX 标准所定义，因此使用 printf 的脚本比使用 echo 移植性好。
# printf 使用引用文本或空格分隔的参数，外面可以在 printf 中使用格式化字符串，还可以制定字符串的宽度、左右对齐方式等。默认的 printf 不会像 echo 自动添加换行符，我们可以手动添加 \n。
# printf 命令的语法：printf  format-string  [arguments...]

# %s：字符串
# %d：十进制整数
# %f：浮点数
# %c：字符
# %x：十六进制数
# %o：八进制数
# %b：二进制数
# %e：科学计数法表示的浮点数

echo "Hello, Shell"
printf "Hello, Shell\n"
 
printf "%-10s %-8s %-4s\n"      姓名 性别 体重kg  
printf "%-10s %-8s %-4.2f\n"    郭靖 男 66.1234 
printf "%-10s %-8s %-4.2f\n"    杨过 男 48.6543 
printf "%-10s %-8s %-4.2f\n"    郭芙 女 47.9876
 
# format-string为双引号
printf "%d %s\n" 1 "abc"

# 单引号与双引号效果一样 
printf '%d %s\n' 1 "abc" 

# 没有引号也可以输出
printf %s abcdef

# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
printf %s abc def

printf "%s\n" abc def

printf "%s %s %s\n" a b c d e f g h i j

# 如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
printf "%s and %d \n"


# ###### printf转义序列 #######
# \a    警告字符，通常为ASCII的BEL字符
# \b    后退
# \c    抑制（不显示）输出结果中任何结尾的换行字符（只在%b格式指示符控制下的参数字符串中有效），而且，任何留在参数里的字符、任何接下来的参数以及任何留在格式字符串中的字符，都被忽略
# \f    换页（formfeed）
# \n    换行
# \r    回车（Carriage return）
# \t    水平制表符
# \v    垂直制表符
# \\    一个字面上的反斜杠字符
# \ddd  表示1到3位数八进制值的字符。仅在格式字符串中有效
# \0ddd 表示1到3位的八进制值字符


printf "a string, no processing:<%s>\n" "A\nB"
# a string, no processing:<A\nB>

printf "a string, no processing:<%b>\n" "A\nB"
#a string, no processing:<A
#B>

# printf "www.runoob.com \a"
# www.runoob.com $                  #不换行


