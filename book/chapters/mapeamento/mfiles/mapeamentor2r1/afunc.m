function hh=afunc(X,Y,M)

	hh=sfunc(X,Y,0);
	for mm=1:M
		hh=[hh sfunc(X,Y,mm)];
	endfor
endfunction

function S=sfunc(X,Y,mm)
	if(mm<=0)
		S=ones(length(X),1);
	else
		S=X.^mm;
		for II=1:mm
			S=[S X.^(mm-II).*Y.^(II)];
		endfor
	endif
endfunction
