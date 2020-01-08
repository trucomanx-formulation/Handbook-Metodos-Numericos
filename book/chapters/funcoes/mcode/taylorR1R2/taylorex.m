%
MARKERSIZE=10;
FONTSIZE=11;
LINEWIDTH=1.5;

AMP=2*pi;

x=linspace(-AMP,AMP,32);
f=[cos(x);exp(-x)];
f4=func_taylor(x);

h1=figure(1);
plot(	x,f,'-','markersize',MARKERSIZE,'linewidth',1.5*LINEWIDTH, ...
	x,f4,'->','markersize',MARKERSIZE,'linewidth',LINEWIDTH)
hx=xlabel('t');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('f(t)');
set(hy,'fontsize',FONTSIZE);
hl=legend('f(t)   ','f(t)   ','f_{4}(t)   ','f_{4}(t)   ');
set(hl,'location', 'eastoutside');
set(hl,'fontsize',FONTSIZE);
ylim([-1.0 2.5])
xlim([-AMP AMP])
daspect([1.1 0.8 1])
set(gca,'fontsize',FONTSIZE)
set(gca,'linewidth',LINEWIDTH)

print(h1,'taylore.eps','-depsc','-tight',['-F:' num2str(FONTSIZE)])
