#import "../lib.typ": *

= 课程要求

+ 作业一章一交
+ 上课不迟到，上课不看手机，带纸笔
+ 总评= 40%平时成绩，60%期末考试

= 第七章 常微分方程（Ordinary Differential Equation）

Ordinary Differential Equation简称QDE
== 微分方程的基本概念
#definition(
  title: "DE",
)[含有未知函数及其导数或微分的方程称为微分方程(DE)\ 其中出现的未知函数的最高阶导数称为微分方程的阶（Order）]

#example[$y^prime.double x+x^(4)y^prime.triple=114514$ 为四阶]\

$
  #text[微分方程的分类] = cases(
    #text[常微分方程ODE:未知函数是一元函数],
    #text[偏微分方程PDE：未知函数是多元函数],
  )
$

#definition(
  title: "$n$ 阶常微分方程的一般形式",
)[$n$ 阶常微分方程的一般形式:$ F(x,y,y^prime,dots,y^((n)))=0 $ <eq:n-ode> $ y^((n))=f(x,y,y^prime,dots,y^((n))) $
  #note-box[$y^((n))$ 一定会出现，但是其他变量可以不出现]]

$
  #text[ODE分类] = cases(
    #text[线性ODE: @eq:n-ode 的左端函数 $F(x,y,y^prime,dots,y^((n)))$ \  对 $y$ 及它的各阶导数都是一次的],
    ,
    #text[Otherwise ],
  )
$
#definition(title: "Solution")[使DE称为恒等式的函数叫作DE的解（Solution）\
  不含任意常数的解称为特解\
  含有 $n$ 个独立的任意常数的 $n$ 阶方程的解称为通解
  #note-box[通解不一定是全部解，\ #example[$(x+y)y^prime=0$]，$y=-x$特解，$y=#text[Const]$为通解]
]
#definition(title: "定解条件")[
  确定任意常数的条件称为#highlight()[定解条件]\
  常用的定解条件为#highlight()[初值条件]（Initial Condition）

]
@eq:n-ode 的初值条件为
$
  evaluated(y)_(x=x_0) = y_0\
  evaluated(y^prime)_(x=x_0) = y_1 \
  evaluated(y^prime.double)_(x=x_0) = y_2\
  \
  dots \
  evaluated(y^((n-1)))_(x=x_0) = y_(n-1)\
  #text[其中] y_0,y_1,dots,y_(n-1)#text[为已知常数]
$
#definition(title: "初值问题")[
  求DE满足初值条件的解的问题称为#highlight()[初值问题] (Initial Value Problem)
]

#example[
  + 一阶微分方程的初值问题
    $
      cases(
        y^prime=f(x,y),
        evaluated(y)_(x=x_0)=y_0,
      )
    $
  + + 一阶微分方程的初值问题
  $
    cases(
      y^prime.double=f(x,y,y^prime),
      evaluated(y)_(x=x_0)=y_0,
      evaluated(y^prime)_(x=x_0)=y_1,
    )
  $
]
#definition(title: "积分曲线")[
  DE的解的图形在平面上一是条曲线，称之为DE的积分曲线\
  特解：一条积分曲线
  通解：一系列的积分曲线
]

== 一阶微分方程（First-order DE）
一阶微分方程的常见形式：
$ f(x,y,y^prime)=0\ y^prime=f(x,y)\ M(x,y)dd(x) +N(x,y)dd(y)=0 $
=== 可分离变量方程 （Separable DE）
#definition(title: "可分离变量DE")[
  形如$y^prime=f(x)g(y), dv(y, x)=f(x)g(y)$ 的一阶DE称为可分离变量的DE
]
求解之法：
+ 分离变量，若 $g(y)!=0$ 则 $(dd(y))/g(y)=f(x)dd(x)$
+ 积分求通解 $integral dd(y)/(g(y))=integral f(x) dd(x)$
#note-box[若只求通解，不需要判断$g(y)=0$，若需求全部通解，则需要判断$g(y)=0$的情况]
#example[$dv(y, x)=3x^(2)y$求通解]\
#proof(title: "答案")[
  $ integral dd(y)/y = integral 3x^(2) dd(x)\ ln abs(y) =x^(3)+c\ y=plus.minus e^(x^(3)+c)=C_1 e^(x^(3)) $
]

