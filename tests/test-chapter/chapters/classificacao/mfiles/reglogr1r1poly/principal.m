%
clear
LINEWIDTH=4;
FONTSIZE=28;
MARKERSIZE=20;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function F=func_sigmoid(C,X)
    F=1./(1.0+exp(-polyval(C,X)));
endfunction

A1=0.01;
u1=[-8 -7.5 -5  5 7.5 8];
f1=0*u1+A1;

A2=0.99;
u2=[-1 0 1 ];
f2=0*u2+A2;

M=6;
X=[u1 u2]';
Y=[f1 f2]';
A=[ones(size(X))];
for II=1:M
    A=[X.^(II) A];
endfor

u=linspace(-10,10,128);

C=inv(A'*A)*A'*func_logit(Y);
F=func_sigmoid(C,u);

subplot(2,1,1)
plot(   u1,f1,'^','linewidth',LINEWIDTH,'markersize',MARKERSIZE, ...
        u2,0*f2,'o','linewidth',LINEWIDTH,'markersize',MARKERSIZE);
hx=xlabel('x');
set(hx,'fontsize',FONTSIZE);
grid
set(gca,'xticklabel',{' ',' ',' ',' '})
set(gca,'yticklabel',{' ',' ',' ',' '})
daspect([4 1 1])

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

print(gcf,'reglogr1r1poly.eps','-depsc')

