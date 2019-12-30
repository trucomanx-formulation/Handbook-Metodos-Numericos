function hh=jfunc(C,P)
	hh=zeros(size(C'));
	hh(1)=exp(-(P(:,1)/C(2)).^4-(P(:,2)/C(2)).^4);
	hh(2)=4*(C(1)/C(2)).*((P(:,1)/C(2)).^4+(P(:,2)/C(2)).^4).*exp(-(P(:,1)/C(2)).^4-(P(:,2)/C(2)).^4);
	hh(3)=ones(size(P,1),1);
endfunction
