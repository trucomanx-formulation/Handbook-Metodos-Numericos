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

A1=0.001;
u1=[-8   -7.5 -3  -4];
v1=[-7.5 -2   -8  -4];
f1=0*u1+A1;

A2=0.999;
u2=[3  0 1 2];
v2=[ 2 1 3 0 ];
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
surf(UU,VV,FF)
hx=xlabel('x');
set(hx,'fontsize',FONTSIZE);
grid
%set(gca,'xticklabel',{' ',' ',' ',' '})
%set(gca,'yticklabel',{' ',' ',' ',' '})
%daspect([4 1 1])
set(gca,'fontsize',FONTSIZE);
colormap(jet)
hold on
hs=scatter3(X(:,1),X(:,2),F,128,'k','filled');
set(hs,'linewidth',LINEWIDTH);
hold off
print(gcf,'reglogrnr1b.eps','-depsc')

figure(2)
scatter(u1',v1',1024,'b','^','linewidth',LINEWIDTH)
hold on
scatter(u2',v2',1024,'r','o','linewidth',LINEWIDTH)
hold off
hold on
uu=linspace(min(X(:,1)),max(X(:,1)));
plot(uu,-(C(1)/C(2))*uu-(C(3)/C(2)),':k','linewidth',LINEWIDTH)
hold off
ylim([floor(min(X(:,2))),1+ceil(max(X(:,2)))])
grid
text(1.0,-5,'h_c(x)=0','fontsize',FONTSIZE)
set(gca,'xticklabel',{' ',' ',' ',' '})
set(gca,'yticklabel',{' ',' ',' ',' '})
%daspect([1 1 1])
set(gca,'fontsize',FONTSIZE);


print(gcf,'reglogrnr1.eps','-depsc')

