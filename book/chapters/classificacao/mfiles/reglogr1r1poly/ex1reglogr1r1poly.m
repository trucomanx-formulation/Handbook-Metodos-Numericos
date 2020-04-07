%
%close all
clear
DATA.LINEWIDTH=4;
DATA.FONTSIZE=28;
DATA.MARKERSIZE=20;



X1=[1.1,1.2,1.4,4.0,4.1,4.2]; 
X2=[2.1,2.2,2.5,2.6,2.8,2.9];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function F=func_sigmoid(C,X)
    F=1./(1.0+exp(-polyval(C,X)));
endfunction

function H=func_logit(F)
    H=log(F./(1-F));
endfunction

function C=func_getc(X1,X2,B,M,DATA)

    Y1=B*ones(size(X1));
    Y2=(1-B)*ones(size(X2));


    X=[X1 X2]';
    Y=[Y1 Y2]';
    A=[ones(size(X))];
    for II=1:M
        A=[X.^(II) A];
    endfor

    C=inv(A'*A)*A'*func_logit(Y);

    L=128;
    Xs=linspace(min(X),max(X),L);
    Ys=func_sigmoid(C,Xs);

    
    plot(   X1,Y1,'^b','linewidth',DATA.LINEWIDTH,'markersize',DATA.MARKERSIZE,...
            X2,Y2,'or','linewidth',DATA.LINEWIDTH,'markersize',DATA.MARKERSIZE,...
            Xs,Ys,'k','linewidth',DATA.LINEWIDTH,'markersize',DATA.MARKERSIZE,...
            Xs,ones(size(Xs))*B,'.k','linewidth',DATA.LINEWIDTH,...
            Xs,ones(size(Xs))*(1-B),'.k','linewidth',DATA.LINEWIDTH)
    grid

    set(gca,'ytick',[B 0.5 1-B]);
    set(gca,'fontsize',DATA.FONTSIZE);

    ylim([0 1])
    %daspect([1.5 1 1])

    R = roots(C)
    hold on
    for II=1:length(R)
        Xp=R(II)*ones(1,L);
        Yp=linspace(0,1,L);
        plot(Xp,Yp,'.k','linewidth',DATA.LINEWIDTH);
    endfor
    hold off
endfunction

B=0.1
M=2
C=func_getc(X1,X2,B,M,DATA);
C1 = fliplr(C')
%set(gca,'linewidth',LINEWIDTH);
print(gcf,'ex1s1-reglogr1r1poly.eps','-depsc')

B=0.001
M=2
C=func_getc(X1,X2,B,M,DATA);
C2 = fliplr(C')
%set(gca,'linewidth',LINEWIDTH);
print(gcf,'ex1s2-reglogr1r1poly.eps','-depsc')
