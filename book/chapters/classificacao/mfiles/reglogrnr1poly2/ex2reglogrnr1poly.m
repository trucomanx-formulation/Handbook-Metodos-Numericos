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
    F=1./(1.0+exp(-func_a(X)*C));
endfunction

function a=func_a(X)
    b0=ones(size(X,1),1);
    b1=X;
    b2=[X(:,1).^2 X(:,2).^2 X(:,1).*X(:,2)];
    a=[b0 b1 b2];
    
endfunction


function H=func_logit(F)
    H=log(F./(1-F));
endfunction

function plot_hx(X1,X2,C,DATA)
    X=[X1;X2];

    L=48;
    U=linspace(round(min(X(:,1)))-1,round(max(X(:,1)))+1,L);
    V=linspace(round(min(X(:,2)))-1,round(max(X(:,2)))+1,L);
    [UU VV]=meshgrid(U,V);
    ZZ=zeros(size(UU));
    SS=zeros(size(UU));
    L=numel(UU);
    for II=1:L
        ZZ(II)=func_a([UU(II) VV(II)])*C;
        SS(II)=func_sigmoid(C,[UU(II) VV(II)]);
    endfor


    %hold on
    s2=pcolor(UU,VV,SS);
    colormap(copper)
    shading interp;
    %set(s1,'edgecolor','none')
    set(s2,'facealpha',1.0)
    %hold off

    hold on
    s1=surf(UU,VV,ZZ);
    hx=xlabel("x_1");
    set(hx,'fontsize',DATA.FONTSIZE);
    hy=ylabel("x_2");
    set(hy,'fontsize',DATA.FONTSIZE);
    hz=zlabel("h_{c}(x)");
    set(hz,'fontsize',DATA.FONTSIZE);
    pos=get (hz,'position') 
    set (hz,'position',[pos(1) pos(2)-2 1.2*max(max(ZZ))]); 
    %shading interp;
    %set(s1,'edgecolor','none')
    set(s1,'facealpha',0.5)
    %colormap(jet)
    zlim([-1.2*max(max(ZZ)) 1.2*max(max(ZZ))]);
    grid on
    view([-38.986 47.931])
    hold off

    hold on
    scatter(X1(:,1),X1(:,2),512,'b','^','linewidth',DATA.LINEWIDTH) 
    hold off
    hold on
    scatter(X2(:,1),X2(:,2),512,'r','o','linewidth',DATA.LINEWIDTH) 
    hold off

    grid on
    set(gca,'fontsize',DATA.FONTSIZE);
endfunction

function C=func_getc(X1,X2,B,DATA)

    Y1=B*ones(size(X1,1),1);
    Y2=(1-B)*ones(size(X2,1),1);


    X=[X1;X2];
    Y=[Y1;Y2];
    A=func_a(X);

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
    %hold on
    %plot(U,-(C(1)/C(3))-(C(2)/C(3))*U,':k','linewidth',DATA.LINEWIDTH)
    %ylim([min(V) max(V)])
    %hold off

    grid

    set(gca,'fontsize',DATA.FONTSIZE);

endfunction

B=0.1
C=func_getc(X1,X2,B,DATA)
%set(gca,'linewidth',LINEWIDTH);
print(gcf,'ex2s1-reglogrnr1poly.eps','-depsc')

plot_hx(X1,X2,C,DATA);
print(gcf,'ex2s1-reglogrnr1polyhx.eps','-depsc','-tight',['-F:' num2str(DATA.FONTSIZE)])

B=0.001
C=func_getc(X1,X2,B,DATA)
%set(gca,'linewidth',LINEWIDTH);
print(gcf,'ex2s2-reglogrnr1poly.eps','-depsc')

plot_hx(X1,X2,C,DATA);
print(gcf,'ex2s2-reglogrnr1polyhx.eps','-depsc','-tight',['-F:' num2str(DATA.FONTSIZE)])

