function [C RCON]=funcC(X,Y,M)

    A=funcA(X,M);
    [INVERSA RCON]=inv(A'*A);
    C=INVERSA*A'*Y;

endfunction
