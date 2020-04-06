%
clear
LINEWIDTH=4;
FONTSIZE=28;
MARKERSIZE=20;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function F=func_sigmoid(C,U,V)
    N=numel(U);
    F=zeros(size(U));
    for II=1:N
        F(II)=1./(1.0+exp(-[U(II) V(II) 1]*C));
    endfor
endfunction

function H=func_logit(F)
    H=log(F./(1-F));
endfunction


A1=0.001;
u1=[ 4  -4 4  -4];
v1=[-7  0 -4  -3];
f1=0*u1+A1;

A2=0.999;
u2=[-2  0  2 0];
v2=[-2 -5 -2 -3];
f2=0*u2+A2;

M=6;
X=[u1' v1';u2' v2'];
Y=[f1 f2]';


u=v=linspace(min(min(X)),max(max(X)),32);
[UU, VV] = meshgrid (u,v);

A=[X ones(size(X,1),1)];
C=inv(A'*A)*A'*func_logit(Y);
FF=func_sigmoid(C,UU,VV);

F=func_sigmoid(C,X(:,1),X(:,2));


figure(1)
scatter(u1',v1',1024,'b','^','linewidth',LINEWIDTH)
hold on
scatter(u2',v2',1024,'r','o','linewidth',LINEWIDTH)
hold off
hold on
uu=linspace(-3,3);
plot(   uu,-3+sqrt(9-uu.^2),':k','linewidth',LINEWIDTH,...
        uu,-3-sqrt(9-uu.^2),':k','linewidth',LINEWIDTH)
hold off
ylim([floor(min(X(:,2))),1+ceil(max(X(:,2)))])
grid
text(-2.0,0.5,'h_c(x)=0','fontsize',FONTSIZE)
set(gca,'xticklabel',{' ',' ',' ',' '})
set(gca,'yticklabel',{' ',' ',' ',' '})
daspect([1 1 1])
set(gca,'fontsize',FONTSIZE);


print(gcf,'reglogrnr1nolinear.eps','-depsc')

