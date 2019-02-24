function hf=func_minimizando_hx_a(X1,a,M,b)
    X=zeros(1,M);
    H=zeros(1,M);
    E=zeros(1,M);
    X(1)=X1;
    H(1)=b*X(1)*X(1);
    E(1)=(H(1)-a).^2;

    for II=2:M
        X(II)=X(II-1)-(H(II-1)-a)/(2*b*X(II-1));
        H(II)=b*X(II)*X(II);
        E(II)=(H(II)-a).^2;
    end
    X
    FONTSIZE=18;

    hf=figure(1);
    x=linspace(-2,2,32);
    plot(x,(b*x.^2-a),'b-.',X,E,'g-o',x,(b*x.^2-a).^2,'r--');
    %set (gca, "ygrid", "on");
    ylim([-2 8])
    %ylim([min(x.^2-a) 1.5*max(x.^2-a)])
    xlim([min(x) max(x)]);
    hx=xlabel('x');
    set (hx, "fontsize", FONTSIZE);
    hl=legend(' h(x)-a',' e(x_k)',' e(x)={(h(x)-a)}^2');
    set (hl, "fontsize", FONTSIZE);
    set (gca, "fontsize", FONTSIZE);

    hold on
    plot(x,0*x,'k')
    for II=1:(M-1)
        quiver (X(II), E(II), X(II+1)-X(II), E(II+1)-E(II),'color','g','maxheadsize', 0.1);
    end
    hold off
end