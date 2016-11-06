=begin
Ruby 面向对象
Ruby 是纯面向对象的语言，Ruby 中的一切都是以对象的形式出现。Ruby 中的每个值都是一个对象，即使是最原始的东西：字符串、数字，甚至连 true 和 false 都是对象。类本身也是一个对象，是 Class 类的一个实例。本章将向您讲解所有与 Ruby 面向对象相关的主要功能。
类用于指定对象的形式，它结合了数据表示法和方法，把数据整理成一个整齐的包。类中的数据和方法被称为类的成员。
Ruby 类定义
当您定义一个类时，您实际是定义了一个数据类型的蓝图。这实际上并没有定义任何的数据，而是定义了类的名称意味着什么，也就是说，定义了类的对象将由什么组成，以及在该对象上能执行什么操作。
类定义以关键字 class 开始，后跟类名称，最后以一个 end 进行分隔表示终止该类定义。例如，我们使用关键字 class 来定义 Box 类，如下所示：
class Box
   code
end
=end

#ruby对象的定义
#	new方法
#	allocate

#ruby构造器 -- initialize 方法
class Box
   def initialize(w,h)
      @width, @height = w, h
   end
end

#实例变量
class Box
   def initialize(w,h)
      # 给实例变量赋值
      @width, @height = w, h
   end
end

#实例方法
#实例方法的定义与其他方法的定义一样，都是使用 def 关键字，但它们只能通过类实例来使用，如下面实例所示。它们的功能不限于访问实例变量，也能按照您的需求做更多其他的任务。
#!/usr/bin/ruby -w

# 定义类
class Box
   # 构造方法
   def initialize(w,h)
      @width, @height = w, h
   end
   # 实例方法
   def getArea
      @width * @height
   end
end

# 创建对象
box = Box.new(10, 20)

# 调用实例方法
a = box.getArea()
puts "Area of the box is : #{a}"

#访问器(accessor) & 设置器(setter)方法，相当于Java中的get()和set()方法

#类方法&类变量&类常量
=begin
类变量是在类的所有实例中共享的变量。换句话说，类变量的实例可以被所有的对象实例访问。类变量以两个 @ 字符（@@）作为前缀，类变量必须在类定义中被初始化，如下面实例所示。
类方法使用 def self.methodname() 定义，类方法以 end 分隔符结尾。类方法可使用带有类名称的 classname.methodname 形式调用，如下面实例所示：
=end

#!/usr/bin/ruby -w

class Box
   # 初始化类变量
   @@count = 0
   def initialize(w,h)
      # 给实例变量赋值
      @width, @height = w, h

      @@count += 1
   end

   def self.printCount()
      puts "Box count is : #@@count"
   end
end

# 创建两个对象
box1 = Box.new(10, 20)
box2 = Box.new(30, 100)

# 调用类方法来输出盒子计数
Box.printCount()

=begin
>>类常量

您可以在类的内部定义一个常量，通过把一个直接的数值或字符串值赋给一个变量来定义的，常量的定义不需要使用 @ 或 @@。按照惯例，常量的名称使用大写。
一旦常量被定义，您就不能改变它的值，您可以在类的内部直接访问常量，就像是访问变量一样，但是如果您想要在类的外部访问常量，那么您必须使用 classname::constant，如下面实例所示。
=end

#!/usr/bin/ruby -w

# 定义类
class Box
   BOX_COMPANY = "TATA Inc"
   BOXWEIGHT = 10
   # 构造器方法
   def initialize(w,h)
      @width, @height = w, h
   end
   # 实例方法
   def getArea
      @width * @height
   end
end

# 创建对象
box = Box.new(10, 20)

# 调用实例方法
a = box.getArea()
puts "Area of the box is : #{a}"
puts Box::BOX_COMPANY
puts "Box weight is: #{Box::BOXWEIGHT}"

#to_s 方法 相当于Java中的tostring方法

#访问控制
=begin
Ruby 为您提供了三个级别的实例方法保护，分别是 public、private 或 protected。Ruby 不在实例和类变量上应用任何访问控制。
Public 方法： Public 方法可被任意对象调用。默认情况下，方法都是 public 的，除了 initialize 方法总是 private 的。
Private 方法： Private 方法不能从类外部访问或查看。只有类方法可以访问私有成员。
Protected 方法： Protected 方法只能被类及其子类的对象调用。访问也只能在类及其子类内部进行。
下面是一个简单的实例，演示了这三种修饰符的语法：
=end