#example[
  求解 $x(y^(2)-1)dd(x)+y(x^(2)-1)dd(y)=0$

]
#proof(title: "答案")[
  + 当 $x!=plus.minus 1,y!=plus.minus$ 时，分离变量容易解得$ ln (abs(x^(2)-1) abs(y^(2)-1))=C_1\ #text[解为] cases(
      (x^(2)-1)(y^(2)-1)=C, x=plus.minus 1 quad y= plus.minus 1
    ) $
]\


#example[
  求 $y^prime=y(1-x)/x$ 的通解
]

#proof(title: "答案")[
  $ dd(y)/y=(1/x-1) dd(x)\ ln abs(y) = ln abs(x) -x + C\ y=plus.minus e^(C) e^(ln abs(x)-x)=C_1 abs(x) e^(-x) $
]

=== 齐次方程(Homogeneous Equation)
#definition(title: "齐次方程")[
  若一个微分方程 $y^prime=f(x,y)$ 可化为 $y^prime=g(y/x)$ <eq:HEdef> 的形式，则称此方程为齐次方程\
  #example[
    $ x dv(y, x)=y ln y/x arrow.double dv(y, x)=y/x ln(y/x)\ z:= y/x quad dv((z x), x)= z+x dv(z, x)= z ln z $
  ]
]
解法：
+ 将方程化为 $dv(y, x)=g(y/x)$
+ 令 $z:=y/x,y=z x quad dv(y, x)=dv((z x), x)=z+x dv(z, x)=g(z)$
+ 此方程一般易解\
  #example[
    $x^(2)dv(y, x)=x y-y^(2)$
  ]
#proof(title: "答案")[
  $
    cases(
      1/z=ln abs(x)+c quad x/y = ln abs(x)+c,
      "when" z=0 quad y=0,
    )
  $
]

#example[
  $y^prime=y/x+tan(y/x)$
]\

#proof(title: "答案")[
  $ ln abs(sin(z))=ln abs(x)+c\ sin y/x=C x $
]

#note-box[
  $forall tau !=0,f(tau x,tau y)=tau^(n) f(x,y)$
  则称 $f(x,y)$ 为 $n$ 次齐次式，相应的微分方程为 $n$ 次齐次方程 \
  解法：对于 $n=1$ 时，令 $tau=1/x,quad f(tau x,tau y)=f(1,y/x)=g(y/x)$

]

=== 准齐次方程(Quasi-homogeneous Equation)
#definition(title: "准齐次方程")[
  形如 $ dv(y, x)=f((a_1x+b_1y+c_1)/(a_2x+b_2y+c_2)) $<eq:qhe> 的方程称为准齐次方程
]
解法 $ cases("when"quad c_1=c_2=0 quad dv(y, x)=f((a_1x+b_1y)/(a_2x+b_2y)) =f((a_1+b_1 y/x)/(a_2+b_2 y/x)) = g(y/x) arrow.double "Homo Equation", "when" c_1 quad c_2"不全为零，通过变量代换化为齐此方程") $
变量代换：消去 $c_1quad c_2$ 即可，所以我们作代换
$ x=XX+Alpha\ y=YY+Beta $
$
  dv(y, x) & =f((a_1(XX+Alpha)+b_1(YY+Alpha)+c_1)/(a_2(XX+Beta)+b_2(YY+Beta)+c_2))                        \
           & =f((Alpha_1 XX+b_1YY+a_1Alpha+b_1Alpha+c_1Alpha)/(Alpha_2 XX+b_2YY+a_2Beta+b_2Beta+c_2Beta))
$
此时只需要满足
$ cases(a_1Alpha+b_1Alpha+c_1Alpha=0, a_2Beta+b_2Beta+c_2Beta=0) $
就有$ dv(y, x) & =f((Alpha_1 XX+b_1YY)/(Alpha_2 XX+b_2YY)) $
成功化为了齐次方程\
那么什么如何解 @eq:qhecon 呢？
我们分为两种情况求解\
定义 $ Delta:=mdet(a_1, b_1; a_2, b_2) $
+ when $Delta=0 arrow.double a_1b_2=a_2b_1$
  - when $a_2=b_2=0$ $ dv(y, x)=f((a_1x+b_1y+c_1)/c_2) $ 令$z:=a_1x+b_1y,dv(z, x)=a_1+b_1f((z+c_1)/c_2)$
  - when $a_2=0,b_2!=0 arrow.double a_1=0$ $ dv(y, x)=f((b_1y+c_1)/(b_2y+c_2))=g(y) #text[分离变量即可解] $
  - when $a_2!=0,b_2=0 arrow.double b_1=0$ 与上一条完全对称 $ dv(y, x)=f((a_1x+c_1)/(a_1x+c_2))=g(x) #text[分离变量即可解] $
  - when $a_2!=0,b_2!=0,arrow.double a_1/a_2=b_1/b_2$ 令 $lambda=a_1/a_2=b_1/b_2$ $ dv(y, x)=f((lambda(a_2x+b_2y)+c_1)/(a_2x+b_2y+c_2))=^(z=a_2x+b_2y)f((lambda z+c_1)/(z+c_2))=g(z)\ dv(z, x)=a_2+b_2 (dv(y, x))=a_2+b_2g(z) #text[分离变量可解] $
