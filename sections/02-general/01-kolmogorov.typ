#import "../../utils/core.typ": *

== Колмогоровская модель теории вероятностей

#def[
    _Вероятностное пространство_ --- это тройка $(Omega, Ff, P)$, где
    - $Omega$ --- пространство _элементарных исходов_ (множество)
    - $Ff$ --- $sigma$-алгебра подмножеств $Omega$ (элементы --- _случайные события_)
    - $P$ --- _вероятностная мера_ на $Ff$ (мера вероятностная, если $P(Omega) = 1$).
]

#notice[
    Если $Omega$ --- не более чем счетное, то можно рассмотреть $Ff$ --- это множество всех подмножеств $Omega$. Иначе далеко не все меры можно продолжать на все подмножества.
]

#def[
    Если $A$ --- случайное событие, вероятность которого положительна, то _условной вероятностью_ события $B$ при условии $A$ называется число
    $
        P(B | A) := P(A sect B)/P(A).
    $
]

#def[
    События $A$ и $B$ называются _независимыми_, если $P(A sect B) = P(A)P(B)$.
]

#def[
    События $A_1, A_2, ..., A_n$ называются _независимыми в совокупности_, если для любого набора различных индексов $i_1, i_2, ..., i_k$ верно
    $
        P(A_(i_1) sect A_(i_2) sect ... sect A_(i_k)) = P(A_(i_1))P(A_(i_2))...P(A_(i_k)).
    $
]

#def[
    Бесконечная последовательность событий $A_1, A_2, ...$ называется _независимой в совокупности_, если для любого натурального $n$ и любого набора различных индексов $i_1, i_2, ..., i_n$ верно
    $
        P(A_(i_1) sect A_(i_2) sect ... sect A_(i_n)) = P(A_(i_1))P(A_(i_2))...P(A_(i_n)),
    $
    или, равносильно, если любой префикс независим в совокупности.
]

#(make_theorem("Утверждение", color: blue))[
    Если $A_1, A_2, ...$ независимы в совокупонсти, то $ P(Sect_(k = 1)^oo A_k) = product_(k = 1)^oo P(A_k). $
]

#proof[
    $P(Sect_(k = 1)^oo A_k) <-- P(Sect_(k = 1)^n A_k) = product_(k = 1)^n P(A_k) --> product_(k = 1)^oo P(A_k)$.
]

#lemma(name: "Борелля-Кантелли")[
    1. Если ряд $sum_(n = 1)^oo P(A_n) < +oo$, то вероятность того, что случилось бесконечное количество из событий $A_n$, равна нулю.
    2. Если события $A_1, A_2, ...$ независимы в совокупности, и ряд $sum_(n = 1)^oo P(A_n)$ расходится, то вероятность того, что случилось бесконечное количество из событий $A_n$, равна единице.
]

#proof[
    Пусть $B$ --- событие "случилось бесконечное количество $A_n$". Тогда
    $
        B = Sect_(n = 1)^oo Union_(k = n)^oo A_k.
    $
    Почему?
    - "$supset$": пусть $omega in Sect_(n = 1)^oo Union_(k = n)^oo A_k$. Тогда $omega in union_(k = n)^oo A_k$ для любого $n$, а значит $omega in A_k$ для бесконечного количества $k$.
    - "$subset$": пусть $omega in A_j$ для бесконечного числа $j$. Тогда $omega in Union_(k = n)^oo A_k$ для любого $n$, и $omega in Sect_(n = 1)^oo Union_(k = n)^oo A_k$.

    Теперь доказываем лемму.
    1. $P(B) = P(Sect_(n = 1)^oo Union_(k = n)^oo A_k) <= P(Union^oo_(k = n) A_k) <= sum_(k = n)^oo P(A_k) --> 0$ как хвост сходящегося ряда.

    2. $P(Sect_(k = n)^oo neg(A)_k) = product_(k = n)^oo P(neg(A)_k) = product_(k = n)^oo (1 - P(A_k))$, так как события $neg(A)_n$ независимы в совокупности.
        $ ln P(Sect_(k = n)^oo neg(A)_k) = sum_(k = n)^oo ln(1 - P(A_k)) <= -sum_(k = n)^oo P(A_k) = -oo. $
        Значит $P(Sect_(k = n)^oo neg(A_k)) = 0$, и $P(neg(Sect_(k = n)^oo neg(A)_k)) = 1$, и $P(Union_(k = n)^oo A_k) --> P(B)$ по непрерывности меры сверху.
]

#follow(name: "Закон нуля и единицы")[
    Пусть $A_1, A_2, A_3, ...$ --- независимые в совокупности события. Тогда
    $
        P("случилось бесконечное количество" A_n) = 0 "или" 1.
    $
]
