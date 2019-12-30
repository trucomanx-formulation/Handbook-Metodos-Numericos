function Y=polyc(C,X)
	NN=numel(X);
	Y=zeros(size(X));
	M=length(C)-1;
	for II=1:NN
		for JJ=0:M;
		Y(II)=Y(II)+C(JJ+1)*X(II).^(JJ);
		endfor
	endfor
endfunction
