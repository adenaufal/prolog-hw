triangle(N) :- triangle(N, N-1).

triangle(0, _) :- nl.
triangle(N, K) :- N > 0, N1 is N - 1,
                 foreach(between(1, N1, _), write(' ')), 
                 Q is 2 * (K - N1) + 1,
                 foreach(between(1, Q, _), write('*')),
                 foreach(between(1, N1, _), write(' ')), 
                 nl, triangle(N1, K).