+ when $Delta!=0 arrow.double a_1b_2!=a_2b_1$
作代换
$ x=XX+Alpha\ y=YY+Beta $
$
  dv(y, x) & =f((a_1(XX+Alpha)+b_1(YY+Alpha)+c_1)/(a_2(XX+Beta)+b_2(YY+Beta)+c_2))                        \
           & =f((Alpha_1 XX+b_1YY+a_1Alpha+b_1Alpha+c_1Alpha)/(Alpha_2 XX+b_2YY+a_2Beta+b_2Beta+c_2Beta))
$
此时只需要满足
$ cases(a_1Alpha+b_1Alpha+c_1Alpha=0, a_2Beta+b_2Beta+c_2Beta=0) $ <eq:qhecon>
就有$ dv(y, x) & =f((Alpha_1 XX+b_1YY)/(Alpha_2 XX+b_2YY)) $
成功化为了齐次方程\

#example[
  $y^prime=2((y+2)/(x+y-1))$

]\
#proof(title: "答案")[
  $cases(beta+2=0, alpha+beta-1=0)arrow.double cases(alpha=3, beta=-2),cases(x=XX+alpha, y=YY+beta),dv(YY, XX)=2(YY/(XX+YY))^(2) arrow.double^(z=YY/XX) z+XX dv(z, XX)=2(z/(z+1))^(2) arrow.double \ ln(abs(z XX))+2arctan(z)=C$

]

#example[
  $dv(y, x)=(x-y+1)/(x+y-3)$
]\
#proof(title: "答案")[
  $1/2 ln abs(z^(2)+2z-1)=-ln abs(x)+C_1(z=y/x) "or" cases(y=2(sqrt(2)-1)(x-1), y=2+(-1-sqrt(2))(x-1))$
]
=== 一阶线性方程（First-order Linear DE）
#definition(title: "一阶线性方程")[
  $y^prime+P(x)y=Q(x)$ 形式的方程，称为一阶线性微分方程\
  其中 $P(x),Q(x)$ 为某一区间上的连续函数
  + when $Q(x)=0$ 时称为齐次线性方程
  + when $Q(x)!=0$ 时称为非齐次线性方程
]

解法：
+ 解法一
  + 先求解其对应的齐次方程 $dv(y, x)+P(x)y=0$ 易积得$y=C e^(-integral P(x) dd(x))$
  + 常数变易法，令 $y=u(x) e^(-integral P(x) dd(x))$，则 $dv(y, x)=u^prime e^(-integral P(x) dd(x))-P(x)y$
  $
    dv(y, x)+P(x)y=u^prime e^(-integral P(x) dd(x))= Q(x)\ u(x)=integral Q e^(integral P(x) dd(x)) dd(x)+ C \ y=e^(-integral P(x) dd(x)) (integral Q e^(integral P(x) dd(x)) dd(x)+ C)
  $
+ 解法二（当你记不住公式时，这种方法可以快速推导）
  + 我们可以直接注意到，在$dv(y, x)+P(x)y=Q(x)$两边同时乘以$e^(integral P(x)dd(x))$，可以凑微分
$
  e^(integral P(x) dd(x)) dv(y, x)+y P(x) e^(integral P(x) dd(x))= Q(x)e^(integral P(x) dd(x))\ dv(, x)(y e^(integral P(x) dd(x)))= Q(x) e^(integral P(x) dd(x))\ y e^(integral P(x) dd(x))=integral Q(x) e^(integral P(x)dd(x))\ y=e^(-integral P(x) dd(x)) (integral Q e^(integral P(x) dd(x)) dd(x)+ C)
$

#example[
  $dv(y, x)-y/x=x^(2)$
]\
#proof(title: "答案")[
  $dv(y, x)e^(-ln x)-y/x e^(-ln x)=x^(2)e^(-ln x) ,dv(, x)(y e^(-ln x))=x^(2)e^(-ln x),y=e^(ln x)(integral x^(2) e^(-ln x) dd(x)+ C)=1/2 x^(3 )+C x$
]

