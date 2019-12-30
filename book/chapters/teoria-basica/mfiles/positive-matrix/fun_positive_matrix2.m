function R=fun_positive_matrix2(X,Y,A)
	R=zeros(size(X));
	N=numel(X);
	for II=1:N
		R(II)=[X(II) Y(II)]*A*[X(II);Y(II)];
	end
endfunction
