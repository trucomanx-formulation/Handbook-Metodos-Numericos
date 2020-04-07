%
clear
LINEWIDTH=4;
FONTSIZE=28;
MARKERSIZE=20;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function F=func_sigmoid(U)
    F=1./(1.0+exp(-U));
endfunction


u=linspace(-10,10,32);
F=func_sigmoid(0.5*u);

A1=0.2;
u1=[-4 -8.5 -2 -6];
f1=0*u1+A1;

A2=0.8;
u2=[10 4 7  2 3];
f2=0*u2+A2;

subplot(2,1,1)
plot(   u1,f1,'^','linewidth',LINEWIDTH,'markersize',MARKERSIZE, ...
        u2,0*f2,'o','linewidth',LINEWIDTH,'markersize',MARKERSIZE);
hx=xlabel('x');
set(hx,'fontsize',FONTSIZE);
grid
set(gca,'xticklabel',{' ',' ',' ',' '})
set(gca,'yticklabel',{' ',' ',' ',' '})
daspect([0.5 1 1])

subplot(2,1,2)
plot(   u,F,'k','linewidth',LINEWIDTH, ...
        u1,f1,'^','linewidth',LINEWIDTH,'markersize',MARKERSIZE, ...
        u2,f2,'o','linewidth',LINEWIDTH,'markersize',MARKERSIZE,...
        u,ones(size(u))*A1,'.k',...
        u,ones(size(u))*A2,'.k');
%
hx=xlabel('x');
ylim([0 1])
set(hx,'fontsize',FONTSIZE);
hy=ylabel('y');
set(hy,'fontsize',FONTSIZE);
grid
set(gca,'xticklabel',{' ',' ',' ',' '})
set(gca,'ytick',[0 A1 0.5 A2 1])
set(gca,'yticklabel',{'0','A','0.5','1-A','1'})
daspect([6 1 1])


set(gca,'fontsize',FONTSIZE);
%set(gca,'linewidth',LINEWIDTH);

print(gcf,'reglogr1r1.eps','-depsc')