#example[
  $dv(y, x)=1/(x cos y+sin 2y)$
]\
#proof(title: "答案")[
  $dv(x, y)-x cos y=sin 2y, e^(integral -cos y dd(y)),dv(x, y)e^(sin y)-x cos y e^(sin y)=sin 2y e^(sin y) ,dv(, x)(x e^(sin y))=sin 2y e^(sin y) arrow.double x= e^(-sin y) (integral sin 2y e^(sin y) dd(y)+C)=-2(sin y+1)+C e^(sin y)$
]

#example[
  $y y^prime=y^(2)/x-1+1/x$
]

#proof(title: "答案")[
  $"let"quad z:=y^(2),1/2 z^prime=z/x-1+1/x arrow.double z^prime-2/x z=1/x-1 arrow.double^(integral -2/x dd(x)=-2ln x) z^prime/x^(2) -2/x z/x^(2)=1/x^(3)-1/x^(2)arrow.double dv(, x)(z/x^(2))=integral(1/x^(3)-1/x^(2))dd(x)+C arrow.double z=x^(2)(integral(1/x^(3)-1/x^(2))dd(x)+C)=-1+2x+C x^(2)$
]

#example[
  $y^prime+x sin 2y=x e^(-x^(2))cos^(2) y$
]\

#proof(title: "答案")[
  $y^prime dot 1/(cos^(2) y)+2x tan y=x e^(-x^(2))arrow.double dv(tan y, x)+2x tan y=x e^(-x^(2))arrow.double^(integral 2x dd(x)= x^(2)) dv(, x) (e^(x^(2 )) tan y)=integral x e^(-x^(2))dd(x)arrow.double tan y= 1/e^(x^(2)) (integral x e^(-x^(2) dd(x))+C )=(1/2 x^(2)+C)e^(-x^(2))$
]

#example[
  $dv(y, x)=1/(x+y)$
]

#proof(title: "答案")[
  + $z:=x+y arrow.double dv(z, x)=1+1/z arrow.double z/(1+z) dd(z)=dd(x) arrow.double (1+z-1)/(1+z)dd(z)=dd(x) arrow.double z-ln(abs(1+z))=x+C_1 arrow.double x=C e^(y)-y-1$
  + $dv(x, y)=x+y arrow.double dv(x, y)-x=y arrow.double^(integral -1 dd(y)=-y) e^(-y) dv(x, y)-x e^(-y)=y e^(-y) arrow.double dv(, y)(e^(-y) x)=y e^(-y) arrow.double x=1/e^(-y) (integral (y e^(-y))dd(x)+C_1)=-(y+1)+C e^(y)$
]

=== 贝努里方程(Bernoulli Equation)
#definition(title: "Bernoulli")[
  形如 $y^prime+P(x)y=Q(x)y^(n)quad(n!=0, 1)$ 的方程称为贝努里方程
]
解法：
$ y^prime/y^(n)+P(x)y^(1-n)=Q(x)\ 1/(1-n) dv(y^(1-n), x)+P(x)y^(1-n)=Q(x) $
这样就变成了一阶线性方程\
$
  dv(y^(1-n), x)+(1-n)P(x)y^(1-n)=(1-n)Q(x)\ dv(, x) (e^(integral (1-n)P(x)dd(x))y^(1-n))=(1-n)Q(x)e^(integral (1-n)P(x)dd(x))\ y^(1-n)=e^(-integral (1-n)P(x)dd(x))(integral (1-n)Q(x)e^(integral(1-n)P(x)dd(x)) +C)
$
#example[
  $y^prime-3x y=x y^(2)$
]\
#proof(title: "答案")[
  $y^prime/y^(2)-3x 1/y=x arrow.double -dv(1/y, x)-3x 1/y =x arrow.double dv(1/y, x) +3x 1/y=-x arrow.double^(integral 3x dd(x)=3/2 x^(2)) dv(, x) (1/y e^(3/2 x^(2)))=integral -x e^(3/2 x^(2)) dd(x)+C_1 arrow.double 1/y=1/e^(3/2 x^(2))(integral -x e^(3/2 x^(2)) dd(x)+C_1)$
]


