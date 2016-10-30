=begin
Ruby 块

Ruby 有一个块的概念。
	1、块由大量的代码组成。
	2、您需要给块取个名称。
	3、块中的代码总是包含在大括号 {} 内。
	4、块总是在与其具有相同名称的函数中调用。这意味着如果您的块名称为 test，那么您要使用函数 test 来调用这个块。
	5、可以使用 yield 语句来调用块。

语法
block_name{
   statement1
   statement2
   ..........
}
=end

#yield 语句，无参数

def test
   puts "在 test 方法内"
   yield
   puts "你又回到了 test 方法内"
   yield
end
test {puts "你在块内"}

#结果
#在 test 方法内
#你在块内
#你又回到了 test 方法内
#你在块内

#yield 语句，有参数

def test
   yield 5
   puts "在 test 方法内"
   yield 100
end
test {|i| puts "你在块 #{i} 内"}

#结果
#你在块 5 内
#在 test 方法内
#你在块 100 内

#注：如果您想要传递多个参数，那么 yield 语句如下所示：
#yield a, b
#此时，块如下所示：
#test {|a, b| statement}

#但是如果方法的最后一个参数前带有 &，那么您可以向该方法传递一个块，且这个块可被赋给最后一个参数。如果 * 和 & 同时出现在参数列表中，& 应放在后面。

def test(&block)
   block.call
end
test { puts "Hello World!"}

# 结果Hello World!

=begin

BEGIN 和 END 块
每个 Ruby 源文件可以声明当文件被加载时要运行的代码块（BEGIN 块），以及程序完成执行后要运行的代码块（END 块）。
#!/usr/bin/ruby

BEGIN { 
  # BEGIN 代码块
  puts "BEGIN 代码块"
} 

END { 
  # END 代码块
  puts "END 代码块"
}
  # MAIN 代码块
puts "MAIN 代码块"
一个程序可以包含多个 BEGIN 和 END 块。BEGIN 块按照它们出现的顺序执行。END 块按照它们出现的相反顺序执行。当执行时，上面的程序产生产生以下结果：
BEGIN 代码块
MAIN 代码块
END 代码块

=end













