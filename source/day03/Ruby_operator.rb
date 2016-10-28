#Ruby 运算符
=begin
① Ruby算术算术运算符
	**	指数 - 执行指数计算	a**b 将得到 10 的 20 次方
② Ruby比较运算符
	<=>	联合比较运算符。如果第一个操作数等于第二个操作数则返回 0，如果第一个操作数大于第二个操作数则返回 1，如果第一个操作数小于第二个操作数则返回 -1。	(a <=> b) 返回 -1。
	===	用于测试 case 语句的 when 子句内的相等。	(1...10) === 5 返回 true。
	.eql?	如果接收器和参数具有相同的类型和相等的值，则返回 true。	1 == 1.0 返回 true，但是 1.eql?(1.0) 返回 false。
	equal?	如果接收器和参数具有相同的对象 id，则返回 true。	如果 aObj 是 bObj 的副本，那么 aObj == bObj 返回 true，a.equal?bObj 返回 false，但是 a.equal?aObj 返回 true。
③ Ruby 赋值运算符
	
④ Ruby 并行赋值

⑤ Ruby 位运算符
	&与操作 |或操作 ^异或操作 ~反操作 << 左移运算符 >> 右移运算符
⑥ Ruby 逻辑运算符
	and	称为逻辑与运算符。如果两个操作数都为真，则条件为真。
or	称为逻辑或运算符。如果两个操作数中有任意一个非零，则条件为真。
&&	称为逻辑与运算符。如果两个操作数都非零，则条件为真。
||	称为逻辑或运算符。如果两个操作数中有任意一个非零，则条件为真。
!	称为逻辑非运算符。用来逆转操作数的逻辑状态。如果条件为真则逻辑非运算符将使其为假。
not	称为逻辑非运算符。用来逆转操作数的逻辑状态。如果条件为真则逻辑非运算符将使其为假。

⑦ Ruby 三元运算符

⑧ Ruby 范围运算符
	在 Ruby 中，序列范围用于创建一系列连续的值 - 包含起始值、结束值（视情况而定）和它们之间的值。
	在 Ruby 中，这些序列是使用 ".." 和 "..." 范围运算符来创建的。两点形式创建的范围包含起始值和结束值，三点形式创建的范围只包含起始值不包含结束值。

⑨ Ruby defined?运算符
	defined? 是一个特殊的运算符，以方法调用的形式来判断传递的表达式是否已定义。它返回表达式的描述字符串，如果表达式未定义则返回 nil。

⑩ Ruby 点运算符 "." 和双冒号运算符 "::"
	您可以通过在方法名称前加上模块名称和一条下划线来调用模块方法。您可以使用模块名称和两个冒号来引用一个常量。
	:: 是一元运算符，允许在类或模块内定义常量、实例方法和类方法，可以从类或模块外的任何地方进行访问。
	请记住：在 Ruby 中，类和方法也可以被当作常量。
	您只需要在表达式的常量名前加上 :: 前缀，即可返回适当的类或模块对象。
	如果未使用前缀表达式，则默认使用主 Object 类。
=end

#------------------------code------------------------------
#Ruby 并行赋值
=begin
a, b, c = 10, 20, 30
puts a,b,c

a,b = b,c
puts a,b,c 
=end

=begin
#Ruby范围运算符

1..10

1...10

#Ruby defined?
foo = 42
puts defined? foo    # => "local-variable"
puts defined? $_     # => "global-variable"
puts defined? bar 

puts defined? puts    # => "method"    
puts defined? puts(bar)  
puts defined? unpack

# 如果存在可被 super 用户调用的方法，则为 True
puts defined? super
=end

#Ruby 点运算符 "." 和双冒号运算符 "::"
# 简单点 全局变量在类内使用时需要使用::来限定。::其实就是作用域符号
# 在类内或者方法内未使用::，定义的变量就是局部变量，作用域就是类内或者方法内部


#第一个实例
MR_COUNT = 0        # 定义在主 Object 类上的常量 Ruby_operator.rb:81: warning:previous definition of MR_COUNT was here
module Foo
  MR_COUNT = 0      # 							 Ruby_operator.rb:81: warning:previous definition of MR_COUNT was here
  ::MR_COUNT = 1    # 设置全局计数为 1  			 Ruby_operator.rb:81: warning:already initialized constant MR_COUNT
  MR_COUNT = 2      # 设置局部计数为 2 			 Ruby_operator.rb:81: warning:already initialized constant Foo::MR_COUNT
end
puts MR_COUNT       # 这是全局常量
puts Foo::MR_COUNT  # 这是 "Foo" 的局部常量  


=begin
CONST = ' out there'
class Inside_one
   CONST = proc {' in there'}
   def where_is_my_CONST
      ::CONST + ' inside one'
   end
end
class Inside_two
   CONST = ' inside two'
   def where_is_my_CONST
      CONST
   end
end
puts Inside_one.new.where_is_my_CONST    #out there inside one
puts Inside_two.new.where_is_my_CONST	  #inside two
puts Object::CONST + Inside_two::CONST   #out there inside two
puts Inside_two::CONST + CONST				#inside two out there
puts Inside_one::CONST						##<Proc:0x1b504c0@Ruby_operator.rb:88>
puts Inside_one::CONST.call + Inside_two::CONST #in there inside two
=end

