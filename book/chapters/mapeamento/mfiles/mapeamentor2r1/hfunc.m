function hh=hfunc(C,X,Y)
	hh=C(1)+C(2)*X + C(3)*Y +C(4)*X.^2 +C(5).*X.*Y + C(6)*Y.^2;
endfunction
