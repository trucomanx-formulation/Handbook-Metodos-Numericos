function X=funcdifsorder2(w,V,d1,d2,T)
	X=zeros(numel(w),size(T));
	N=numel(T)
	for II=1:N
		X(:,II)=V*diag(d1)*cos(w*T(II))+ ...
		      V*diag(d2)*sin(w*T(II));
	endfor
endfunction
