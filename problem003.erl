-module(problem003).
-export([max_factor/1]).


max_factor(N) ->
    MaxPrime = round(math:sqrt(N)),
    Fun = fun(Prime, Acc) when Prime > MaxPrime ->
                  throw(Acc);
             (Prime, Acc) ->
                  case N rem Prime of
                      0 -> Prime;
                      _ -> Acc
                  end
          end,
    catch lazy:foldl_lazy(Fun, undefined, primes:lazy()).

