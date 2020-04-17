%
clear
LINEWIDTH=4;
FONTSIZE=28;
MARKERSIZE=20;
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


A1=0.01;
u1=[-7 -6 -5  5 7.5 8];
f1=0*u1+A1;

u2=[-10 -9 -1 0 1 2 ];
f2=0*u2+1-A1;

K=3;
X=[u1 u2]';
Y=[f1 f2]';
Lx=abs(max(X)-min(X))*1.1;

A=func_a(Lx,K,X);
u=linspace(-10,10,128)';

C=inv(A'*A)*A'*func_logit(Y);
F=func_sigmoid(Lx,C,u);
H=func_h(Lx,C,u);

subplot(2,1,1)
plot(   u,H,'k','linewidth',LINEWIDTH, ...
        u1,f1,'^','linewidth',LINEWIDTH,'markersize',MARKERSIZE, ...
        u2,0*f2,'o','linewidth',LINEWIDTH,'markersize',MARKERSIZE);
hx=xlabel('x');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('h(x)');
set(hy,'fontsize',FONTSIZE);
grid
set(gca,'ytick',[0])
set(gca,'xticklabel',{' ',' ',' ',' '})
set(gca,'yticklabel',{'0'})
%daspect([4 1 1])

subplot(2,1,2)
plot(   u,F,'k','linewidth',LINEWIDTH, ...
        u1,f1,'^','linewidth',LINEWIDTH,'markersize',MARKERSIZE, ...
        u2,f2,'o','linewidth',LINEWIDTH,'markersize',MARKERSIZE,...
        u,ones(size(u))*A1,'.k',...
        u,ones(size(u))*A2,'.k');
%
ylim([0 1])
hx=xlabel('x');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('y');
set(hy,'fontsize',FONTSIZE);
grid
set(gca,'xticklabel',{' ',' ',' ',' '})
set(gca,'ytick',[A1 A2])
set(gca,'yticklabel',{'A','1-A'})
daspect([6 1 1])


set(gca,'fontsize',FONTSIZE);
%set(gca,'linewidth',LINEWIDTH);

print(gcf,'reglogr1r1fourier.eps','-depsc')

