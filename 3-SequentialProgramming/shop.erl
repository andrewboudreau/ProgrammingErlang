
-module(shop).
-export([cost/1]).

cost(orange)    -> 5;
cost(newspaper) -> 8;
cost(apple)     -> 2;
cost(pear)      -> 9;
cost(milk)      -> 7.

% %Running the example by hand.
% erl
% c(shop).
% c(shop1).
% Buy = [{pear,5}, {milk,3}, {pear,1}].
% shop1:total(Buy).