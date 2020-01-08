function F=func_taylor(t)
    if size(t,1) !=1
	error('A entrada deve ser uma linha!');
    end
    F0=[1;1];
    DF0=[0;-1];
    DDF0=[-1;1];
    DDDF0=[0;-1];
    DDDDF0=[1;1];

    F=F0+DF0*t+DDF0*(t.^2)/2+DDDF0*(t.^3)/6+DDDDF0*(t.^4)/24;
end
