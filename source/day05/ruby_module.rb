=begin
Ruby ģ�飨Module��
ģ�飨Module����һ�ְѷ�������ͳ��������һ��ķ�ʽ��ģ�飨Module��Ϊ���ṩ������ô���
	ģ���ṩ��һ�������ռ�ͱ������ֳ�ͻ��
	ģ��ʵ���� mixin װ�á�
ģ�飨Module��������һ�������ռ䣬�൱��һ��ɳ�У���������ķ����ͳ��������������ط��ķ���������ͻ��
ģ���������࣬����һ�²�ͬ��
	ģ�鲻��ʵ����
	ģ��û������
	ģ��ֻ�ܱ���һ��ģ�鶨��
	
�﷨
module Identifier
   statement1
   statement2
   ...........
end
ģ�鳣���������ೣ���������ƣ��Դ�д��ĸ��ͷ���������忴����Ҳ���ƣ�ģ�鷽���������෽���������ơ�
ͨ���෽�������������෽������ǰ�����ģ�����ƺ�һ�����������ģ�鷽����������ʹ��ģ�����ƺ�����ð��������һ��������
=end

#ruby require���

=begin
Ruby require ���
require ��������� C �� C++ �е� include ����Լ� Java �е� import ��䡣���һ���������ĳ�����Ҫʹ���κ��Ѷ����ģ�飬����Լ򵥵�ʹ�� Ruby require ���������ģ���ļ���

�﷨

require filename

������ļ���չ�� .rb ���Ǳ���ġ�
=end


$LOAD_PATH << '.' #���������ʹ�� $LOAD_PATH << '.' �� Ruby ֪�������ڵ�ǰĿ¼�����������õ��ļ������������ʹ�� $LOAD_PATH����ô������ʹ�� require_relative ����һ�����Ŀ¼�����ļ���

require 'trig.rb'
require 'moral'

y = Trig.sin(Trig::PI/4)    #ע��ģ����ģ�鷽����ģ�鳣���ĵ��÷�ʽ
wrongdoing = Moral.sin(Moral::VERY_BAD)

=begin
Ruby include ���
������������Ƕ��ģ�顣Ϊ��������Ƕ��ģ�飬������������ʹ�� include ��䣺

�﷨

include modulename

���ģ���Ƕ�����һ���������ļ��У���ô��Ƕ��ģ��֮ǰ����Ҫʹ�� require ������ø��ļ���
��ˣ�Ruby�е�include ����require ���ͬʱ���ֵġ�

=end

#!/usr/bin/ruby
$LOAD_PATH << '.'
require "support"

class Decade
include Week
   no_of_yrs=10
   def no_of_months
      puts Week::FIRST_DAY
      number=10*12
      puts number
   end
end
d1=Decade.new
puts Week::FIRST_DAY
Week.weeks_in_month
Week.weeks_in_year
d1.no_of_months

=begin
Ruby �е� Mixins
���Ķ�����֮ǰ������Ҫ�����˽��������ĸ��
��һ������ԴӶ������̳��������ʱ��������ʾΪ���ؼ̳С�
Ruby ��ֱ��֧�ֶ��ؼ̳У����� Ruby ��ģ�飨Module������һ������Ĺ��ܡ������������˶��ؼ̳е���Ҫ���ṩ��һ����Ϊ mixin ��װ�á�
Ruby û������ʵ�ֶ��ؼ̳л��ƣ����ǲ��ó�Ϊmixin������Ϊ���Ʒ����ģ��include���ඨ���У�ģ���еķ�����mix�������С�
�����ǿ��������ʾ�����룬�����˽� mixin��

module A
   def a1
   end
   def a2
   end
end
module B
   def b1
   end
   def b2
   end
end

class Sample
include A
include B
   def s1
   end
end

samp=Sample.new
samp.a1
samp.a2
samp.b1
samp.b2
samp.s1
ģ�� A �ɷ��� a1 �� a2 ��ɡ�
ģ�� B �ɷ��� b1 �� b2 ��ɡ�
�� Sample ������ģ�� A �� B��
�� Sample ���Է��������ĸ��������� a1��a2��b1 �� b2��
��ˣ������Կ����� Sample �̳�������ģ�飬������˵�� Sample ʹ���˶��ؼ̳л� mixin ��
=end
