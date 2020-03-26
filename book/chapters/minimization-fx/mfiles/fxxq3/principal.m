%
MARKERSIZE=12;
FONTSIZE=24;
LINEWIDTH=3;
AMP=3;

B=[1;1;2];
alpha=0.1;
Q=[0;0];

tx = ty = linspace (0.0, AMP, 75)';
[xx, yy] = meshgrid (tx, ty);
err=fune(xx,yy,B,alpha,Q);
figure(1)
surfc(xx,yy,err)
hz=zlabel('e(x)');
set(hz,'fontsize',FONTSIZE);
hx=xlabel('x_1');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('x_2');
set(hy,'fontsize',FONTSIZE);
set(gca, "fontsize", FONTSIZE);
zlim([0 max(max(err))])
colormap(jet)
view([-10, 40])%view([0, 0])%
print(gcf,'surfcfx3.eps','-depsc',['-F:' num2str(FONTSIZE)])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P=zeros(2,32);

P=[2;2];
%P=[11.0999/5;11.0999/5]; 
%P=[11/5;11/5]; %% No existe inversa
%P=[9/5;9/5]; %% No existe inversa
%P=[7/5;7/5]; %% No existe inversa
%P=[7.032993/5;7.032993/5];
PEND=funde(P(1),P(2),B,alpha,Q)
JJ=funj(P)

ERR=fune(P(1,end),P(2,end),B,alpha,Q);
while ((ERR(end)>0.001^2)&&(length(ERR)<8))
	X=P(:,end);
	JJ=funj(X);
	F =funf(X);

	[INVERSA RCOND]=inv(JJ'*JJ+alpha*eye(2));
	if(RCOND==0)
		error(['Not exist inverse matrix to P:[' num2str(X(1)) ',' num2str(X(2)) ']']);
	endif

	P(:,end+1)=X-INVERSA*(JJ'*(F-B)+alpha*(X-Q));
	ERR=[ERR fune(P(1,end),P(2,end),B,alpha,Q)];
endwhile

PEND=funde(P(1,end),P(2,end),B,alpha,Q)
P
ERR
JJ=funj(P(:,end))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D=[linspace(0,AMP,201);linspace(0,AMP,201)];
E=fune(D(1,:),D(2,:),B,alpha,Q);
DT=sqrt(D(1,:).^2 + D(2,:).^2);

PT=sqrt(P(1,:).^2 + P(2,:).^2);

figure(2)
plot(DT,E,'linewidth',LINEWIDTH)
hold on
plot(PT,ERR,"-o","markersize", MARKERSIZE,'linewidth',LINEWIDTH)
hx=xlabel('r=||x||');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('e(x)');
set(hy,'fontsize',FONTSIZE);
%hl=legend("X_k");
%set(hl,"fontsize", FONTSIZE);
set(gca, "fontsize", FONTSIZE);
xlim([0 max(DT)]);
ylim([0 max(E)]);
hold off
print(gcf,'plotfx3.eps','-depsc',['-F:' num2str(FONTSIZE)])
