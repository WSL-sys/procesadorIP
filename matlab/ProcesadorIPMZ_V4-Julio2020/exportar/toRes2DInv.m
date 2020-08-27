function C=toRes2DInv(objLstShot,file) %C=toRes2DInv(lista)

fid = fopen(file,'wt');
shots = objLstShot.Shots;
fprintf(fid,'Hola\n%d\n%d\n%d\n%d\n%d\nChargeability\nmsec\n%d\t%d\n',125,6,sum((1:length(shots))),0,1,0.1,1);
k=1;
for i=1:length(shots)
    shot = shots{i};
    ests = shot.objLstEst;
    for j=1:length(ests)
        est = get(ests,j);
        
        Xt2=get(est,'Xt2');
        Xr1=get(est,'Xr1');
        Xr2=get(est,'Xr2');
        esp = abs(Xr2 - Xr1); %espaciamiento
        N=(Xr1-Xt2)/esp;
        N=abs(N);
        res = num2str(get(est,'res'));
        carg=num2str(get(est,'carg'));
        %str(i,j)=[num2str(Xt2),',',num2str(esp),',',num2str(N),',',res,',',carg];
        fprintf(fid,'%s\t%s\t%d\t%s\t%s\n',num2str(Xt2),num2str(esp),N,res,carg);%num2str(N),res,carg);
        k = k+1;
    end
end
 
fclose(fid);
% C(1:length(B),1:5)=0;
% for i = 1:length(B)
%     C(i,1) = Xt2(); %posicion del electrodo de corriente (Xt2)
%     espaciamiento = (B(i,4)-B(i,3)); %Xr2 - Xr1
%     C(i,2) = espaciamiento; %posicion del electrodo de corriente
%     C(i,3) = (B(i,4)-B(i,2))/espaciamiento; %N distancia entre el primer electrodo(Xr1) y el transmisor(Xt2)
%     C(i,4) =  B(i,5); %(Resistividad)
%     C(i,5) =  B(i,6); %(Cargabilidad)
% end

%save('-ascii',file,'C');