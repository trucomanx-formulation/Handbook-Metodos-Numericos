%
MARKERSIZE=12;
FONTSIZE=24;
LINEWIDTH=3;
AMP=3;

B=[1;1;2];
alpha=0.5;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P=zeros(2,32);


P=[2.2183;2.2183];
%P=[11.0999/5;11.0999/5]; 
%P=[11/5;11/5]; %% No existe inversa
%P=[9/5;9/5]; %% No existe inversa
%P=[7/5;7/5]; %% No existe inversa
%P=[7.032993/5;7.032993/5];
PEND=funde(P(1),P(2),B,alpha,P)
JJ=funj(P)

ERR=fune(P(1,end),P(2,end),B,alpha,P);
II=0;
MAXITER=5;


	tx = ty = linspace (0.0, AMP, 75)';
	[xx, yy] = meshgrid (tx, ty);
	err=fune(xx,yy,B,alpha,P);
	figure(1)
	surfc(xx,yy,err)
	hz=zlabel('e_0(x)');
	set(hz,'fontsize',FONTSIZE);
	hx=xlabel('x_1');
	set(hx,'fontsize',FONTSIZE);
	hy=ylabel('x_2');
	set(hy,'fontsize',FONTSIZE);
	set(gca, "fontsize", FONTSIZE);
	zlim([0 max(max(err))])
	colormap(jet)
	view([-10, 40])%view([0, 0])%
	print(gcf,'surfcfx3-0.eps','-depsc',['-F:' num2str(FONTSIZE)])


while ((ERR(end)>0.001^2)&&(length(ERR)<MAXITER))

	X=P(:,end);
	JJ=funj(X);
	F =funf(X);

	[INVERSA RCOND]=inv(JJ'*JJ+alpha*eye(2));
	if(RCOND==0)
		error(['Not exist inverse matrix to P:[' num2str(X(1)) ',' num2str(X(2)) ']']);
	endif


	
%	tx = ty = linspace (0.0, AMP, 75)';
%	[xx, yy] = meshgrid (tx, ty);
%	err=fune(xx,yy,B,alpha,X);
%	figure(1)
%	surfc(xx,yy,err)
%	hz=zlabel('e(x)');
%	set(hz,'fontsize',FONTSIZE);
%	hx=xlabel('x_1');
%	set(hx,'fontsize',FONTSIZE);
%	hy=ylabel('x_2');
%	set(hy,'fontsize',FONTSIZE);
%	set(gca, "fontsize", FONTSIZE);
%	zlim([0 max(max(err))])
%	colormap(jet)
%	view([-10, 40])%view([0, 0])%
%	print(gcf,['surfcfx3-' num2str(II) '.eps'],'-depsc',['-F:' num2str(FONTSIZE)])

	P(:,end+1)=X-INVERSA*JJ'*(F-B);
	ERR=[ERR fune(P(1,end),P(2,end),B,alpha,X)];

	II=II+1;
endwhile


	
%	tx = ty = linspace (0.0, AMP, 75)';
%	[xx, yy] = meshgrid (tx, ty);
%	err=fune(xx,yy,B,alpha,P(:,end));
%	figure(1)
%	surfc(xx,yy,err)
%	hz=zlabel('e(x)');
%	set(hz,'fontsize',FONTSIZE);
%	hx=xlabel('x_1');
%	set(hx,'fontsize',FONTSIZE);
%	hy=ylabel('x_2');
%	set(hy,'fontsize',FONTSIZE);
%	set(gca, "fontsize", FONTSIZE);
%	zlim([0 max(max(err))])
%	colormap(jet)
%	view([-10, 40])%view([0, 0])%
%	print(gcf,['surfcfx3-' num2str(II) '.eps'],'-depsc',['-F:' num2str(FONTSIZE)])

PEND=funde(P(1,end),P(2,end),B,alpha,P(:,end))
P
ERR
JJ=funj(P(:,end))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D=[linspace(0,AMP,201);linspace(0,AMP,201)];
E=fune(D(1,:),D(2,:),B,0*alpha,[0;0]);
DT=sqrt(D(1,:).^2 + D(2,:).^2);

PT=sqrt(P(1,:).^2 + P(2,:).^2);

figure(2)
plot(DT,E,'linewidth',LINEWIDTH)
hold on
plot(PT,ERR,"-o","markersize", MARKERSIZE,'linewidth',LINEWIDTH)
hx=xlabel('r=||x||');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('||f(x)-b||^2');
set(hy,'fontsize',FONTSIZE);
%hl=legend("X_k");
%set(hl,"fontsize", FONTSIZE);
set(gca, "fontsize", FONTSIZE);
xlim([0 max(DT)]);
ylim([0 max(E)]);
hold off
print(gcf,'plotfx3.eps','-depsc',['-F:' num2str(FONTSIZE)])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for JJ=1:MAXITER
    D=linspace(0,AMP,41);%sort(rand(1,81))*AMP;%linspace(0,AMP,41);
    for II=1:MAXITER
        EK{II}=fune(D,D,B,alpha,P(:,II));
    endfor
    DTK{JJ}=sqrt(2)*D;
endfor
PT=sqrt(P(1,:).^2 + P(2,:).^2);

figure(3)
plot(	    DTK{1},EK{1},"-^","markersize", MARKERSIZE,'linewidth',LINEWIDTH/2, ...
	    DTK{2},EK{2},"-v","markersize", MARKERSIZE,'linewidth',LINEWIDTH/2, ...
	    DTK{3},EK{3},"-","markersize", MARKERSIZE,'linewidth',LINEWIDTH/2, ...
	    DTK{4},EK{4},"-s","markersize", MARKERSIZE,'linewidth',LINEWIDTH/2, ...
	    DTK{5},EK{5},"-x","markersize", MARKERSIZE,'linewidth',LINEWIDTH/2, ...
	    %DTK{6},EK{6},"-.","markersize", MARKERSIZE,'linewidth',LINEWIDTH/2, ...
	    %DTK{7},EK{7},"--","markersize", MARKERSIZE,'linewidth',LINEWIDTH/2, ...
	    PT,ERR      ,"r-o","markersize", MARKERSIZE,'linewidth',LINEWIDTH)

hx=xlabel('||x||');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('e_k(x)');
set(hy,'fontsize',FONTSIZE);
hl=legend("e_0(x)","e_1(x)","e_2(x)","e_3(x)","e_4(x)","e_k(x_k)","location", "eastoutside");
set(hl,"fontsize", FONTSIZE);
set(gca, "fontsize", FONTSIZE);
xlim([0 AMP*sqrt(2)]);
ylim([0 max(E)]);
hold off
set(gca, "position", [0.15, 0.15, 0.65, 0.79]) 
print(gcf,'plotfx3all.eps','-depsc',['-F:' num2str(FONTSIZE)])%,'-tight'
