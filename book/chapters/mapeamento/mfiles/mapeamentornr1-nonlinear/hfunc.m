function hh=hfunc(C,P)
	hh=C(1)*exp(-(P(:,1)/C(2)).^4-(P(:,2)/C(2)).^4)+C(3);
endfunction
