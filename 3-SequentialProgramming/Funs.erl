
%
% TempConvert = 
%   fun ({c, C}) -> {f, 32+C*9/5}; 
%       ({f, F}) -> {c, (F-32)*5/9}
%   end.

% 3> lists:map(Even, [1,2,3,4,5,6]). 
% [false,true,false,true,false,true]

% 4> Fruit = [apple, pear, orange].
% [apple,pear,orange]

% 5> MakeTest = fun(L) -> (fun(X) -> lists:member(X,L) end) end.
% #Fun<erl_eval.7.126501267>

% 6> IsFruit = MakeTest(Fruit).
% #Fun<erl_eval.7.126501267>

% 7> IsFruit(pear).
% true

% 8> IsFruit(apple).
% true

% 9> IsFruit(dog).
% false
