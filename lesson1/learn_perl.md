## 基本知识

- Perl 借用了 `C、sed、awk、shell` 脚本以及很多其他编程语言的特性，语法与这些语言有些类似，也有自己的特点。
- Perl 程序有声明与语句组成，程序自上而下执行。
- Perl 没有严格的格式规范，你可以根据自己喜欢的风格来缩进。
- Perl 的命令语句可以在关键字后使用括号包裹，也可以直接接在关键字空格后。
- Perl 是一种弱类型语言，一般变量不需要指定类型，Perl 解释器会根据上下文自动选择匹配类型。

----

- 为了使脚本更具维护可能，文件头应使用声明。

```perl
#! /usr/bin/env perl

use strict;
use warnings;
use diagnostics;
```

- 脚本每一行结尾均应使用 `;` 标记。
- 单行注释 `#`，多行注释，首行 `=pod ... =cut` 之后 `=xxx ... =cut`。
- **vscode 的 `perl` 插件不能格式化包含任何中文的脚本**。
- 你操作变量变量就会变😅，操作后直接原地赋值。
- 下面与 `shell` 类似
  - 变量不管在哪里使用均应使用 `$` 作为开头。
  - 双引号可以解析转义符和变量，单引号不行。
- 下面和 `python` 类似
  - 变量名组成单元：英文字母`a~z`，`A~Z`，数字`0~9`和下划线`_`。
  - 变量名由英文字母或下划线开头。
  - 变量名区分大小写，`$runoob` 与 `$Runoob` 表示两个不同变量。
  - 变量仅在首次声明时需要 `my local our state`

### 命令行执行

```shell
perl -e <command>
```

### 占位符

```perl
%c: # character??
%s: # 字符串
%u: # 无符整数 最大：18446744073709551615
%d: # 十进制整数
%f: # 十进制浮点 最小：.1000000000000001
%e: # 科学计数法浮点
```

### 打印

- `print` 与 `say` 的区别，`say` 自带换行。
- `printf` print with format，类型自动转换，但字符不行。

### 多行输入

又称为 Here 文档，具体使用方法与 `shell` 类似。

```perl
my $var <<"<char>";
THIS
MULTI
LINE
<char>
```

**注意**：
- 如果空格和分行出现在字符串内，会原样输出。
- END可以用任意其它字符代替，只需保证结束标识与开始标识一致。
- 开始标识可以不带引号号或带单双引号，不带引号与带双引号效果一致。
  - 不带双引号解释内嵌的变量和转义符号，
  - 带单引号则不解释内嵌的变量和转义符号。
- 结束标识必须顶格独自占一行(即必须从行首开始，前后不能衔接任何空白和字符)。
- 引号外的空格，tab ，空行等，解释器将换忽略。
- 当内容需要内嵌引号（单引号或双引号）时，不需要加转义符，本身对单双引号转义，此处相当与q和qq的用法。

## 数据类型

### 整数

Perl 实际上把整数存在你的计算机中的浮点寄存器中，所以实际上被当作浮点数看待。

可分为：
- 无符整数
- 整数

----

- 在多数计算机中，浮点寄存器可以存贮约 16 位数字，长于此的被丢弃。
- 整数实为浮点数的特例。

```perl
$var1 = 047;    # 八进制，等于十进制的39
$var2 = 0x1f;   # 十六进制，等于十进制的31
```

### 浮点

浮点数可分为：
- 浮点：11.4、-0.3、.3、3.
- 科学计数法浮点：54.1e+02、5.41E03

----

- 浮点寄存器通常不能精确地存贮浮点数，从而产生误差，在运算和比较中要特别注意。
- 指数的范围通常为 -309 到 +308。

### 字符串

| 符号 | 说明 |
| :--: | :--- |
| `\\` | 反斜线 |
| `\'` | 单引号 |
| `\"` | 双引号 |
| `\a` | 系统响铃 |
| `\b` | 退格 |
| `\f` | 换页符 |
| `\n` | 换行 |
| `\r` | 回车 |
| `\t` | 水平制表符 |
| `\v` | 垂直制表符 |
| `\0nn` | 创建八进制格式的数字 |
| `\xnn` | 创建十六进制格式的数字 |
| `\cX` | 控制字符，x可以是任何字符 |
| `\u` | 强制下一个字符为大写 |
| `\l` | 强制下一个字符为小写 |
| `\U` | 强制将所有字符转换为大写 |
| `\L` | 强制将所有的字符转换为小写 |
| `\Q` | 将到\E为止的非单词（non-word）字符加上反斜线 |
| `\E` | 结束\L、\U、\Q |

#### v 字符串
一个以 v 开头,后面跟着一个或多个用句点分隔的整数,会被当作一个字串文本。

当你想为每个字符 直接声明其数字值时,v-字串提供了一种更清晰的构造这类字串的方法，而不像 `\x{1}\x{14}\x{12c}\x{fa0}` 这种

## 变量

- 变量是存储在内存中的数据，创建一个变量即会在内存上开辟一个空间。
- 还会根据变量的类型来决定其在内存中的存储空间。
- 由于 Perl 为每个变量类型设置了独立的命名空间，所以不同类型的变量可以使用相同的名称。
- 变量可以不显式声明类型，在变量赋值后，解释器会自动分配匹配的类型空间。
- 我们可以在程序中使用 `use strict` 语句让所有变量需要强制声明类型。
- 变量使用等号 `=` 来赋值。

----

- perl 中存在已预定义的特殊字符，如 `__FILE__` `__LINE__` 和 `__PACKAGE__` 分别表示当前执行脚本的文件名，行号，包名。
- 特殊字符不能写在字符串中。

### 变量类型

#### scalar

最基本的变量类型，可以是数字，字符串，浮点数，不作严格的区分。
标量可以通过 `.` 进行拼接。

```perl
my $var1 = "hello";
my $var2 = "world";
print $var1 . $var2;
```

#### array

