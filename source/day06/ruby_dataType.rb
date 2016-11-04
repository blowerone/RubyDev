=begin
>>Ruby 字符串（String）

Ruby 中的 String 对象用于存储或操作一个或多个字节的序列。
Ruby 字符串分为单引号字符串（'）和双引号字符串（"），区别在于双引号字符串能够支持更多的转义字符。

=end

#>>单引号字符串
'这是一个 Ruby 程序的字符串'

'Won\'t you read O\'Reilly\'s book?' #如果您需要在单引号字符串内使用单引号字符，那么需要在单引号字符串使用反斜杠(\)，这样 Ruby 解释器就不会认为这个单引号字符是字符串的终止符号：

#>>双引号字符串
#在双引号字符串中我们可以使用 #{} 井号和大括号来计算表达式的值：
#字符串中嵌入变量：

#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

name1 = "Joe"
name2 = "Mary"
puts "你好 #{name1},  #{name2} 在哪?"

#字符串中进行数学运算：

#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

x, y, z = 12, 36, 72
puts "x 的值为 #{ x }"
puts "x + y 的值为 #{ x + y }"
puts "x + y + z 的平均值为 #{ (x + y + z)/3 }"

=begin
Ruby 中还支持一种采用 %q 和 %Q 来引导的字符串变量，%q 使用的是单引号引用规则，
而 %Q 是双引号引用规则，后面再接一个 (! [ { 等等的开始界定符和与 } ] ) 等等的末尾界定符。
跟在q或Q后面的字符是分界符.分界符可以是任意一个非字母数字的单字节字符.如:[,{,(,<,!等,
字符串会一直读取到发现相匹配的结束符为止.
=end

#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

desc1 = %Q{Ruby 的字符串可以使用 '' 和 ""。}
desc2 = %q|Ruby 的字符串可以使用 '' 和 ""。|

puts desc1
puts desc2

=begin
字符串内建方法
我们需要有一个 String 对象的实例来调用 String 方法。下面是创建 String 对象实例的方式：
new [String.new(str="")]
这将返回一个包含 str 副本的新的字符串对象。现在，使用 str 对象，我们可以调用任意可用的实例方法。例如：
=end

#!/usr/bin/ruby

myStr = String.new("THIS IS TEST")
foo = myStr.downcase

puts "#{foo}"

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=begin
Ruby 数组（Array）
Ruby 数组是任何对象的有序整数索引集合。数组中的每个元素都与一个索引相关，并可通过索引进行获取。
数组的索引从 0 开始，这与 C 或 Java 中一样。一个负数的索相对于数组的末尾计数的，也就是说，索引为 -1 表示数组的最后一个元素，-2 表示数组中的倒数第二个元素，依此类推。
Ruby 数组可存储诸如 String、 Integer、 Fixnum、 Hash、 Symbol 等对象，甚至可以是其他 Array 对象。
Ruby 数组不需要指定大小，当向数组添加元素时，Ruby 数组会自动增长。
=end

#>>创建数组
#有多种方式创建或初始化数组。一种方式是通过 new 类方法：
#	names = Array.new
#您可以在创建数组的同时设置数组的大小：
#	names = Array.new(20)
#数组 names 的大小或长度为 20 个元素。您可以使用 size 或 length 方法返回数组的大小：

#!/usr/bin/ruby

names = Array.new(20)
puts names.size  # 返回 20
puts names.length # 返回 20

#您可以给数组中的每个元素赋值，如下所示：
#!/usr/bin/ruby

names = Array.new(4, "mac")

puts "#{names}"

#您也可以使用带有 new 的块，每个元素使用块中的计算结果来填充：

#!/usr/bin/ruby

nums = Array.new(10) { |e| e = e * 2 }

puts "#{nums}"

#数组还有另一种方法，[]，如下所示：
nums = Array.[](1, 2, 3, 4,5)

#数组创建的另一种形式如下所示：
nums = Array[1, 2, 3, 4,5]

#>>数组内建方法
#我们需要有一个 Array 对象的实例来调用 Array 方法。下面是创建 Array 对象实例的方式：
#Array.[](...) [or] Array[...] [or] [...]
#这将返回一个使用给定对象进行填充的新数组。现在，使用创建的对象，我们可以调用任意可用的方法。例如：

#!/usr/bin/ruby

digits = Array(0..9)

num = digits.at(6)

puts "#{num}"

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
=begin
Ruby 哈希（Hash）

哈希（Hash）是类似 "key" => "value" 这样的键值对集合。哈希类似于一个数组，只不过它的索引不局限于使用数字。
Hash 的索引（或者叫"键"）几乎可以是任何对象。
Hash 虽然和数组类似，但却有一个很重要的区别：Hash 的元素没有特定的顺序。 如果顺序很重要的话就要使用数组了。
=end

#创建哈希
#①与数组一样，有各种不同的方式来创建哈希。您可以通过 new 类方法创建一个空的哈希：

months = Hash.new
puts months     #输出{}

#②您也可以使用 new 创建带有默认值的哈希，不带默认值的哈希是 nil：

months = Hash.new( "month" )
puts "#{months[0]}"

#或

months = Hash.new "month"
puts "#{months[0]}"

#!/usr/bin/ruby

H = Hash["a" => 100, "b" => 200]

puts "#{H['a']}"
puts "#{H['b']}"

=begin
哈希内置方法
如果需要调用 Hash 方法，需要先实例化一个 Hash 对象。下面是创建 Hash 对象实例的方式：
Hash[[key =>|, value]* ] or

Hash.new [or] Hash.new(obj) [or]

Hash.new { |hash, key| block }
=end
#这将返回一个使用给定对象进行填充的新的哈希。现在，使用创建的对象，我们可以调用任意可用的方法。例如：

#!/usr/bin/ruby

$, = ", "
months = Hash.new( "month" )

months = {"1" => "January", "2" => "February"}

keys = months.keys

puts "#{keys}"

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=begin
>>Ruby 日期 & 时间（Date & Time）

Time 类在 Ruby 中用于表示日期和时间。它是基于操作系统提供的系统日期和时间之上。
该类可能无法表示 1970 年之前或者 2038 年之后的日期。
本教程将让您熟悉日期和时间的所有重要的概念。
=end

#创建当前的日期和时间
#下面是获取当前的日期和时间的简单实例：

#!/usr/bin/ruby -w
# -*- coding: UTF-8 -*-

time1 = Time.new

puts "当前时间 : " + time1.inspect

# Time.now 功能相同
time2 = Time.now
puts "当前时间 : " + time2.inspect

#获取 Date & Time 组件
#我们可以使用 Time 对象来获取各种日期和时间的组件。请看下面的实例：


#!/usr/bin/ruby -w
# -*- coding: UTF-8 -*-

time = Time.new

# Time 的组件
#!/usr/bin/ruby -w
# -*- coding: UTF-8 -*-

time = Time.new

# Time 的组件
puts "当前时间 : " + time.inspect
puts time.year    # => 日期的年份
puts time.month   # => 日期的月份（1 到 12）
puts time.day     # => 一个月中的第几天（1 到 31）
puts time.wday    # => 一周中的星期几（0 是星期日）
puts time.yday    # => 365：一年中的第几天
puts time.hour    # => 23：24 小时制
puts time.min     # => 59
puts time.sec     # => 59
puts time.usec    # => 999999：微秒
puts time.zone    # => "UTC"：时区名称

#Time.utc、Time.gm 和 Time.local 函数
#这些函数可用于格式化标准格式的日期，如下所示：

# July 8, 2008
Time.local(2008, 7, 8)  
# July 8, 2008, 09:10am，本地时间
Time.local(2008, 7, 8, 9, 10)   
# July 8, 2008, 09:10 UTC
Time.utc(2008, 7, 8, 9, 10)  
# July 8, 2008, 09:10:11 GMT （与 UTC 相同）
Time.gm(2008, 7, 8, 9, 10, 11)  

#!/usr/bin/ruby -w

time = Time.new

values = time.to_a
p values

#时区和夏令时
#您可以使用 Time 对象来获取与时区和夏令时有关的所有信息，如下所示：


time = Time.new

# 这里是解释
time.zone       # => "UTC"：返回时区
time.utc_offset # => 0：UTC 是相对于 UTC 的 0 秒偏移
time.zone       # => "PST"（或其他时区）
time.isdst      # => false：如果 UTC 没有 DST（夏令时）
time.utc?       # => true：如果在 UTC 时区
time.localtime  # 转换为本地时区
time.gmtime     # 转换回 UTC
time.getlocal   # 返回本地区中的一个新的 Time 对象
time.getutc     # 返回 UTC 中的一个新的 Time 对象

#格式化时间和日期
#有多种方式格式化日期和时间。下面的实例演示了其中一部分：


#!/usr/bin/ruby -w
time = Time.new

puts time.to_s
puts time.ctime
puts time.localtime
puts time.strftime("%Y-%m-%d %H:%M:%S")

#时间算法
#您可以用时间做一些简单的算术，如下所示：
now = Time.now           # 当前时间
puts now

past = now - 10          # 10 秒之前。Time - number => Time
puts past

future = now + 10        # 从现在开始 10 秒之后。Time + number => Time
puts future

diff = future - now      # => 10  Time - Time => 秒数
puts diff

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=begin
>>Ruby 范围（Range）
	范围（Range）无处不在：a 到 z、 0 到 9、等等。Ruby 支持范围，并允许我们以不同的方式使用范围：
		作为序列的范围
		作为条件的范围
		作为间隔的范围
=end

#作为序列的范围
#范围的第一个也是最常见的用途是表达序列。序列有一个起点、一个终点和一个在序列产生连续值的方式。
#Ruby 使用 ''..'' 和 ''...'' 范围运算符创建这些序列。两点形式创建一个包含指定的最高值的范围，三点形式创建一个不包含指定的最高值的范围。
puts (1..5)        #==> 1, 2, 3, 4, 5
puts (1...5)       #==> 1, 2, 3, 4
puts ('a'..'d')    #==> 'a', 'b', 'c', 'd'

#序列 1..100 是一个 Range 对象，包含了两个 Fixnum 对象的引用。如果需要，您可以使用 to_a 方法把范围转换为列表。尝试下面的实例：
#!/usr/bin/ruby

range1 = (1..10).to_a
range2 = ('bar'..'bat').to_a

puts "#{range1}"
puts "#{range2}"

#范围实现了让您可以遍历它们的方法，您可以通过多种方式检查它们的内容：
#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

# 指定范围
digits = 0..9

puts digits.include?(5)
ret = digits.min
puts "最小值为 #{ret}"

ret = digits.max
puts "最大值为 #{ret}"

ret = digits.reject {|i| i < 5 }
puts "不符合条件的有 #{ret}"

digits.each do |digit|
   puts "在循环中 #{digit}"
end

#>>作为条件的范围
#范围也可以用作条件表达式。例如，下面的代码片段从标准输入打印行，其中每个集合的第一行包含单词 start，最后一行包含单词 end.：
#while gets
#   print if /start/../end/
#end

#范围可以用在 case 语句中：

#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

score = 70

result = case score
when 0..40
	"糟糕的分数"
when 41..60
	"快要及格"
when 61..70
	"及格分数"
when 71..100
   "良好分数"
else
	"错误的分数"
end

puts result

#作为间隔的范围
#范围的最后一个用途是间隔检测：检查指定值是否在指定的范围内。需要使用 === 相等运算符来完成计算。

#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

if ((1..10) === 5)
  puts "5 在 (1..10)"
end

if (('a'..'j') === 'c')
  puts "c 在 ('a'..'j')"
end

if (('a'..'j') === 'z')
  puts "z 在 ('a'..'j')"
end
