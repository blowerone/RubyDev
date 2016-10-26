#Ruby 类和对象

#1、类的定义和方法的定义 

=begin
	class Customer 类的定义
	end
	
	def method   方法的定义
	end
=end

#2、Ruby类中的变量

=begin
Ruby 提供了下列类型的变量：
局部变量：局部变量是在方法中定义的变量。
			局部变量在方法外是不可用的。在后续的章节中，您将看到有关方法的更多细节。局部变量以小写字母或 _ 开始。
实例变量：实例变量可以跨任何特定的实例或对象中的方法使用。未初始化的实例变量的值为 nil，在使用 -w 选项后，会产生警告。
			这意味着，实例变量可以从对象到对象的改变。实例变量在变量名之前放置符号（@）。
类变量：  类变量可以跨不同的对象使用。且必须初始化后才能在方法定义中使用，引用一个未初始化的类变量会产生错误。类变量在定义它的类或模块的子类或子模块中可共享使用。在使用 -w 选项后，重载类变量会产生警告。
			类变量属于类，且是类的一个属性。类变量在变量名之前放置符号（@@）。
全局变量：类变量不能跨类使用。未初始化的全局变量的值为 nil，在使用 -w 选项后，会产生警告。
			如果您想要有一个可以跨类使用的变量，您需要定义全局变量。全局变量总是以美元符号（$）开始。
常量：    常量不能定义在方法内。引用一个未初始化的常量会产生错误。对已经初始化的常量赋值会产生警告。

Ruby 伪变量
它们是特殊的变量，有着局部变量的外观，但行为却像常量。您不能给这些变量赋任何值。
	self: 当前方法的接收器对象。
	true: 代表 true 的值。
	false: 代表 false 的值。
	nil: 代表 undefined 的值。
	__FILE__: 当前源文件的名称。
	__LINE__: 当前行在源文件中的编号。
=end

#3、对象的实例化
#	new无参                            e.g cust1 = Customer. new
#	new带参数，需要定义initialize()    e.g 

#!/usr/bin/ruby

class Customer
   @@no_of_customers=0   # 类变量
   def initialize(id, name, addr) #局部变量
      @cust_id=id      #实例变量
      @cust_name=name
      @cust_addr=addr
   end
   def display_details()
      puts "Customer id #@cust_id"  #实例变量的显示，变量名前增加#符号
      puts "Customer name #@cust_name"
      puts "Customer address #@cust_addr"
   end
   def total_no_of_customers()
      @@no_of_customers += 1
      puts "Total number of customers: #@@no_of_customers" #类变量的显示，变量名前增加#符号
   end
end

# 创建对象
cust1=Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
cust2=Customer.new("2", "Poul", "New Empire road, Khandala")

# 调用方法
cust1.display_details()
cust1.total_no_of_customers()
cust2.display_details()
cust2.total_no_of_customers()

#  *在 Ruby 中，您可以通过在变量或常量前面放置 # 字符，来访问任何变量或常量的值