#example[
  $y^prime+y/x= a y^(2) ln x$
]\
#proof(title: "答案")[
  $y^prime/y^(2)+1/x 1/y=a ln x arrow.double - dv(1/y, x)+1/x 1/y=a ln x arrow.double dv(1/y, x)-1/x 1/y=-a ln x arrow.double^(integral - 1/x dd(x)=-ln x,e^(-ln x)=1/x) dv(, x) (1/x 1/y)=-a ln x 1/x arrow.double 1/y=x(integral-a ln x dd(ln x)+C)=x(-a/2 ln^(2)x+C)$
]\
#example[
  $x y^prime+y=-x y^(2)$
]\
#proof(title: "答案")[
  $y^prime/y^(2)+1/x dot 1/y =-1 arrow.double -dv(1/y, x)+1/(x y)=-1 arrow.double dv(1/y, x)-1/x 1/y=1 arrow.double^(integral -1/x dd(x)=-ln x,e^(-ln x)=1/x) dv(, x)(1/x 1/y)=integral 1 dd(x) arrow.double 1/y=x(x+C)$
]\
== 高阶微分方程
#definition(title: "高阶微分方程")[
  二阶或二阶以上的微分方程称为高阶微分方程
]
=== 可降阶的微分方程
$
  cases(
    y^(n)=f(x),
    y^prime.double=f(x,y^prime)quad ("no y"),
    y^prime.double=f(y,y^prime) quad "no x",
    #text[齐次型 ]
  )
$
==== 纯导型 $y^(n)=f(x)$
直接积分就完事了
==== 缺y型 $y^prime.double=f(x,y^prime)$
$p=y^prime,p^prime=f(x,p)$
#corollary(title: "")[
  方程 $ F(x,y^((k)),y^((k+1)),dots,y^(n))=0 (k>=0),z:=y^((k)), F(x,z,z^prime,dots,z^((n-k)))=0 arrow.double \ z=z(x,c_1,dots,c_(n-k))\ #text[积分n次即可求出]y(x) $
]
#example[
  $(1+x^(2))y^prime.double =2x y^prime$
]\
#proof(title: "答案")[
  $y=C_1(x+1/3 x^(3))+C_2$
]\
#example[
  $
    cases(
      y^prime.double=1/a dot sqrt(1+(y^prime)^(2)) ,

      evaluated(y)_(x=0))=a,

      evaluated(y^prime)_x=0=0,

  $
]\
#proof(title: "答案")[
  $y=a/2(e^(x/a)+e^(-x/a))$
]\
==== 缺x型 $y^prime.double=f(y,y^prime)$
$ p=y^prime,y^prime.double=dv(y^prime,x)=dv(p,x)=dv(p,y)dv(y,x)=dv(p,y)p\ p dv(p,y)=f(y,p)   $
#example[
  $y y^prime.double -(y^prime)^(2)=0$
]\
#proof(title: "答案")[
  $y^prime=p arrow.double y dot p dv(p,y)=p^(2) arrow.double dd(p)/p=dd(y)/y arrow.double y=C_2 e^(C_1x)$
]\
==== 齐此方程
#definition(title: "齐次方程")[
  若 $F(x,t y,t y^prime,t y^prime.double)=t^(k)F(x,y,y^prime,y^prime.double)$
  则称方程 $F(x,y,y^prime,y^prime.double)=0$ 为齐次方程，$F(x,y,y^prime,y^prime.double)$ 为齐次函数
]
解法：
#important-box[
  齐次 $e$ 代换，线齐特乘新
]
+ 齐次 $e$ 代换 $y=e^(integral z dd(x))$
  + 若 $F(x,t y,t y^prime,t y^prime.double)=t^(k)F(x,y,y^prime,y^prime.double)$，求解 $F(x,y,y^prime,y^prime.double)=0$，若令 $z=y^prime/y arrow.double  y^prime=z y,y^prime.double=z^prime y+z y^prime,y^prime.triple=z^prime.double y+2z^prime y^prime+ z y^prime.double,dots$ 由此可见，此代换可以将 $y^((n))(n>=2)$ 表示成 $z,z^((1)),dots,z^((n-1)),y,y^((1)),dots,y^((n-1))$ 的线性组合，此时方程变成 $F(x,z,z^prime)=0$ 由二阶变成一阶方程（没有y是因为可以由 $z=y^prime/y arrow.double y=e^(integral z dd(x))$）
  #example[
    $x^(2)y y^prime=(y-x y^prime)^(2)$

  ]\
  #proof(title: "答案")[
    作代换 $z=y^prime/y arrow.double y^prime=z y,y^prime.double=z^prime y+z y^prime,y^prime.triple=z^prime.double y+2z^prime y^prime+ z y^prime.double,dots arrow.double z^prime+2z/x=1/x^(2) arrow.double z=(x+c_1)/x^(2) arrow.double y= C x e^(-c/x) $
  ]\

