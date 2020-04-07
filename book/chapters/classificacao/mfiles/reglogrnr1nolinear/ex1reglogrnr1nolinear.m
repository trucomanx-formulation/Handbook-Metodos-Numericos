%
%close all
clear
DATA.LINEWIDTH=4;
DATA.FONTSIZE=28;
DATA.MARKERSIZE=20;



X1=load('data1.txt'); 
X2=load('data2.txt');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function H=func_h(C,X)
    H=C(1)*((X(:,1)-C(2)).^2+(X(:,2)-C(3)).^2-C(4).^2);
endfunction

function a=func_j(C,X)
    a=[ (X(:,1)-C(2)).^2+(X(:,2)-C(3)).^2-C(4).^2, ...
        -2*C(1)*(X(:,1)-C(2)), ...
        -2*C(1)*(X(:,2)-C(3)), ...
        -2*C(1)*C(4)*ones(size(X,1),1) ];
endfunction

function F=func_sigmoid(C,X)
    F=1./(1.0+exp(-func_h(C,X)));
endfunction


function H=func_logit(F)
    H=log(F./(1-F));
endfunction

function C=func_getc(X1,X2,B,DATA)

    Y1=B*ones(size(X1,1),1);
    Y2=(1-B)*ones(size(X2,1),1);


    X=[X1;X2];
    Y=[Y1;Y2];

    C=[1;1;1;1]/10;
    for II=1:20
        A=func_j(C,X);
        H=func_h(C,X);
        C=C-inv(A'*A+0.01*eye(4))*A'*(H-func_logit(Y));
    endfor

    L=32;
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
    %hx=xlabel('x_1')
    %set(hx,'fontsize',DATA.FONTSIZE);
    %hy=ylabel('x_2')
    %set(hy,'fontsize',DATA.FONTSIZE);
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
    %daspect([1 1 1])

    set(gca,'fontsize',DATA.FONTSIZE);

endfunction

B=0.1
C=func_getc(X1,X2,B,DATA)
%set(gca,'linewidth',LINEWIDTH);
print(gcf,'ex1s1-reglogrnr1nolinear.eps','-depsc',['-F:' num2str(DATA.FONTSIZE)])

B=0.001
C=func_getc(X1,X2,B,DATA)
%set(gca,'linewidth',LINEWIDTH);
print(gcf,'ex1s2-reglogrnr1nolinear.eps','-depsc',['-F:' num2str(DATA.FONTSIZE)])
