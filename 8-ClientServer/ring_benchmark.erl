%% Usage:
% c(ring_benchmark).
% ring_benchmark:send(50000,2000).

-module(ring_benchmark).
-import(lists, [foldl/3, seq/3]).

-export([send/2]).

%% @doc Send M messages through a ring on N processes.
%% M - Number of Messages
%% N - Number of Nodes
send(M, N) ->
    statistics(runtime),
    H = lists:foldl(
        fun(Id, Pid) -> spawn_link(fun() -> loop(Id, Pid, M) end) end,
        self(),
        lists:seq(N, 2, -1)),
    {_, Time} = statistics(runtime),
    io:format("~p processes spawned in ~p ms~n",[N, Time]),
    statistics(runtime),
    H ! M,
    loop(1, H, M).

loop(Id, Pid, M) -> 
    receive
        1 ->
            {_, Time} = statistics(runtime),
            io:format("~p messages send in ~p ms~n", [M, Time]),
            1;
        Index -> 
            Pid ! Index -1,
            loop(Id, Pid, M)
    end.