+ 线齐特乘新
  + 先猜特解$y_1$，一般是 $plus.minus x,plus.minus 1/x,plus.minus 1/x^(2),e^(plus.minus x),ln x$ 如果常见函数做不出来就立刻放弃
  + 令 $y=z y_1$ 然后代入原方程，你应该能化简出一个较为简单的形式，如果复杂且确信没有算错，立刻放弃
#example[
  $x y^prime.triple+3y^prime.double -x y^prime-y=0$
]\
#proof(title: "答案")[
  可猜出解 $y_1=1/x,"let" y=z/x,"代入可得"z^prime.triple-z^prime=0,"let"p:=z^prime,p ^prime.double=p arrow.double p=C_1e^(x)+C_2e^(-x),z=integral p(x) dd(x)=C_1e^(x)-C_2e^(-x)+C_3$
]\
=== 高阶线性微分方程
#definition(title: "高阶线性微分方程")[
  $ y^((n))+p_1(x)y^((n-1))+dots+p_(n)(x)y=f(x) $ 称为 $n$ 阶线性微分方程，其中 $forall 1<=k<=n, p_(k)(x)$ 和 $f(x)$ 都是某个区间上的连续函数
  + when $f(x)=0$ 时称为齐次线性方程
  + when $f(x)!=0$ 时称为非齐次线性方程

]


+ 对于齐次方程有
  $y^((n))+p_1(x)y^((n-1))+dots+p_(n)(x)y=0$ 可以用算符$L$来替代，即$L(y(x))=f(x)$，显然算符$L$是线性的，假如我们猜得了两个解$L(y_1(x))=0,L(y_2(x))=0,#text[两式线性组合可得]L(C_1y_1+C_2y_2)=0$显然两个解的线性组合仍然是原方程的解，所以我们说：#highlight()[对于$n$阶齐次方程，将 $n$个线性无关的解$y_(k)(x)$线性组合，即可得到通解$y^(star)$]\
+ 对于非齐次方程 $y^((n))+p_1(x)y^((n-1))+dots+p_(n)(x)y=f(x)$,我们仍然用算符 $L^(*)$来替代，$L(y(x))=f(x)$，假如我们已经由齐次方程$L(y(x))=0$解出了通解$y^(star)$，那么我们可以猜一个特解$y_p(x)$，使得$L(y_p(x))=f(x)$，那么我们就有$L(y^(star)+y_p(x))=L(y^(star))+L(y_p(x))=0+f(x)=f(x)$ 所以 $y^(star)+y_p(x)$ 也是原方程的解，所以我们说：#highlight()[将通解和特解直接相加，可得所有解]
==== 二阶线性微分方程
===== 二阶线性齐次微分方程
特别的对于二阶线性齐次微分方程我们有
$ y^prime.double+p_1 y^prime+p_2y=0 $其中 $p_1,p_2$ 是常数\
我们已经从解简谐振动的方程中知道了解
$ x^prime.double+w^(2)x=0 arrow.double x= c_1 sin omega t+c_2sin omega t=A e^(i omega t)+B e^(-i omega t) $
于是我们猜解
$ y=A e^(k x),y^prime=k y,y^prime=k^(2) y\ y (k^(2)+p_1k+p_2)=0,y!=0\  $
$ k^(2)+p_1k+p_2=0\ k=(-p_1plus.minus sqrt( p_1^(2)-4p_2 ))/2=-p_1/2plus.minus sqrt( p_1^(2)/4-p_2 ) ,Delta=p_1^(2)-4p_2,omega_t=sqrt( p_1^(2)/4-p_2 ) $
$ cases(y=A e^(-p_1/2 x+omega_t x)+B e^(-p_1/2 x-omega_t x)=e^(-p_1/2 x)(A e^(omega_t x)+B e^(-omega_t x)) quad Delta>0, y=e^(-p_1/2 x)(A+B x) quad Delta=0"你不难验证"B x e^(-p_1/2 x)"也是解，这是delta为零时的特殊解", y= e^(-p_1/2 x)(A e^(i omega_b x)+B e^(-i omega_b x))=  e^(-p_1/2 x) (c_1sin omega_b x+c_2 cos omega_b x)quad Delta<0 quad omega_b=sqrt(p_2-p_1^(2)/4)
) $