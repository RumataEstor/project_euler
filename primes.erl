-module(primes).
-export([lazy/0]).


lazy() ->
    [2 | lazy(3, [])].


lazy(Current, OrderedPrimes) ->
    fun() ->
            find_next_prime(Current, OrderedPrimes)
    end.


find_next_prime(Current, OrderedPrimes) ->
    case is_composite(Current, OrderedPrimes) of
        false ->
            [Current | lazy(Current + 2, OrderedPrimes ++ [Current])];
        true ->
            find_next_prime(Current + 2, OrderedPrimes)
    end.


is_composite(Current, OrderedPrimes) ->
    is_composite(Current, OrderedPrimes, round(math:sqrt(Current))).


is_composite(_, [Prime | _], MaxDivisor) when Prime > MaxDivisor ->
    false;
is_composite(Current, [Prime | _], _) when Current rem Prime =:= 0 ->
    true;
is_composite(Current, [_ | Primes], MaxDivisor) ->
    is_composite(Current, Primes, MaxDivisor);
is_composite(_, [], _) ->
    false.