索引从 0 开始，同 `python`。
负数从反向开始读取，自 -1 开始。
通过上下文关系，可以获取数组大小和数组最大索引。
访问数组多个元素时每个索引值使用逗号隔开。
连续的索引，可以使用 `..` 来表示指定范围。

Perl 提供了一些有用的函数来添加和删除数组元素。

使用 `$var[index]` 访问数组内变量。
可以使用语法糖 `qw//` 定义数组，它返回字符串列表，数组元素以空格分隔。也可以一行一个数组元素。


```perl
# 创建
my @array1 = (var1, var2);
my @array2 = qw/这是 一个 数组/;
my @array3 = qw/这是
一个
数组/;
print $array1[1];
```

元素替换使用 `splice()` 函数。
字符串转换数组同样使用 `splice()` 。
数组转换字符串使用 `join()`。

数组元素排序使用 `sort()` 。
默认规则根据 `ASCII` 数字值来排序。所以排序前最好先将每个元素转换为小写后再排序。

$[ 表示数组的第一索引值，默认值为 0，新版 Perl 中，该变量已废弃。

```perl
# 类似 shell
my @array4 = (1..10);
my @array5 = (a..j);

# 输出数组大小
my $size = @array4;
my $max_index = $#array4;

say @array4;
say $size;
say $max_index;
say $array4[1];
# 12345678910
# 10
# 9
# 2

push @ARRAY, LIST         # 将列表放到数组末尾，
unshift @ARRAY, LIST      # 将列表放在数组前面，返回新数组的元素个数
pop @ARRAY                # 弹出数组最后一个值
shift @ARRAY              # 弹出数组第一个值，返回弹出值。数组的索引值也依次减一

# 替换
# OFFSET：起始位置
# LENGTH：替换的元素个数
# LIST：替换元素列表
splice @ARRAY, OFFSET [ , LENGTH [ , LIST ] ];

# 字符串转换数组
# PATTERN：分隔符，默认为空格
# EXPR：指定字符串数
# LIMIT：如果指定该参数，则返回该数组的元素个数
split [ PATTERN [ , EXPR [ , LIMIT ] ] ];


# 数组转换字符串
# EXPR：连接符
# LIST：列表或数组
join EXPR, LIST;

# 数组排序
# SUBROUTINE：指定规则
# LIST：列表或数组
sort [ SUBROUTINE ] LIST
```

#### hash

是一个无序的键值对集合。
可以使用键作为下标获取值。
使用 `$var{key}` 访问数组内键值对。

删除元素使用 `delete` 函数。

读取单个键值对通过 `@hash{key}` 的形式进行读取。
读取所有key使用 `keys` 函数。
读取哈希所有的值使用 `values` 函数。
通过上下文关系，获取 `key` 或 `value` 的大小间接获取 `hash` 大小。

在哈希中读取不存在的键值对，会返回 `undefined`，在执行时会有警告提醒。
使用 `exists` 函数来判断key是否存在。

```perl
my %hash = (
  'name1' => var1,
  'name2' => var2
);
my $hash2{"key"} = "value";
my $hash3{-key} = "value";
print $hash{name1};

# 读取所有key，返回所有 key 组成的数组。
keys %hash;

# 判断键值对，返回布尔值
exists $hash3{-kay};

# 删除元素
delete $hash3{-kay};
```
### 变量语法糖

```perl
# 数值调换
($varn, $varf) = ($varf, $varn);
# 分解数组
($var1, $var2, $var3, $var4, $var5) = @array;
# 数据上下文，批量赋值
($var1, $var2, $var3, $var4, $var5) = func();
```

### 变量上下文

所谓上下文：指的是表达式所在的位置。
上下文是由等号左边的变量类型决定的。

| 上下文 | 描述 |
| :-: | :-: |
| `scalar` | 赋值给一个标量变量，在标量上下文的右侧计算 |
| `array` | 赋值给一个数组或哈希，在列表上下文的右侧计算 |
| `boolean `| 布尔上下文是一个简单的表达式计算，查看是否为 true 或 false |
| `void` | 这种上下文不需要关系返回什么值，一般不需要返回值 |
| `插值` | 这种上下文只发生在引号内 |

## 运算符

### 数学运算

```perl
+ - * / % **             # 加 减 乘 除 取余 幂
+= -= *= /= %= **=       # 自加 自减 自乘 自除

# 位运算
&                        # 二进制 AND 运算符复制一位到结果中
|                        # 二进制 OR 运算符复制一位到结果中
^                        # 二进制异或运算符复制一位到结果中
~                        # 具有”翻转”位效果，即0变成1，1变成0
<< 2                     # 二进制左移运算符。左操作数的值向左移动右操作数指定的位数。
>> 2                     # 二进制右移运算符。左操作数的值向右移动右操作数指定的位数。

# 引号
q{ }                     # 为字符串添加单引号
qq{ }                    # 为字符串添加双引号
qx{ }                    # 为字符串添加反引号

# 其他
++$var                   # 自增
--$var                   # 自减
.                        # 连接两个字符串
x                        # 重复字符串制定次数
..                       # 范围运算符
->                       # 指定一个类的方法
```

### 逻辑运算

数字 `0`, 字符串 `'0'` 、 `""` , 空 `list ()` , 和 `undef` 为 false
其他值均为 true
true 前面使用 ! 或 not 则返回 false

与shell中类似

```perl
# 数字判断
> <  && ||
==                       # 相等判断
>=                       # 大于等于
<=                       # 小于等于
!=                       # 检查两个操作数的值是否相等
<=>                      # 检查两个操作数的值的关系
                         # -1 左边的数小于右边
                         # 0 相等
                         # 1 左边的数大于右边

# 字符判断
eq ne
lt le
gt ge
cmp                      # 检查两个操作数的值的关系
                         # -1 左边的数小于右边
                         # 0 相等
                         # 1 左边的数大于右边

exp                      # e^xx 次幂
log                      # 自然对数
int                      # 取整，非四舍五入
hex                      # 进制转换 10 -> A
oct                      # 进制转换 10 -> 12
rand                     # 随机数
sqrt                     # 开方
```

判断语句

```perl
if (){}
if (){} else {}
if (){} elsif (){} else {}

# 反转的if
unless (){}
unless (){} else {}
unless (){} elsif (){} else {}

# 与 shell 中 case 类似
# 当匹配 case 后，如果我们需要继续执行接下来的 case 语句，则需要添加 next 语句
switch(argument){
  case 1            { print "数字 1" }
  case "a"          { print "字符串 a" }
  case [1..10,42]   { print "数字在列表中" }
  case (\@array)    { print "数字在数组中" }
  case /\w+/        { print "正则匹配模式" }
  case qr/\w+/      { print "正则匹配模式" }
  case (\%hash)     { print "哈希" }
  case (\&sub)      { print "子进程" }
  else              { print "不匹配之前的条件" }
}
```

### 三元运算符

```perl
(condition ? TRUE : FALSE ;)
```

## 循环

```perl
for( init; condition; increment ){
  # phrase
}
# 无限循环
for( ;;; ){
  # phrase
}

for my $i (@array){
  say $i;
}

for (@array){
  say $_;
}

foreach my $i (@array){
  say $i;
}

while(){
  # phrase
}

do {
  # phrase
} while()

do {
  # phrase
} until()

# break
last;

# 在条件语句再次判断前执行
# 什么玩意，直接写在循环里面不就可以了吗😅
foreach $a (@list){
  # phrase
} continue {
  # phrase
}
while (condition){
  # phrase
} continue {
  # phrase
}

# 停止执行从next语句的下一语句开始到循环体结束标识符之间的语句
# 转去执行continue语句块
# 然后再返回到循环体的起始处开始执行下一次循环。
next;

# 直接转到循环体的第一行开始重复执行本次循环
# redo语句之后的语句不再执行，continue语句块也不再执行
# 相当于 python 中的 continue，什么玩意🤔
redo;

# 有三种 goto 形式
goto LABLE;
goto <express>;
goto $var;
```


## 函数

函数在 perl 内被称作子程序，这里沿用其他语言里的通用称呼“函数”。

- perl 的函数没有指定函数传入参数顺序和类型的括号。
- 其传入参数通过在函数体内使用 `@_` 数组进行使用。
- 当传递参数仅为一个 hash 时，它将复制到 `@_` 中，hash 将被展开为键/值组合的 array 。
- 不论参数是 scalar 还是 array ，默认按引用的方式调用。

----

- 使用 `my` 操作符来设置私有变量，作为局部变量存在。
- `local` 声明的变量可以继续在作用域中调用的子程序中使用。
- `local` 可以更改全局变量在局部作用域中的值，在退出作用域后恢复原值。
- `state` 功能类似于C里面的static修饰符，state关键字将局部变量变得持久。
- 但是 `state` 仅能在函数内创建变量。

----

- 如果没有使用 return 语句，默认最后一行语句将作为返回值。
- 函数在调用过程中，会根据上下文来返回不同类型的值。

```perl
sub func_name {
  #phrases
  return;
}
```

## 引用

对于向函数传入多个 hash 和 array 时，为保留单个参数的数据结构，需要使用引用的方式进行传递。
perl 中的引用就是指针，是一个 scalar 可以指向变量、数组、哈希表（也叫关联数组）甚至函数、文件句柄、正则表达式，可以应用在程序的任何地方。

- 对于不同类型的变量其引用格式大体一致，基本都是 `$<ref_var> = \<var_type><var>` 。
- 所有的引用变量都是标量。
- 在使用引用内数据时，格式为 `<var_type>$<ref_var>` 。

----

- 判断引用变量类型使用 `ref` 函数。
- 如果没有引用，返回 false。

![pic](https://img2018.cnblogs.com/blog/733013/201809/733013-20180925223416690-1483634481.png)

```perl
$scalarref = \$foo;     # 标量变量引用
$arrayref  = \@ARGV;    # 列表的引用
$hashref   = \%ENV;     # 哈希的引用
$coderef   = \&handler; # 函数引用
$globref   = \*foo;     # GLOB句柄引用

# 引用变量内部值使用
$$scalarref             # 标量变量内部值引用
@$arrayref              # 列表的内部值引用
%$hashref               # 哈希的内部值引用
&$coderef               # 函数内部值引用
*$globref               # GLOB句柄内部值引用

# 判断引用变量类型
ref($ref_var)
SCALAR                # 标量
ARRAY                 # 数组
HASH                  # 哈希
CODE                  # 函数
GLOB                  # 句柄
REF                   # 引用
```

### 两引用比较

由于引用在数值上下文返回引用对象的地址空间，所以可以用 `==` 来比较引用，使用 `eq` 来比较也完全可以。

### 引用计数器

在perl中，对每段数据的引用都会维护一个引用计数器：

- 创建数据对象时，赋值给初始化数组、hash时，引用数为1。
- 每次引用、赋值引用、拷贝引用等操作，引用数加1。
- 赋值为 `undef`，则显式取消引用关系，引用数减1。
- 引用有作用域。
- 引用计数器不为 0 时，数据对象所占用的内存就不会释放。当引用计数为 0 时，perl 将回收该内存空间，==但不会交还给操作系统==。
- 引用作为函数的参数时，引用会赋值给 `@_` ，引用计数会加 1，当退出函数时，`@_` 将失效，引用计数器减 1。

对于使用引用计数器进行内存回收机制，它最大的优点在于：
- 即刻回收：只要数据对象的引用计数器为0了，就会立刻被回收。
- 暂停时长很短：因为回收速度时无需遍历内存，所以负责回收的工作效率很高。

但最大的缺点在于：
- 因为要频繁增、减计数，负责增、减的工作压力非常大
- 无法回收循环引用。

> 但是相比于引用计数管理内存的方式，GC 回收机制都是在内存不够后，遍历整个内存来回收的，所以有延迟性和低效性 (虽然有好几种改进的GC，但都各有优缺点，不过原始的GC算法就是如此)。
> 其实无论是引用计数还是 GC，都对它们各自的缺点有各种改进，但修补缺陷的同时，也会损伤它们的优点，所以不同语言针对不同适用场景，总是采用不同的折衷手段。

至于循环引用，是 `a = \b; b = \a;` 这种形式的引用，这时任何一个变量在非主动更改引用状态时均不会发生引用计数器归零的状态。致使内存持续占用，最终导致：内存泄漏(memory leak)。

为避免这个可以有三种解决方案：
- 弱引用(weak)
- 直接清空初始引用
- 在引用的内部清空引用数据

![](https://img2018.cnblogs.com/blog/733013/201809/733013-20180926164556174-985776891.png)

要检查是否出现内存泄漏问题，可以使用 `Test::Memory::Cycle` 模块。

```perl
# 在引用的内部清空引用数据
{
  @name1=qw(longshuai wugui);
  @name2=qw(xiaofang tuner);
  $name1_ref=\@name1;
  $name2_ref=\@name2;

  # 使用引用变量，而非初始的数组名引用
  push @name1,$name1;
  push @name2,$name2;

  # 退出作用域之前，在引用的内部清空引用数据
  $name1=undef;
  $name2=undef;
}

# 快捷操作
my $ref_foo2 = \my $foo2;
```

## 格式化输出

Perl 是一个非常强大的文本数据处理语言。
可以使用 `format` 来定义一个模板，然后使用 `write` 按指定模板输出数据。

### 格式行语法

以 `@` 或者 `^` 开头，这些行不作任何形式的变量代换。
- `@` 字段(与数组符号 `@` 不同)是普通的字段。
- `^` 字段用于多行文本块填充。
  - `@,^` 后的 `<, >,|` 长度决定了字段的长度，如果变量超出定义的长度，那么它将被截断。
  - `<, >,|` 还分别表示；左对齐，右对齐，居中对齐。
  - `###.###` 固定精度数字
  - `*` 多行文本

### 格式变量

按照输出先后进行排序：
1. `$^L ($FORMAT_FORMFEED)`: 在每一页(除了第一页)表头之前需要输出的字符串
2. `$^ ($FORMAT_TOP_NAME)`: 指定表头格式
3. `$~ ($FORMAT_NAME)`: 指定输出格式，不指定时，会输出名为 `STDOUT` 的格式
4. `$% ($FORMAT_PAGE_NUMBER)`: 指定输出的页号
5. `$= ($FORMAT_LINES_PER_PAGE)`: 指定每页中的行数
6. `$| ($FORMAT_AUTOFLUSH)`: 是否自动刷新输出缓冲区存储

```perl
# FormatName: 格式化名称
# fieldline: 一个格式行，用来定义一个输出行的格式，类似 @,^,<,>,| 这样的字符
# value_one,value_two……: 数据行，用来向前面的格式行中插入值，都是perl的变量，非必须可空
# .: 结束符号。
format FormatName =
fieldline
value_one, value_two, value_three
fieldline
value_one, value_two
.

# 输出示例
my $name;
my $age;
my $salary;

# 指定默认文件变量下所使用的格式
format EMPLOYEE =
===================================
@<<<<<<<<<<<<<<<<<<<<<< @<<
$name, $age
@#####.##
$salary
===================================
.

# 指定默认文件表头变量下所使用的格式
format EMPLOYEE_TOP =
===================================
Name                    Age Page @<
                                 $%
===================================
.

# select 指定默认文件变量
select(STDOUT);

# 输出 $~ 输出格式
$~ = "EMPLOYEE";
# 输出 $^ 表头格式
$^ = "EMPLOYEE_TOP";
my @n = ( "Ali",   "it",    "Jaffer" );
my @a = ( 20,      30,      40 );
my @s = ( 2000.00, 2500.00, 4000.000 );
my $i = 0;

foreach (@n) {
    $name   = $_;
    $age    = $a[$i];
    $salary = $s[ $i++ ];
    write;
}
```

### 输出

默认情况下函数 `write` 将结果输出到标准输出文件 `STDOUT`，如需要输出至文件，则需要将文件变量作为参数传递给 `write`。

当 `write` 使用含文件变量的输出时，会打印与变量同名的格式。`$~` 里指定的值被忽略。
当使用 `select` 改变默认文件变量时，它返回当前默认文件变量的内部表示，此时的文件 `STDOUT` 将作为文件变量的引用，使得函数内部随意执行输出，同时不影响程序的其它部分。

```perl
if ( open( MYFILE, ">>/path/to/tmp" ) ) {
    # 使得默认文件变量的打印输出到MYFILE中
    select(MYFILE);
    $~ = "OTHER";
    # 默认文件变量，打印到select指定的文件中，必使用$~指定的格式 OTHER
    write;
    format OTHER =
=================================
  使用定义的格式输入到文件中
=================================
.
    close MYFILE;
}
```

## 字符串扩展

- `chop` 只是去除最后一个字符
- `chomp` 就要首先判断最后一个字符是不是为 `\n`，他才去除

## 时间

```perl
time()                # 返回从1970年1月1日起累计的秒数
localtime()           # 获取本地时区时间
gmtime()              # 获取格林威治时间

sec                   # 秒， 0 到 61
min                   # 分钟， 0 到 59
hour                  # 小时， 0 到 24
mday                  # 天， 1 到 31
mon                   # 月， 0 到 11
year                  # 年，从 1900 开始
wday                  # 星期几，0-6,0表示周日
yday                  # 一年中的第几天,0-364,365
isdst                 # 如果夏令时有效，则为真
```

## 文件操作

Perl 使用文件句柄类型变量来操作文件。
读取文件或者向文件写入数据需要将文件转换为文件句柄。
文件句柄(file handle)是一个 `I/O` 连接的名称。
存在三种文件句柄，这点与 `shell` 一致：
1. STDIN: 标准输入
2. STDOUT: 标准输出
3. STDERR: 标准出错输出

文件句柄使用 `<file_holder>` 的形式进行访问。
文件句柄读取一次，起始地址 +1，即读取下一行，perl里默认是一行一行读取文本的。可以设置间隔符 `$/`，使之不是 `\n`。
当我们使用 `<file_holder>` 操作符时，它会返回文件句柄中每一行的列表。

### open

| MODE | 描述 |
| :--: | :--- |
| `< r` | 只读，指针指向文件头 |
| `> w` | 只写，指针指向文件头并覆写文件，文件不存在则创建 |
| `>> a` | 读写，指针指向文件末，文件不存在则创建 |
| `+< r+` | 读写，指针指向文件头 |
| `+> w+` | 读写，指针指向文件头，文件不存在则创建 |
| `+>> a+` | 读写，指针指向文件末，文件不存在则创建 |

```perl
# file_holder: 文件句柄，用于存放一个文件唯一标识符
# EXPR: 文件名及文件访问类型组成的表达式
# MODE: 文件访问类型
open file_holder, MODE, file_name;
open file_holder, EXPR;
open file_holder;

# 示例
open( DATA, "<test.md" )
  or die "test.md open filed, $!";
while (<DATA>) {
    print $_;
}
```

### sysopen

sysopen 函数类似于 open 函数，只是它们的参数形式不一样。

| MODE | 描述 |
| :--: | :--- |
| `O_RDONLY` | 只读，指针指向文件头 |
| `O_WRONLY` | 只写，指针指向文件头并截取文件大小为零，文件不存在则创建 |
| `O_APPEND` | 追加文件，指针指向文件末 |
| `O_RDWR` | 读写，指针指向文件头 |
| `O_CREAT` | 创建文件 |
| `O_TRUNC` | 截取文件大小为零 |
| `O_EXCL` | 使用 `O_CREAT` 时文件存在，返回错误信息，测试文件是否存在 |
| `O_NONBLOCK` | 非阻塞 `I/O`，操作成功，否则立即返回错误 |

`PERMS` 参数为八进制属性值，表示文件创建后的权限，默认为 `0x666`，仅在 `Linux` 上可用。

```perl
# PERMS: 访问权限位(permission bits)
sysopen file_holder, path, MODE, PERMS;
sysopen file_holder, path, MODE;
```

### close

文件使用完后，要关闭文件，以刷新与文件句柄相关联的输入输出缓冲区。

```perl
close file_holder;
close;
```

----

向文件句柄写入数据时主要使用 `print`。

```perl
print file_holder LIST;
print LIST;
print;
```

----

从缓存中读取文件句柄信息时使用 `read`，这个函数用于从文件读取二进制数据。

读取成功返回读取的字节数，
在文件结尾时返回 `0`，
发生错误时返回 `undef`

```perl
# FILEHANDLE: 文件句柄
# SCALAR: 存贮结果，未指定OFFSET时，数据自SCALAR的开头存储
#         指定后，数据存储于SCALAR自OFFSET字节之后位置
# LENGTH: 读取的内容长度
# OFFSET: 偏移量
read FILEHANDLE, SCALAR, LENGTH, OFFSET
read FILEHANDLE, SCALAR, LENGTH
```

----

`getc` 用于从指定的 `FILEHANDLE` 返回单个字符，如果没指定返回 `STDIN`。
在连续访问时会自增。

```perl
getc FILEHANDLE
getc

# 示例
# 文件内容：This is test.
open( FILE, "</tmp/test.txt" ) || die "Enable to open test file";
$char = getc( FILE );
print "First Charctaer is $char\n";
$char = getc( FILE );
print "Second Charctaer is $char\n";

# First Charctaer is T
# Second Charctaer is h
```


### 文件复制

```perl
# 只读方式打开文件
open( DATA1, "<file1.txt" );
# 打开新文件并写入
open( DATA2, ">file2.txt" );

# 拷贝数据
while (<DATA1>) {
    print DATA2 $_;
}

close(DATA1);
close(DATA2);
```

### 文件重命名

```perl
rename ("/usr/it/test/file1.txt", "/usr/it/test/file2.txt");
```

### 删除文件

```perl
unlink ("/usr/it/test/file1.txt");
```

### 文件句柄内操作

`tell` 用于获取当前指针在文件句柄中的位置。
`seek` 用于移动指针在文件内的的位置。

```perl
# FILEHANDLE: 文件句柄
# POSITION: 表示指针要移动的字节数
# WHENCE: 表示指针开始移动时的起始位置
#         0  文件头
#         1  当前位置
#         2  文件尾
seek FILEHANDLE, POSITION, WHENCE;

# 示例
# 文件内容：This is test.
open( FILE, "</tmp/test.txt" ) || die "Enable to open test file";
# Now check the poistion of read poiter.
$position = tell( FILE );
print "Position with in file $position\n";
seek FILE, 4, 1;
$position = tell( FILE );
print "Position with in file $position\n";
close(FILE);

# Position with in file 2
# Position with in file 6
```

### 文件信息

| 操作符 | 描述 |
| :--: | :--- |
| `-e` | 文件或目录名是否存在 |
| `-d` | 是否为目录 |
| `-l` | 是否为符号链接 |
| `-f` | 是否为普通文件 |
| `-T` | 是否为文本文件 |
| `-B` | 是否为二进制文件 |
| `-A` | 上一次被访问的时间(单位：天) |
| `-M` | 上一次被修改的时间(单位：天) |
| `-C` | 索引节点(inode)修改时间(单位：天)，仅 Linux |
| `-O` | 所属用户UID |
| `-o` | 所属用户UID是否有效 |
| `-R` | 所属用户及用户组UID/GID |
| `-r` | 所属用户及用户组UID/GID是否有效 |
| `-W` | 拥有写入权限，用户及用户组UID/GID |
| `-w` | 拥有写入权限，用户及用户组UID/GID是否有效 |
| `-X` | 拥有执行权限，用户及用户组UID/GID |
| `-x` | 拥有执行权限，用户及用户组UID/GID是否有效 |
| `-p` | 是否为命名管道(FIFO) |
| `-S` | 是否为socket(套接字) |
| `-b` | 是否为block-special (特殊块)文件(如挂载磁盘) |
| `-c` | 是否为character-special (特殊字符)文件(如I/O 设备) |
| `-g` | 文件或目录是否具有setgid属性 |
| `-u` | 文件或目录是否具有setuid属性 |
| `-k` | 文件或目录是否设置sticky位 |
| `-s` | 文件或目录存在且不为0(返回字节数) |
| `-t` | 文件句柄为TTY(系统函数isatty()的返回结果；不能对文件名使用这个测试) |
| `-z` | 文件存在，大小为0(目录恒为false)，即是否为空文件， |

以上选项主要用于进行文件信息判断，也可以用于文件信息获取。

```perl
# 示例
my $FILE = "/path/to/file";
print -M $FILE;
if ( -e $FILE ){
  # phrase
}
```

## 目录操作

类似于文件句柄，目录也存在目录句柄。
通过 `opendir` 可以创建目录句柄。

文件操作符 `glob` 提供相当于 `shell` 中的指定多个文件的“通配符”语法功能，文件操作符 `glob` 将返回与所指定的 `glob` 文件模式相匹配的所有文件的 `array`。

```perl
opendir DIRHANDLE, EXPR               # 打开目录
readdir DIRHANDLE                     # 读取目录
rewinddir DIRHANDLE                   # 定位指针到开头
telldir DIRHANDLE                     # 返回目录的当前位置
seekdir DIRHANDLE, POS                # 定位指定到目录的 POS 位置
closedir DIRHANDLE                    # 关闭目录

mkdir DIRHANDLE                       # 创建目录
rmdir DIRHANDLE                       # 删除目录
chdir DIRHANDLE                       # 切换目录

# 示例1
opendir( Dir, "/home/site" );
my @Files = readdir(Dir);
closedir(Dir);
foreach my $Cur (@Files) {
    my $File = "/home/globtest" . $Cur;
    open( IN, $File );
    while (<IN>) {
        # phrase
    }
    close(IN);
}
# 示例2
# 相当于 shell 中 ls /home/site/*.fasta
@files = glob "/home/site/*.fasta";
# 显示 /tmp 和 /home 目录下的所有文件
$dir = "/tmp/* /home/*";
@files = glob( $dir );
```

## 错误处理

`warn` 用于触发警告信息，输出到 `STDERR`，通常用于给用户提示。
`die` 类似于 `warn`, 但它会执行退出。一般用作错误信息的输出。

```perl
chdir('/etc') or warn "无法切换目录";
open(DATA, $file) || die "Error: 无法打开文件 - $!";
```

### crap 模块

标准 `Carp` 模块提供了 `warn()` 和 `die()` 函数的替代方法，它们在提供错误定位方面提供更多信息，而且更加友好。
当在模块中使用时，错误消息中包含模块名称和行号。

#### crap & cluck

`carp` 可以输出程序的跟踪信息，类似于 `warn` 函数，通常会将该信息发送到 `STDERR`。

`cluck` 与 `warn` 类似，提供了从产生错误处的**栈回溯追踪**。

```perl
package T;
require Exporter;
@ISA = qw/Exporter/;
@EXPORT = qw/function/;
use Carp;
sub function {
  carp "Error in module!";
  cluck "Error in module!";
}
1;

use T;
function();
# Error in module! at test.pl line 4
# Error in module! at T.pm line 9
#     T::function() called at test.pl line 4
```


```perl
```

#### croak & confess

`croak` 与 `die` 一样，可以结束脚本。

`confess` 与 `die` 类似，但提供了从产生错误处的**栈回溯追踪**。

```perl
package T;
require Exporter;
@ISA = qw/Exporter/;
@EXPORT = qw/function/;
use Carp;
sub function {
  croak "Error in module!";
  confess "Error in module!";
}
1;

use T;
function();
# Error in module! at test.pl line 4
# Error in module! at T.pm line 9
#     T::function() called at test.pl line 4
```

## 特殊变量

Perl 语言中定义了一些特殊的变量，通常以 `$`，`@` 或 `%` 作为前缀，例如：`$_`。

特殊变量可以分为以下几类：
- 全局标量特殊变量
- 全局数组特殊变量
- 全局哈希特殊变量
- 全局特殊文件句柄
- 全局特殊常量
- 正则表达式特殊变量
- 文件句柄特殊变量

| 特殊符号 | 描述 |
| :--: | :--- |
| `$ARG $_` | 默认输入和模式匹配内容 |
| `$OS_ERROR or $ERRNO $!` | 包含 `errno` 的数字值，系统错误字符串值 |
| `$CHILD_ERROR $?` | 返回上一个外部命令的状态 |
| `$EVAL_ERROR $@` | `eval` 的错误消息。为空，则表示上一次 `eval` 执行成功 |
| `$PROCESS_ID or $PID $$` | 运行当前Perl脚本程序的进程号 |
| `$REAL_USER_ID or $UID $<` | 当前进程的实际用户ID |
| `$EFFECTIVE_USER_ID or $EUID $>` | 当前进程的有效用户ID |
| `$REAL_GROUP_ID or $GID $(` | 当前进程的实际用户组ID |
| `$EFFECTIVE_GROUP_ID or $EGID $) `| 当前进程的有效用户组ID |
| `$PROGRAM_NAME $0` | 包含正在执行的脚本的文件名 |
| `$[` | 数组第一个元素的下标，默认为 0 |
| `$PERL_VERSION $] `| Perl的版本号 |
| `$^M` | 备用内存池的大小 |
| `$OSNAME $^O `| 操作系统名 |
| `$PERLDB $^P` | 指定当前调试值的内部变量 |
| `$^H` | 由编译器激活的语法检查状态 |
| `$INPLACE_EDIT $^I `| 内置控制编辑器的值 |
| `$BASETIME $^T` | 从新世纪开始算起，脚步本以秒计算的开始运行的时间 |
| `$EXECUTABLE_NAME $^X` | Perl二进制可执行代码的名字 |
| `$ARGV` | 从默认的文件句柄中读取时的当前文件名 |
| ----------------------- | ------------------------------------------ |
| `$NR $.` | 前一次读取文件句柄当前行号 |
| `$RS $/` | 输入记录分隔符，默认是新行字符 |
| `$OFS $,` | 输出域分隔符 |
| `$ORS $\` | 输出记录分隔符 |
| `$LIST_SEPARATOR $"` | 类似 `$,`，应用于向双引号字符串(或类似的内插字符串)中内插数组和切片值。默认为一个空格 |
| `$SUBSCRIPT_SEPARATOR $; `| 在仿真多维数组时使用的分隔符。默认为 `\034` |
| `$FORMAT_FORMFEED $^L `| 发送到输出通道的走纸换页符。默认为 `\f` |
| `$FORMAT_LINE_BREAK_CHARACTERS $:` | The current set of characters after which a string may be broken to fill continuation fields (starting with ^) in a  format. Default is `\n`.|
| `$ACCUMULATOR $^A` | 打印前用于保存格式化数据的变量 |
| `$SYSTEM_FD_MAX $^F` | 最大的文件捆述符数值 |
| `$DEBUGGING $^D `| 调试标志的值 |
| `$EXTENDED_OS_ERROR $^E` | 在非UNIX环境中的操作系统扩展错误信息 |
| `$WARNING $^W` | 警告开关的当前值 |
| ----------------------- | ------------------------------------------ |
| `$OFMT $#` | **已废弃**打印数字时默认的数字输出格式 |
| **==================** | **==========================** |
| `@ARGV` | 传入脚本的命令行参数列表 |
| `@INC` | 导入模块时库所在的检索目录列表 |
| `@F` | 命令行的数组输入 |
| **==================** | **==========================** |
| `%INC` | 包含所有用`do`或`require`语句包含的文件。`key`是文件名，`value`是文件的路径 |
| `%ENV` | 包含当前环境变量 |
| `%SIG` | 信号列表及其处理方式 |
| **全局特殊文件句柄** | **==========================** |
| `ARGV` | 用于遍历数组变量 `@ARGV` 中的所有文件名的特殊文件句柄 |
| `STDERR` | 标准错误输出句柄 |
| `STDIN` | 标准输入句柄 |
| `STDOUT` | 标准输出句柄 |
| `DATA` | 引用了在文件中 `END` 标志后的任何内容包含脚本内容。或者引用一个包含文件中 `DATA` 标志后的所有内容，只要你在同一个包有读取数据，`DATA` 就存在 |
| `_` | 用于缓存文件信息(fstat、stat和lstat) |
| **全局特殊常量** | **==========================** |
| `__END__` | 结束脚本逻辑，后面文本被忽略 |
| `__FILE__` | 当前文件名 |
| `__LINE__` | 当前行号 |
| `__PACKAGE__` | 当前包名，默认为 `main` |
| **文件句柄特殊变量** | **==========================** |
| `$OUTPUT_AUTOFLUSH $|` | 为 0 时，每次调用函数 `write` 或 `print` 后，自动调用函数 `fflush` 将所写内容写回文件 |
| `$FORMAT_PAGE_NUMBER $%` | 当前输出页号 |
| `$FORMAT_LINES_PER_PAGE $=` | 当前每页长度。默认为 60 |
| `$FORMAT_LINES_LEFT $- `| 当前页剩余的行数 |
| `$FORMAT_NAME $~` | 当前报表输出格式的名称。默认值为 `STDOUT` |
| `$FORMAT_TOP_NAME $^` | 当前报表输出表头格式的名称。默认值为带后缀 `_TOP` 的文件句柄名 |
| **正则表达式特殊变量** | **==========================** |
| `$n` | 包含上次模式匹配的第n个子串 |
| `$MATCH $&` | 前一次成功模式匹配的字符串 |
| `$PREMATCH $` `| 前次匹配成功的子串之前的内容 |
| `$POSTMATCH $’` | 前次匹配成功的子串之后的内容 |
| `$+` | 与上个正则表达式搜索格式匹配的最后一个括号。例如：`/Version: (.)|Revision: (.)/&&($rev= $+);` |

很多特殊的变量有英文名别名，如需使用英文别名可在程序头部添加 `use English;`。

以下是未显示声明 Perl 也会默认使用 `$_` 的地方：
- 在迭代循环中，当前循环的字符串会放在 `$` 中
- `print` 在不指定输出变量时，默认情况下使用 `$`
- 下划线在特定操作中可以省略
- 各种单目函数，如 `ord()` 和 `int()`
- 除 `-t` 以外所有文件测试操作 (`-f`，`-d`)，`-t` 默认操作 `STDIN`
- 各种列表函数，如 `print()` 和 `unlink()`
- 没有使用 `=~` 运算符时的模式匹配操作 `m//`、`s///` 和 `tr///`
- 没有给出其他变量作为 `foreach` 的默认迭代变量
- `grep()` 和 `map()` 函数的隐含迭代变量
- 当 `while` 仅有唯一条件，且该条件是对 “” 操作的结果进行测试时，`$_` 就是存放输入记录的默认位置

## 正则表达式

Perl语言的正则表达式功能非常强大，基本上是常用语言中最强大的，很多语言设计正则式支持的时候都参考Perl的正则表达式。
这里就可以见到 Perl 参考 `sek` 和 `awk` 的部分。

Perl的正则表达式的三种形式：
- 匹配：`m//`（还可以简写为 `//` ，略去m）
- 替换：`s///`
- 转化：`tr///`
这三种形式一般都和相匹配 `=~` 或不匹配 `!~` 搭配使用。

### 匹配

在匹配表达式末尾还有模式匹配修饰符。
一些常用的模式匹配修饰符，如下表

| 修饰符 | 描述 |
| :--: | :--- |
| `i` | 忽略模式中的大小写 |
| `m` | 多行模式 |
| `o` | 仅赋值一次 |
| `s` | 单行模式，`.`匹配`\n`（默认不匹配） |
| `x` | 忽略模式中的空白 |
| `g` | 全局匹配 |
| `cg` | 全局匹配失败后，允许再次查找匹配串 |

perl处理完后会给匹配到的值存在三个特殊变量名:
- `$``: 匹配部分的前一部分字符串
- `$&`: 匹配的字符串
- `$’`: 还没有匹配的剩余字符串

```perl
my $string = "welcome to runoob site.";
$string =~ m/run/;
print "匹配前的字符串: $`\n";
print "匹配的字符串: $&\n";
print "匹配后的字符串: $'\n";
# 匹配前的字符串: welcome to 
# 匹配的字符串: run
# 匹配后的字符串: oob site.
```

### 替换

替换操作符 `s/PATTERN/REPLACEMENT/;` 是匹配操作符的扩展，使用新的字符串替换指定的字符串。

类似的，在整个替换表达式末尾还有模式匹配修饰符。

| 修饰符 | 描述 |
| :--: | :--- |
| i | 取消大小写敏感性 |
| m | 多行模式，每一行的开头 `^`，结尾 `$`，默认正则只针对字符串按照 `^` 开始和 `$` 结束进行匹配 |
| o | 表达式只执行一次 |
| s | 使 `.` 代表任意字符，默认代表除了换行符以外的任何字符 |
| x | 忽略表达式中非转义的空白字符 |
| g | 替换所有匹配的字符串 |
| e | 替换字符串作为表达式 |

### 转化

| 修饰符 | 描述 |
| :--: | :--- |
| c | 转化所有**未指定**字符 |
| d | 删除所有指定字符 |
| s | 把多个相同的输出字符缩成一个 |

```perl
my $string = 'welcome to baiyu site.';
$string =~ tr/a-z/A-z/;
print "$string\n";
# WELCOME TO BAIYU SITE.

# 去除重复字符
my $string = 'runoob';
$string =~ tr/a-z/a-z/s;
print "$string\n";
# runob

$string =~ tr/\d/ /c;     # 把所有非数字字符替换为空格
$string =~ tr/\t //d;     # 删除tab和空格
$string =~ tr/0-9/ /cs    # 把数字间的其它字符替换为一个空格。
```

### 常用正则表达式片段

| 表达式 | 描述 |
| :--: | :--- |
| `.` | 匹配除换行符以外的所有字符 |
| `x?` | 匹配 0 次或一次 x 字符串 |
| `x*` | 匹配 0 次或多次 x 字符串,但匹配可能的最少次数 |
| `x+` | 匹配 1 次或多次 x 字符串,但匹配可能的最少次数 |
| `.*` | 匹配 0 次或多次的任何字符 |
| `.+` | 匹配 1 次或多次的任何字符 |
| `{m}` | 匹配刚好是 m 个 的指定字符串 |
| `{m,n}` | 匹配在 m个 以上 n个 以下 的指定字符串 |
| `{m,}` | 匹配 m个 以上 的指定字符串 |
| `[]` | 匹配符合 `[]` 内的字符 |
| `[^]` | 匹配不符合 `[]` 内的字符 |
| `[0-9]` | 匹配所有数字字符 |
| `[a-z]` | 匹配所有小写字母字符 |
| `[^0-9]` | 匹配所有非数字字符 |
| `[^a-z]` | 匹配所有非小写字母字符 |
| `^` | 匹配字符开头的字符 |
| `$` | 匹配字符结尾的字符 |
| `\d` | 匹配一个数字的字符,和 `[0-9]` 语法一样 |
| `\d+` | 匹配多个数字字符串,和 `[0-9]+ `语法一样 |
| `\D` | 非数字,其他同 `\d` |
| `\D+` | 非数字,其他同 `\d+` |
| `\w` | 英文字母或数字的字符串,和 `[a-zA-Z0-9_]` 语法一样 |
| `\w+` | 和 `[a-zA-Z0-9_]+` 语法一样 |
| `\W` | 非英文字母或数字的字符串,和 `[^a-zA-Z0-9_]` 语法一样 |
| `\W+` | 和 `[^a-zA-Z0-9_]+` 语法一样 |
| `\s` | 空格,和 `[\n\t\r\f]` 语法一样 |
| `\s+` | 和 `[\n\t\r\f]+` 一样 |
| `\S` | 非空格,和 `[^\n\t\r\f]` 语法一样 |
| `\S+` | 和 `[^\n\t\r\f]+` 语法一样 |
| `\b` | 匹配以英文字母,数字为边界的字符串 |
| `\B` | 匹配不以英文字母,数值为边界的字符串 |
| `a｜b｜c` | 匹配符合a字符 或是b字符 或是c字符 的字符串 |
| `abc` | 匹配含有 abc 的字符串 (pattern) () 这个符号会记住所找寻到的字符串,是一个很实用的语法.第一个 () 内所找到的字符串变成 $1 这个变量或是 \1 变量,第二个 () 内所找到的字符串变成 $2 这个变量或是 \2 变量,以此类推下去. |
| `/pattern/i` | i 这个参数表示忽略英文大小写,也就是在匹配字符串的时候,不考虑英文的大小写问题. \ 如果要在 pattern 模式中找寻一个特殊字符,如 “*”,则要在这个字符前加上 \ 符号,这样才会让特殊字符失效 |
