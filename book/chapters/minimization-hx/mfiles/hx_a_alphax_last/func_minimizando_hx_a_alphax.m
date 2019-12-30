function hf=func_minimizando_hx_a_alphax(X1,a,M,alpha,DAT)
    X=zeros(1,M);
    H=zeros(1,M);
    E=zeros(1,M);
    X(1)=X1;
    E(1)=func_e(X(1),X(1),a,alpha);

    for II=2:M
        X(II)=X(II-1)-func_dx(X(II-1),a,alpha);
    	E(II)=func_e(X(II),X(II),a,alpha);
    end
    X
    E

    hf=figure(1);
    x=linspace(-2,2,32);
    plot(   x,(h0(x)-a),'b-.',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ... 
            x,func_e(x,X(1),a,alpha),'c:',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ...
	    x,func_e(x,X(2),a,alpha),'g--',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ...
	    x,func_e(x,X(3),a,alpha),'m-.',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ...
	    x,func_e(x,X(4),a,alpha),'r-<',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ...
	    X,E,'k-o',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH );
    %set (gca, "ygrid", "on");
    ylim([-1.5 4])
    %ylim([min(x.^2-a) 1.5*max(x.^2-a)])
    xlim([min(x) max(x)]);
    hx=xlabel('x');
    set (hx, "fontsize", DAT.FONTSIZE);
    hl=legend(' h(x)-a',' e_0(x)',' e_1(x)',' e_2(x)',' e_3(x)',' e_k(x_k)','location','eastoutside');
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
    hf=(x.^2).*(x.^2-1);
end

function hf=h1(x)
    hf=4*x.*(x.*x-1/2);
end

function EE=func_e(x,xlast,a,alpha)     
    EE=(h0(x)-a).^2+alpha*(x-xlast).^2;
end

function DD=func_dx(x,a,alpha)     
    DD= ( h1(x).*(h0(x)-a) )./((h1(x))^2+alpha);
end
