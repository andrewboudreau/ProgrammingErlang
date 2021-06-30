-module(oreilly_ring).
-export([start/1, start_proc/2]).

start(Num) ->
    io:format("Starting ~p~n", [Num]),
    start_proc(Num, self()).

start_proc(0, Pid) -> 
    io:format("ZeroProc: ~p~n", [Pid]),
    Pid ! ok;

start_proc(Num, Pid) ->
    io:format("Spawning:~p, From:~p~n", [Num, self()]),
    NPid = spawn(?MODULE, start_proc, [Num-1, Pid]),
       io:format("Sending From:~p To:~p~n", [self(), NPid]),
        NPid ! ok,
       io:format("Sent From:~p To:~p~n", [self(), NPid]),
        receive ok -> 
            io:format("Recieved At:~p~n", [self()]),
            ok
        end.

