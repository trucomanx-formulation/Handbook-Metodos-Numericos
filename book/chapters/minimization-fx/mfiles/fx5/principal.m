%
MARKERSIZE=12;
FONTSIZE=24;
LINEWIDTH=3;
B=[1;1;-1];

AMP=3.0;

tx = ty = linspace (0, AMP, 50)';
[xx, yy] = meshgrid (tx, ty);
err=fune(xx,yy,B);
figure(1)
surfc(xx,yy,err)
colormap(jet)
view([-10, 20])
print(gcf,'surfcfx3.eps','-depsc',['-F:' num2str(FONTSIZE)])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%P=[0.1;0.1]; %% minimo relativo
%P=[0.6;0.6]; %% Matriz J'*J nao tem inversa
%P=[1;1]; %% J=0
P=[0.8;0.8]; %% converge minimo absoluto
%P=[0.64;0.64]; %% converge minimo relativo
PEND=funj(P)'*(funf(P)-B)
JJ=funj(P)

ERR=sqrt(fune(P(1,end),P(2,end),B));
while (length(ERR)<800)% ((ERR(end)>0.001)&&(length(ERR)<8)) %% (length(ERR)<8))
	JJ=funj(P(:,end));
	[INVERSA RCOND]=inv(JJ'*JJ);
RCOND
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
D=[linspace(0,AMP,601);linspace(0,AMP,601)];
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
xlim([0 AMP*sqrt(2)]);
hold off
print(gcf,'plotfx3.eps','-depsc',['-F:' num2str(FONTSIZE)])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sqrt(P.^2+P.^2)
