function [C ERROR RCON]=funcC(X,Y,Z,M)

    A=funcA(X,Y,M);
    [INVERSA RCON]=inv(A'*A);
    C=INVERSA*A'*Z;

    FF=funcF(C,X,Y);
    ERROR=norm(FF-Z)^2;

endfunction
