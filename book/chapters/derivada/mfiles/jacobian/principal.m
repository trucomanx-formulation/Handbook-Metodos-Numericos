%
DAT.MARKERSIZE=12;
DAT.FONTSIZE=24;
DAT.LINEWIDTH=1.5;

AMP=1.5;

P=[1.0;1.0]
[uu,vv]=funcF(P(1),P(2))
[JL1,JL2]=funcJ(P(1),P(2))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[VX,VY] = meshgrid(linspace(0.5,AMP,5));
HX=VX';
HY=VY';

plot(	VX,VY,'r-','linewidth',DAT.LINEWIDTH, ...
	HX,HY,'b-','linewidth',DAT.LINEWIDTH)
set(gca,'xtick',linspace(0.5,AMP,5));
set(gca,'ytick',linspace(0.5,AMP,5));
hold on
scatter(P(1),P(2),200,'k','o','linewidth',2*DAT.LINEWIDTH)
hold off
xlim([0.5 AMP]);
ylim([0.5 AMP]);
hx=xlabel('x_1');
set(hx,'fontsize',DAT.FONTSIZE);
hy=ylabel('x_2');
set(hy,'fontsize',DAT.FONTSIZE);
set(gca,'fontsize',DAT.FONTSIZE)
print(gcf,'jacobian1.eps','-depsc',['-F:' num2str(DAT.FONTSIZE)])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[VU,VV]=funcF(VX,VY);
[HU,HV]=funcF(HX,HY);

plot(	VU,VV,'r-','linewidth',DAT.LINEWIDTH, ...
	HU,HV,'b-','linewidth',DAT.LINEWIDTH)
hold on
scatter(uu,vv,200,'k','o','linewidth',2*DAT.LINEWIDTH)
quiver([uu;uu],[vv;vv],[JL1(1);JL2(1)],[JL1(2);JL2(2)],'color',[0 0 0],'linewidth',2*DAT.LINEWIDTH);
hold off
%xlim([0 AMP]);
%ylim([0 AMP]);
hx=xlabel('u_1');
set(hx,'fontsize',DAT.FONTSIZE);
hy=ylabel('u_2');
set(hy,'fontsize',DAT.FONTSIZE);
set(gca,'fontsize',DAT.FONTSIZE)
print(gcf,'jacobian2.eps','-depsc',['-F:' num2str(DAT.FONTSIZE)])
