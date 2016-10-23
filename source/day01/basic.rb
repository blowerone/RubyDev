puts "你好，世界！";

#Ruby 中的 Here Document

print <<EOF
    这是第一种方式创建here document 。
    多行字符串。
EOF

print <<"EOF";                # 与上面相同 Ruby 把分号和换行符解释为语句的结尾。
    这是第二种方式创建here document 。
    多行字符串。
EOF

print <<`EOC`;                 # 执行命令
	echo hi there
	echo lo there
EOC

print <<"foo", <<"bar"	      # 您可以把它们进行堆叠
	I said foo.
foo
	I said bar.
bar

#Ruby BEGIN 语句 注释

=begin
语法
BEGIN {
   code
}
声明 code 会在程序运行之前被调用。
=end

puts "This is main Ruby Program"

BEGIN{
	puts "Initializaing Ruby Program"
}

#Ruby END 语句
puts "This is main Ruby Program"

BEGIN{
	puts "Initializaing Ruby Program"
}
END{
	puts"Terminating Ruby Program"
}

