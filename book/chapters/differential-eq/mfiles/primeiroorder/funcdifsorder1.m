function X=funcdifsorder1(a,V,d,T)
	X=zeros(numel(a),size(T));
	N=numel(T)
	for II=1:N
		X(:,II)=V*diag(d)*exp(-a*T(II));
	endfor
endfunction
