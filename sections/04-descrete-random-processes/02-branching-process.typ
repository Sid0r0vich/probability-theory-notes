#import "../../utils/core.typ": *

== Ветвящиеся процессы

Пусть у нас есть какие-то частицы, которые разможаются, умирают, и т.д. С вероятностью $f_k$ частица превращается в $k$ частиц. Изначально частиц $eta_0 = 1$. На следующем шаге частиц $eta_1 = xi_1^((1))$, где $xi_k^((n))$ --- количество частиц, которые превратились в $k$-я частица на $n$-м шаге. Соответсвенно на втором шаге частиц будет $eta_2 = xi_1^((2)) + xi_2^((2)) + ... + xi_(eta_1)^((2))$. $P(xi_j^((n)) = k) = f_k$.

Давайте этот процесс изучать.

Пусть $F(t) = G_(xi_j^((n))) (t) = sum_(k = 0)^oo f_k t^k$. Хотим понять $G_(eta_n) (t)$. Согласно последнему примеру из предыдущего параграфа, это $G_(eta_(n - 1)) (F(t))$. То есть по индукции, это $G_n (t) = F(F(F(... F(t) ...)))$. Хотим узнать $E eta_n = G'_n (1)$, а $G_n (t) = G_(n - 1) (F(t))$. Тогда
$
  G'_n (t) = G'_(n - 1) (F(t)) F'(t) ==> G'_n (1) = G'_(n - 1) (F(1)) F'(1) = a dot G'_(n - 1) (1) = a E eta_(n - 1).
$
Значит $E eta_n = a^n$.

#th[
  Рассмотрим ветвящийся процесс с производящей функцией числа потомков $F$. Тогда вероятность его вырождения (то есть того, что в какой-то момент потомки исчезнут вообще) равна наименьшему положительному корню уравнения $F(x) = x$.
]

#notice[
  $F$ возрастает на $[0, 1]$. $F'$ тоже, поэтому функция выпукла. А еще $F(1) = 1$, то есть наименьший положительный корень не больше $1$. Собственно, это корень, который получается в другой точке пересечения графика $F$ с прямой $y = x$ (если такая есть).
  #TODO[картинка]
  Если производная в единице, то есть матожидание $xi_j^((n))$ не больше $1$, то вероятность вырожения равна $1$, а при больших значениях --- что-то меньшее $1$.
]
