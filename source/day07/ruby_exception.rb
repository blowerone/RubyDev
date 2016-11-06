=begin
>>Ruby 异常

异常和执行总是被联系在一起。如果您打开一个不存在的文件，且没有恰当地处理这种情况，那么您的程序则被认为是低质量的。
如果异常发生，则程序停止。异常用于处理各种类型的错误，这些错误可能在程序执行期间发生，所以要采取适当的行动，而不至于让程序完全停止。
Ruby 提供了一个完美的处理异常的机制。我们可以在 begin/end 块中附上可能抛出异常的代码，并使用 rescue 子句告诉 Ruby 完美要处理的异常类型。
【语法】
begin #开始
 
 raise.. #抛出异常
 
rescue [ExceptionType = StandardException] #捕获指定类型的异常 缺省值是StandardException
 $! #表示异常信息
 $@ #表示异常出现的代码位置
 retry  # 这将把控制移到 begin 的开头
else #其余异常 如果提供了 else 子句，它一般是放置在 rescue 子句之后，任意 ensure 之前。
		子句的主体只有在代码主体没有抛出异常时执行。
 ..
ensure #不管有没有异常，进入该代码块（相当于finally）
 
end #结束
从 begin 到 rescue 中的一切是受保护的。如果代码块执行期间发生了异常，控制会传到 rescue 和 end 之间的块。
对于 begin 块中的每个 rescue 子句，Ruby 把抛出的异常与每个参数进行轮流比较。如果 rescue 子句中命名的异常与当前抛出的异常类型相同，或者是该异常的父类，则匹配成功。
如果异常不匹配所有指定的错误类型，我们可以在所有的 rescue 子句后使用一个 else 子句。
=end

#!/usr/bin/ruby

begin
   file = open("/unexistant_file")
   if file
      puts "File opened successfully"
   end
rescue
      file = STDIN
end
print file, "==", STDIN, "\n"
