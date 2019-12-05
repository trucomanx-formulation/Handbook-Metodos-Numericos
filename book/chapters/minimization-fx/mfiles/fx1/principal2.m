%
MARKERSIZE=12;
FONTSIZE=24;
LINEWIDTH=3;

B=[1;1;1.5];

tx = ty = linspace (0, 2, 25)';
[xx, yy] = meshgrid (tx, ty);
err=fune(xx,yy,B);
figure(1)
surfc(xx,yy,err)
colormap(jet)
view([-37.0, 13])
print(gcf,'surfcfx2.eps','-depsc',['-F:' num2str(FONTSIZE)])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P=zeros(2,32);

II=1;


P=[0.1;0.1];
PEND=funj(P)'*(funf(P)-B)

ERR=sqrt(fune(P(1,end),P(2,end),B));
while ((ERR(end)>0.001)&&(length(ERR)<6))
	JJ=funj(P(:,end));
	[INVERSA RCOND]=inv(JJ'*JJ);
	if(RCOND==0)
		error(['Not exist inverse matrix to P:[' num2str(P(1,end)) ',' num2str(P(2,end)) ']']);
	endif
	P(:,end+1)=P(:,end)+INVERSA*JJ'*(B-funf(P(:,end)));
	
	ERR=[ERR sqrt(fune(P(1,end),P(2,end),B))];
endwhile

PENDEND=funj(P(:,end))'*(funf(P(:,end))-B)
JJ=funj(P(:,end))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D=[linspace(0,2,201);linspace(0,2,201)];
E=sqrt(fune(D(1,:),D(2,:),B));
DT=sqrt(D(1,:).^2 + D(2,:).^2);

PT=sqrt(P(1,:).^2 + P(2,:).^2);

figure(2)
plot(DT,E,'linewidth',LINEWIDTH)
hold on
plot(PT,ERR,"-o","markersize", MARKERSIZE,'linewidth',LINEWIDTH)
%hl=legend("X_k");
%set(hl,"fontsize", FONTSIZE);
set(gca, "fontsize", FONTSIZE);
xlim([0 2.0]);
ylim([0 1.25*max(PT)]);
hold off
print(gcf,'plotfx2.eps','-depsc',['-F:' num2str(FONTSIZE)])
