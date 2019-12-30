%
DAT.MARKERSIZE=12;
DAT.FONTSIZE=12;
DAT.LINEWIDTH=3;


P=[3 -2 0;-2 3 -1; 0 -1 1];

x1=[0;0;1];
dx1=[0;0;0];

[w V d1  d2]=func_params(P,x1,dx1,0)

VD1=V*diag(d1)

T=linspace(0,30,100);
X=funcdifsorder2(w,V,d1,d2,T);

plot(	T,X(1,:),'.',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ...
	T,X(2,:),'k-.',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ...
	T,X(3,:),'r-',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH);
daspect([2.45 1 1])
    %set (gca, "ygrid", "on");
    %ylim([-2 8])
    %xlim([min(T) max(T)]);
    hx=xlabel('t');
    set (hx, "fontsize", DAT.FONTSIZE);
    hl=legend(' x_1(t)',' x_2(t)',' x_3(t)','location','eastoutside');
    INFO=get(hl,'position');
    set (hl,'position',[1.9*INFO(1) 1.3*INFO(2) 1.5*INFO(3) INFO(4)]);
    set (hl, "fontsize", DAT.FONTSIZE);
    set (gca, "fontsize", DAT.FONTSIZE);
print(gcf,'segundoroder1','-depsc','-tight',['-F:' num2str(DAT.FONTSIZE)])
