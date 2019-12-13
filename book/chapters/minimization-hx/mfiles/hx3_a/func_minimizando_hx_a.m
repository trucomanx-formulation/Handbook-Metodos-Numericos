function hf=func_minimizando_hx_a(X1,a,M,b,DAT)
    X=zeros(1,M);
    H=zeros(1,M);
    E=zeros(1,M);
    X(1)=X1;
    H(1)=b*X(1)*X(1)*X(1);
    E(1)=(H(1)-a).^2;

    for II=2:M
        X(II)=X(II-1)-(H(II-1)-a)/(3*b*X(II-1)*X(II-1));
        H(II)=b*X(II)*X(II)*X(II);
        E(II)=(H(II)-a).^2;
    end
    X
    E

    hf=figure(1);
    x=linspace(-2,2,32);
    plot(   x,(b*x.^3-a),'b-.',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ... 
            X,E,'k-o',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ...
            x,(b*x.^3-a).^2,'r--',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH);
    %set (gca, "ygrid", "on");
    ylim([-2 16])
    %ylim([min(x.^2-a) 1.5*max(x.^2-a)])
    xlim([min(x) max(x)]);
    hx=xlabel('x');
    set (hx, "fontsize", DAT.FONTSIZE);
    hl=legend(' h(x)-a',' e(x_k)',' e(x)={(h(x)-a)}^2');
    set (hl, "fontsize", DAT.FONTSIZE);
    set (gca, "fontsize", DAT.FONTSIZE);

    hold on
    plot(x,0*x,'k')
    for II=1:(M-1)
        DELTAE=E(II+1)-E(II);
        if(DELTAE>100000)
            DELTAE=100000;
        end
        quiver (X(II), E(II), X(II+1)-X(II), DELTAE,'color','k','linewidth',DAT.LINEWIDTH,'maxheadsize', 0.03);
    end
    hold off
    set(gca, "fontsize", DAT.FONTSIZE);
end
