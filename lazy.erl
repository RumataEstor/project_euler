-module(lazy).
-export([foldl_lazy/3]).


foldl_lazy(_, Acc, []) ->
    Acc;
foldl_lazy(Fun, Acc, [Item | LazyList]) ->
    foldl_lazy(Fun, Fun(Item, Acc), LazyList);
foldl_lazy(Fun, Acc, LazyList) when is_function(LazyList, 0) ->
    foldl_lazy(Fun, Acc, LazyList()).
