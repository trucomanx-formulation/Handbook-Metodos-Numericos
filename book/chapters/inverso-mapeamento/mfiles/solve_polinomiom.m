function [C D]=solve_polinomiom(X,Y,U,V,M)

	if norm(size(X)-size(Y)) !=0 
		error('THe size of vector X and Y is not the same.')
	end

	if norm(size(U)-size(V)) !=0 
		error('THe size of vector U and V is not the same.')
	end

	if norm(size(U)-size(X)) !=0 
		error('THe size of vector U and X is not the same.')
	end

	if ~isvector(U)
		error('U is not a vector.')
	end

	if ~isvector(X)
		error('X is not a vector.')
	end


	A=vector_a(X,Y,0);
	for MM=1:M
		A=[A vector_a(X,Y,MM)];
	endfor

	Ap=inv(A'*A)*A';
	C=Ap*U;
	D=Ap*V;

endfunction


function a=vector_a(X,Y,m)

	if norm(size(X)-size(Y)) !=0 
		error('THe size of vector X and Y is not the same.')
	end

	m=round(m);

	if(m<1)
		a=ones(size(X));
	else
		a=X.^(m);
		for LL=1:m
			a=[a X.^(m-LL).*Y.^(LL)];
		end

	endif
	
endfunction

