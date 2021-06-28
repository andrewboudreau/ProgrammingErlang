-module(area_server).
-export([start/0, area/2]).

start() -> spawn(fun loop/0).

area(Pid, What) ->
    rpc(Pid, What).

rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
        {Pid, Response} ->
            Response
    end.

loop() ->
    receive
        {From, {rectangle, Width, Height}} ->
            From ! {self(), Width * Height},
            loop();
        {From, {circle, R}} ->
            From ! {self(), 3.14159 * R * R},
            loop();
        {From, Other} ->
            From ! {self(), {error, Other}},
            loop()
        end.

% c(area_server).
% Pid = area_server:start().
% area_server:area(Pid, {rectangle, 10, 8}).
% area_server:area(Pid, {circle, 4}).