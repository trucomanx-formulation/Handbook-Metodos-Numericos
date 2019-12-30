function hf=func_minimizando_hx_a_alphax(X1,a,M,b,alpha,DAT)
    X=zeros(1,M);
    H=zeros(1,M);
    E=zeros(1,M);
    X(1)=X1;
    H(1)=b*h0(X(1));
    E(1)=(H(1)-a).^2+alpha*X(1)*X(1);

    for II=2:M
        X(II)=X(II-1)+( b*h1(X(II-1))*(a-H(II-1))-alpha*X(II-1) )/((b*h1(X(II-1)))^2+alpha);
        H(II)=b*h0(X(II));
        E(II)=(H(II)-a).^2+alpha*X(II)*X(II);
    end
    X
    E

    hf=figure(1);
    x=linspace(-2,2,128);
    plot(   x,(b*h0(x)-a),'b-.',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ... 
            X,E,'k-o',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ... 
            x,(b*h0(x)-a).^2+alpha*x.^2,'r--',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH);
    %set (gca, "ygrid", "on");
    ylim([-2 8])
    %ylim([min(x.^2-a) 1.5*max(x.^2-a)])
    xlim([min(x) max(x)]);
    hx=xlabel('x');
    set (hx, "fontsize", DAT.FONTSIZE);
    hl=legend(' h(x)-a',' e(x_k)',' e(x)');
    set (hl, "fontsize", DAT.FONTSIZE);
    set (gca, "fontsize", DAT.FONTSIZE);

    hold on
    plot(x,0*x,'k')
    for II=1:(M-1)
        quiver (X(II), E(II), X(II+1)-X(II), E(II+1)-E(II),'color','k','linewidth',DAT.LINEWIDTH,'maxheadsize', 0.05);
    end
    hold off
    set(gca, "fontsize", DAT.FONTSIZE);
end


function hf=h0(x)
    hf=x.*x.*(x-1).*(x+1);
end

function hf=h1(x)
    hf=4*x.*(x.*x-1/2);
end
