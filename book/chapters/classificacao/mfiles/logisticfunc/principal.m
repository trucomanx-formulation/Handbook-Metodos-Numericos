%
clear
LINEWIDTH=4;
FONTSIZE=28;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function F=func_sigmoid(U)
    F=1./(1.0+exp(-U));
endfunction


u=linspace(-10,10,100);
F=func_sigmoid(u);

plot(u,F,'r','linewidth',LINEWIDTH);
hx=xlabel('u');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('f(u)');
set(hy,'fontsize',FONTSIZE);
grid

set(gca,'fontsize',FONTSIZE);
%set(gca,'linewidth',LINEWIDTH);

print(gcf,'sigmoid.eps','-deps')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function F=func_logit(U)
    F=log(U./(1.0-U));
endfunction


f=linspace(0,1,200);
U=func_logit(f);

plot(f,U,'r','linewidth',LINEWIDTH);
hx=xlabel('f');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('u');
set(hy,'fontsize',FONTSIZE);
grid

set(gca,'fontsize',FONTSIZE);
%set(gca,'linewidth',LINEWIDTH);

print(gcf,'logit.eps','-deps')



