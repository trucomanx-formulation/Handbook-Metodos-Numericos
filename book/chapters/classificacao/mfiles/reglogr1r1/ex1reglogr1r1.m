%
clear
DATA.LINEWIDTH=4;
DATA.FONTSIZE=28;
DATA.MARKERSIZE=20;



X1=[1.1,1.2,1.4,1.7,1.8]; 
X2=[2.8,2.9,3.1,3.3,3.4];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function F=func_sigmoid(U)
    F=1./(1.0+exp(-U));
endfunction

function U=func_logit(F)
    U=log(F./(1-F));
endfunction

function C=func_getc(X1,X2,B,DATA)

    Y1=[B  ,B  ,B  ,B  ,B  ];
    Y2=[1-B,1-B,1-B,1-B,1-B];

    X=[X1 X2]';
    Y=[Y1 Y2]';
    A=[ones(size(X)) X ];
    C=inv(A'*A)*A'*func_logit(Y);

    Xs=linspace(min(X),max(X),32);
    Ys=func_sigmoid(C(1)+C(2)*Xs);

    Xp=-(C(1)/C(2))*ones(1,32);
    Yp=linspace(0,1,32);
    
    plot(   X1,Y1,'^b','linewidth',DATA.LINEWIDTH,'markersize',DATA.MARKERSIZE,...
            X2,Y2,'or','linewidth',DATA.LINEWIDTH,'markersize',DATA.MARKERSIZE,...
            Xs,Ys,'k','linewidth',DATA.LINEWIDTH,'markersize',DATA.MARKERSIZE,...
            Xs,ones(size(Xs))*B,'.k','linewidth',DATA.LINEWIDTH,...
            Xs,ones(size(Xs))*(1-B),'.k','linewidth',DATA.LINEWIDTH,...
            Xp,Yp,'.k','linewidth',DATA.LINEWIDTH)
    grid

    set(gca,'xtick',[1 -(C(1)/C(2)) 3.5]);
    set(gca,'ytick',[B 0.5 1-B]);
    set(gca,'fontsize',DATA.FONTSIZE);

    ylim([0 1])
    %daspect([1.5 1 1])
endfunction

B=0.1
C=func_getc(X1,X2,B,DATA)
%set(gca,'linewidth',LINEWIDTH);
print(gcf,'ex1s1-reglogr1r1.eps','-depsc')

B=0.001
C=func_getc(X1,X2,B,DATA)
%set(gca,'linewidth',LINEWIDTH);
print(gcf,'ex1s2-reglogr1r1.eps','-depsc')
