#Ruby条件控制
=begin
Ruby if...else 语句

语法
	if conditional [then]
		code...
	[elsif conditional [then]
		code...]...
	[else
		code...]
	end
通常我们省略保留字 then 。若想在一行内写出完整的 if 式，则必须以 then 隔开条件式和程式区块。如下所示:
if a == 4 then a = 7 end
=end

x=1
if x>2
	puts "x大于2"
elsif x<2 and x!=0
	puts "x 是 1"
else
	puts "无法得知 X 的值"
end

#if...else语句是针对条件为真时执行if内的code语句，条件为假时执行else内的code语句
#相反的有对应的Ruby unless语句，unless式和 if式作用相反，即如果 conditional 为假，则执行 code。如果 conditional 为真，则执行 else 子句中指定的 code。
=begin
	unless conditional [then]
		code
	[else
		code ]
	end
=end

x=1
unless x>2
   puts "x 小于 2"
 else
  puts "x 大于 2"
end

#Ruby if 修饰符 if修饰词组表示当 if 右边之条件成立时才执行 if 左边的式子。即如果 conditional 为真，则执行 code。
#code if condition
$debug=1
print "debug\n" if $debug

#ruby unless 修饰符 unless式和 if式作用相反，即如果 conditional 为假，则执行 code。如果 conditional 为真，则执行 else 子句中指定的 code
#code unless conditional
$var =  1
print "1 -- 这一行输出\n" if $var
print "2 -- 这一行不输出\n" unless $var

$var = false
print "3 -- 这一行输出\n" unless $var

=begin
Ruby case 语句
语法
case expression
[when expression [, expression ...] [then]
   code ]...
[else
   code ]
end
通常我们省略保留字 then 。若想在一行内写出完整的 when 式，则必须以 then 隔开条件式和程式区块。如下所示:
when a == 4 then a = 7 end

理解这就相当与c语言的 switch...case...default 语句。这里case相当于C语言的switch，when相当于C语言的case，else相当于C语言的default
因此：
case expr0
when expr1, expr2
   stmt1
when expr3, expr4
   stmt2
else
   stmt3
end
基本上类似于：
_tmp = expr0
if expr1 === _tmp || expr2 === _tmp
   stmt1
elsif expr3 === _tmp || expr4 === _tmp
   stmt2
else
   stmt3
end
=end
#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

$age =  5
case $age
when 0 .. 2
    puts "婴儿"
when 3 .. 6
    puts "小孩"
when 7 .. 12
    puts "child"
when 13 .. 18
    puts "少年"
else
    puts "其他年龄段的"
end

#当case的"表达式"部分被省略时，将计算第一个when条件部分为真的表达式。
foo = false
bar = true
quu = false

case
when foo then puts 'foo is true'
when bar then puts 'bar is true'
when quu then puts 'quu is true'
end
# 显示 "bar is true"