man(alex).
man(artyom).
women(nastya).
women(alice).
women(ann).

pair(X,Y):-man(X),!,women(Y).