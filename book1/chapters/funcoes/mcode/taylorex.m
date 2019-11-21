%
x=linspace(-3*pi,3*pi);
f=cos(x);
f4=cos_taylor(x,4);
f8=cos_taylor(x,8);
f10=cos_taylor(x,10);

h1=figure(1);
plot(x,f,'--.',x,f4,'->',x,f8,'-<',x,f10,'-v')
xlabel('x');
ylabel('f(x)');
legend('cos(x)','Taylor k:0->4','Taylor k:0->8','Taylor k:0->10')
ylim([-1.5 1.5])

print(h1,'taylore.eps','-deps')
