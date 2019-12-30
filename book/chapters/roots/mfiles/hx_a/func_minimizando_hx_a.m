function hf=func_minimizando_hx_a(X1,M,alpha,DAT)
    X=zeros(1,M);
    H=zeros(1,M);
    E=zeros(1,M);
    X(1)=X1;
    E(1)=abs(funh0(X(1)));

    for II=2:M
        X(II)=X(II-1)-funh1(X(II-1))*funh0(X(II-1))/(funh1(X(II-1))^2+alpha);

        E(II)=abs(funh0(X(II)));
    end
    X
    H1=funh1(X)
    E

    hf=figure(1);
    x=linspace(-3,3,32);
    plot(   x,funh0(x),'b-.',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ... 
            X,funh0(X),'k-o',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH);
    %set (gca, "ygrid", "on");
    ylim([-7.5 7.5])
    %ylim([min(x.^2-a) 1.5*max(x.^2-a)])
    xlim([min(x) max(x)]);
    hx=xlabel('x');
    set (hx, "fontsize", DAT.FONTSIZE);
    hl=legend(' h(x)',' h(x_k)','location','northwest');
    set (hl, "fontsize", DAT.FONTSIZE);
    set (gca, "fontsize", DAT.FONTSIZE);

    hold on
    plot(x,0*x,'k')
    for II=1:(M-1)
        DELTAE=funh0(X(II+1))-funh0(X(II));
        if(DELTAE>100000)
            DELTAE=100000;
        end
        quiver (X(II), funh0(X(II)), X(II+1)-X(II), DELTAE,'color','k','linewidth',DAT.LINEWIDTH,'maxheadsize', 0.03);
    end
    hold off
    set(gca, "fontsize", DAT.FONTSIZE);
end

function h=funh0(x)
    h=x.*(x.^2-1)+1;
endfunction


function h=funh1(x)
    h=(x.^2-1)+x.*2.*x;
endfunction
