function hh=jfunc(C,xval)
	hh=zeros(size(C'));
	hh(1)=exp(-(xval/C(2)).^4);
	hh(2)=4*(C(1)/C(2)).*(xval/C(2)).^4.*exp(-(xval/C(2)).^4);
	hh(3)=1;
endfunction
