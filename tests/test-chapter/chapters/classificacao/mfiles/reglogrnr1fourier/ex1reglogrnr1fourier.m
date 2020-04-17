%
%close all
clear
DATA.LINEWIDTH=4;
DATA.FONTSIZE=28;
DATA.MARKERSIZE=20;



X1=[1.0,1.2,1.4,4.0,4.1,4.2]; 
X2=[2.1,2.5,2.6,2.8,2.9,5.0];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function A=func_a(Lx,K,X)
    A=[ones(size(X))]/2;
    for kk=1:K
        A=[A, sin(kk*2*pi*X/Lx), cos(kk*2*pi*X/Lx)];
    endfor
endfunction

function H=func_h(Lx,C,X)
    K=round((length(C)-1)/2);
    H=func_a(Lx,K,X)*C;
endfunction

function F=func_sigmoid(Lx,C,X)
    K=round((length(C)-1)/2);
    F=1./(1.0+exp(-func_a(Lx,K,X)*C));
endfunction

function H=func_logit(F)
    H=log(F./(1-F));
endfunction

function plot_data(X1,X2,C,FACTOR,DATA)
    X=[X1 X2]';
    Lx=FACTOR*abs(max(X)-min(X));

    u0=(max(X)+min(X))/2;
    u=linspace(u0-FACTOR*(u0-min(X)),u0+FACTOR*(max(X)-u0),128)';
    H=func_h(Lx,C,u);
    plot(   u,H,'k','linewidth',DATA.LINEWIDTH, ...
            X1,0.001*ones(size(X1)),'^','linewidth',DATA.LINEWIDTH,'markersize',DATA.MARKERSIZE, ...
            X2,0.000*ones(size(X1)),'o','linewidth',DATA.LINEWIDTH,'markersize',DATA.MARKERSIZE);
    xlim([min(X) max(X)])
    hx=xlabel('x');
    set(hx,'fontsize',DATA.FONTSIZE);
    hy=ylabel('h(x)');
    set(hy,'fontsize',DATA.FONTSIZE);
    grid
    set(gca,'fontsize',DATA.FONTSIZE);
    %set(gca,'ytick',[0])
    %set(gca,'xticklabel',{' ',' ',' ',' '})
    %set(gca,'yticklabel',{'0'})
endfunction

function C=func_getc(X1,X2,B,K,FACTOR,DATA)

    Y1=B*ones(size(X1));
    Y2=(1-B)*ones(size(X2));


    X=[X1 X2]';
    Y=[Y1 Y2]';

    Lx=FACTOR*abs(max(X)-min(X));
    A=func_a(Lx,K,X);

    C=inv(A'*A)*A'*func_logit(Y);

    L=128;
    Xs=linspace(min(X),max(X),L)';
    Ys=func_sigmoid(Lx,C,Xs);

    
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

endfunction

B=0.1
K=3
LxFactor=1.1
C=func_getc(X1,X2,B,K,LxFactor,DATA);
C1 = C'
%set(gca,'linewidth',LINEWIDTH);
print(gcf,'ex1s1-reglogr1r1fourier.eps','-depsc')
plot_data(X1,X2,C,LxFactor,DATA);
print(gcf,'ex1s1-reglogr1r1fourierhx.eps','-depsc')

B=0.001
K=3
LxFactor=1.1
C=func_getc(X1,X2,B,K,LxFactor,DATA);
C2 = C'
%set(gca,'linewidth',LINEWIDTH);
print(gcf,'ex1s2-reglogr1r1fourier.eps','-depsc')
plot_data(X1,X2,C,LxFactor,DATA);
print(gcf,'ex1s2-reglogr1r1fourierhx.eps','-depsc')
