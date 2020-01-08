function hh=hfunc(C,xval)
	hh=C(1)*exp(-(xval/C(2)).^4)+C(3);
endfunction
