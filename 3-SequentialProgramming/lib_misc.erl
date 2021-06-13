-module(lib_misc).
-export([sum/1]).

sum(L)          -> sum(L, 0).

sum([], Acc)    -> Acc;
sum([H|T], Acc) -> sum(T, H + Acc).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I)|for(I+1, Max, F)].

