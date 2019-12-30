%
MARKERSIZE=10;
FONTSIZE=12;
LINEWIDTH=1.5;

x=linspace(-3*pi,3*pi);
f=cos(x);
f4=cos_taylor(x,4);
f8=cos_taylor(x,8);
f10=cos_taylor(x,10);

h1=figure(1);
plot(	x,f,'--.','markersize',MARKERSIZE,'linewidth',LINEWIDTH, ...
	x,f4,'->','markersize',MARKERSIZE,'linewidth',LINEWIDTH, ...
	x,f8,'-<','markersize',MARKERSIZE,'linewidth',LINEWIDTH, ...
	x,f10,'-v','markersize',MARKERSIZE,'linewidth',LINEWIDTH)
hx=xlabel('x');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('f(x)');
set(hy,'fontsize',FONTSIZE);
hl=legend('cos(x)','d_{4}(x)','d_{8}(x)','d_{10}(x)');
set(hl,'location', 'eastoutside');
set(hl,'fontsize',FONTSIZE);
ylim([-1.5 1.5])
daspect([2 0.8 1])
set(gca,'fontsize',FONTSIZE)

print(h1,'taylore.eps','-depsc','-tight',['-F:' num2str(FONTSIZE)])
