%
%close all
clear
DATA.LINEWIDTH=4;
DATA.FONTSIZE=28;
DATA.MARKERSIZE=20;



X1=load('data1.txt'); 
X2=load('data2.txt');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function F=func_sigmoid(C,X)
    N=size(X,1);
    F=zeros(N,1);
    for II=1:N
        F(II)=1./(1.0+exp(-[1 X(II,:)]*C));
    endfor
endfunction

function H=func_logit(F)
    H=log(F./(1-F));
endfunction

function C=func_getc(X1,X2,B,DATA)

    Y1=B*ones(size(X1,1),1);
    Y2=(1-B)*ones(size(X2,1),1);


    X=[X1;X2];
    Y=[Y1;Y2];
    A=[ones(size(X,1),1) X];

    C=inv(A'*A)*A'*func_logit(Y);

    L=48;
    U=linspace(round(min(X(:,1)))-1,round(max(X(:,1)))+1,L);
    V=linspace(round(min(X(:,2)))-1,round(max(X(:,2)))+1,L);
    [UU VV]=meshgrid(U,V);
    ZZ=zeros(size(UU));
    L=numel(UU);
    for II=1:L
        ZZ(II)=func_sigmoid(C,[UU(II) VV(II)]);
    endfor
   
    pcolor(UU,VV,ZZ)
    colormap(gray)
    shading interp;
    hc=colorbar;
    set(hc,'fontsize',DATA.FONTSIZE);

    hold on
    scatter(X1(:,1),X1(:,2),512,'b','^','linewidth',DATA.LINEWIDTH) 
    hold off
    hold on
    scatter(X2(:,1),X2(:,2),512,'r','o','linewidth',DATA.LINEWIDTH) 
    hold off
    hold on
    plot(U,-(C(1)/C(3))-(C(2)/C(3))*U,':k','linewidth',DATA.LINEWIDTH)
    ylim([min(V) max(V)])
    hold off

    grid

    set(gca,'fontsize',DATA.FONTSIZE);

endfunction

B=0.1
C=func_getc(X1,X2,B,DATA)
%set(gca,'linewidth',LINEWIDTH);
print(gcf,'ex1s1-reglogrnr1.eps','-depsc')

B=0.001
C=func_getc(X1,X2,B,DATA)
%set(gca,'linewidth',LINEWIDTH);
print(gcf,'ex1s2-reglogrnr1.eps','-depsc')
