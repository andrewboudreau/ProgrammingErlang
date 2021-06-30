%% Usage:
%%  c(ctemplate).
%%  ctemplate:rpc(self(), [1,2,3,5,6]). \

-module(ctemplate).
-compile(export_all).

start() -> 
    spawn(fun() -> loop([]) end).

rpc(Pid, Response) ->
    Pid ! {self(), Response},
    receive
        {Pid, Response} ->
            Response
    end.

loop(X) ->
    receive
        Any ->
            io:format("Received:~p~n", [Any]),
            loop(X)
    end.
