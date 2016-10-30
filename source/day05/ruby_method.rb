=begin
在ruby语言中，方法的定义分为如下几种类型:
	注意的方法名应以小写字母开始，若以大写字母开始命名方法名，Ruby可能会把它当作常量
① 语法
def method_name [( [arg [= default]]...[, * arg [, &expr ]])]
   expr..
end
② 种类
	-> 无参方法
	def method_name 
		expr..
    end
	-> 有参方法
		->参数需要传入
		def method_name (var1, var2)
			expr..
		end
		->参数赋值默认值
		def method_name (var1=value1, var2=value2)
			expr..
		end
		->参数可变
		def method_name (*var1)
			expr..
		end
③实例，即使用

method_name 25, 30

=end

# 方法中的参数数量可变
def sample (*test)
   puts "参数个数为 #{test.length}"
   for i in 0...test.length
      puts "参数值为 #{test[i]}"
   end
end
sample "Zara", "6", "F"
sample "Mac", "36", "M", "MCA"

# 方法中参数赋值默认值
def test(a1="Ruby", a2="Perl")
   puts "编程语言为 #{a1}"
   puts "编程语言为 #{a2}"
end
test "C", "C++"  #方法的调用
test				#方法的调用

=begin
Ruby return 语句
Ruby 中的 return 语句用于从 Ruby 方法中返回一个或多个值。

语法
return [expr[`,' expr...]]
如果给出超过两个的表达式，包含这些值的数组将是返回值。如果未给出表达式，nil 将是返回值。

return
#或
return 12
#或
return 1,2,3

=end

def test
   i = 100
   j = 200
   k = 300
return i, j, k
end
var = test
puts var

=begin
当方法定义在类的外部，方法默认标记为 private。另一方面，如果方法定义在类中的，则默认标记为 public。
方法默认的可见性和 private 标记可通过模块（Module）的 public 或 private 改变。
当你想要访问类的方法时，您首先需要实例化类。然后，使用对象，您可以访问类的任何成员。
Ruby 提供了一种不用实例化即可访问方法的方式。让我们看看如何声明并访问类方法：
class Accounts
   def reading_charge
   end
   def Accounts.return_date  #此处就是定义了一个类方法，不需要实例化对象就可以调用
   end
end
我们已经知道方法 return_date 是如何声明的。它是通过在类名后跟着一个点号，点号后跟着方法名来声明的。您可以直接访问类方法，如下所示：
Accounts.return_date
如需访问该方法，您不需要创建类 Accounts 的对象。
=end

=begin

Ruby alias 语句
这个语句用于为方法或全局变量起别名。别名不能在方法主体内定义。即使方法被重写，方法的别名也保持方法的当前定义。
为编号的全局变量（$1, $2,...）起别名是被禁止的。重写内置的全局变量可能会导致严重的问题。
语法
alias 方法名 方法名
alias 全局变量 全局变量

=end

#在这里，我们已经为 bar 定义了别名为 foo，为 $& 定义了别名为 $MATCH。
alias foo bar
alias $MATCH $&

=begin
Ruby undef 语句
这个语句用于取消方法定义。undef 不能出现在方法主体内。
通过使用 undef 和 alias，类的接口可以从父类独立修改，但请注意，在自身内部方法调用时，它可能会破坏程序。
语法
undef 方法名
实例
下面的实例取消名为 bar的方法定义：
undef bar
=end