#!/usr/bin/ruby -w

# 定义类
class Box
   # 构造器方法
   def initialize(w,h)
      @width, @height = w, h
   end

   # 实例方法默认是 public 的
   def getArea
      getWidth() * getHeight
   end

   # 定义 private 的访问器方法
   def getWidth
      @width
   end
   def getHeight
      @height
   end
   # make them private
   private :getWidth, :getHeight

   # 用于输出面积的实例方法
   def printArea
      @area = getWidth() * getHeight
      puts "Big box area is : #@area"
   end
   # 让实例方法是 protected 的
   protected :printArea
end

# 创建对象
box = Box.new(10, 20)

# 调用实例方法
a = box.getArea()
puts "Area of the box is : #{a}"

# 尝试调用 protected 的实例方法
box.printArea()

#类的继承

#!/usr/bin/ruby -w

# 定义类
class Box
   # 构造器方法
   def initialize(w,h)
      @width, @height = w, h
   end
   # 实例方法
   def getArea
      @width * @height
   end
end

# 定义子类
class BigBox < Box

   # 添加一个新的实例方法
   def printArea
      @area = @width * @height
      puts "Big box area is : #@area"
   end
end

# 创建对象
box = BigBox.new(10, 20)

# 输出面积
box.printArea()

#方法重载
#!/usr/bin/ruby -w

# 定义类
class Box
   # 构造器方法
   def initialize(w,h)
      @width, @height = w, h
   end
   # 实例方法
   def getArea
      @width * @height
   end
end

# 定义子类
class BigBox < Box

   # 改变已有的 getArea 方法
   def getArea
      @area = @width * @height
      puts "Big box area is : #@area"
   end
end

# 创建对象
box = BigBox.new(10, 20)

# 使用重载的方法输出面积
box.getArea()



#运算符重载
class Box
  def initialize(w,h) # 初始化 width 和 height
    @width,@height = w, h
  end

  def +(other)         # 定义 + 来执行向量加法
    Box.new(@width + other.width, @height + other.height)
  end

  def -@               # 定义一元运算符 - 来对 width 和 height 求反
    Box.new(-@width, -@height)
  end

  def *(scalar)        # 执行标量乘法
    Box.new(@width*scalar, @height*scalar)
  end
end

#冻结对象
=begin
有时候，我们想要防止对象被改变。在 Object 中，freeze 方法可实现这点，它能有效地把一个对象变成一个常量。任何对象都可以通过调用 Object.freeze 进行冻结。冻结对象不能被修改，也就是说，您不能改变它的实例变量。
您可以使用 Object.frozen? 方法检查一个给定的对象是否已经被冻结。如果对象已被冻结，该方法将返回 true，否则返回一个 false 值。下面的实例解释了这个概念：
=end
#!/usr/bin/ruby -w

# 定义类
class Box
   # 构造器方法
   def initialize(w,h)
      @width, @height = w, h
   end

   # 访问器方法
   def getWidth
      @width
   end
   def getHeight
      @height
   end

   # 设置器方法
   def setWidth=(value)
      @width = value
   end
   def setHeight=(value)
      @height = value
   end
end

# 创建对象
box = Box.new(10, 20)

# 让我们冻结该对象
box.freeze
if( box.frozen? )
   puts "Box object is frozen object"
else
   puts "Box object is normal object"
end

# 现在尝试使用设置器方法
box.setWidth = 30
box.setHeight = 50

# 使用访问器方法
x = box.getWidth()
y = box.getHeight()

puts "Width of the box is : #{x}"
puts "Height of the box is : #{y}"

=begin
类信息
Ruby的 self 和 Java 的 this 有相似之处，但又大不相同。Java的方法都是在实例方法中引用，所以this一般都是指向当前对象的。而Ruby的代码逐行执行，所以在不同的上下文(context)self就有了不同的含义。让我们来看看下面的实例：.
=end

#!/usr/bin/ruby -w

class Box
   # 输出类信息
   puts "Class of self = #{self.class}"
   puts "Name of self = #{self.name}"
end

#当上面的代码执行时，它会产生以下结果：
#Class of self = Class
#Name of self = Box

#这意味着类定义可通过把该类作为当前对象来执行，同时也意味着元类和父类中的该方法在方法定义执行期间是可用的
