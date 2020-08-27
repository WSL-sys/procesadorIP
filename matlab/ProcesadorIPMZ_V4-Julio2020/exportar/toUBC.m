function C=toUBC(objLstShot,file) %C=toUBC(lista)

fid = fopen([file,'.car'],'wt');
fid2 = fopen([file,'.res'],'wt');
shots = objLstShot.Shots;
fprintf(fid,'CARGABILIDAD\npole-dipole\n');
fprintf(fid2,'POTENCIAL\npole-dipole\n');
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
        N=abs((Xr1-Xt2)/esp);
        get(est,'res')
        if (isnumeric(get(est,'res'))==0)
        res = str2num(get(est,'res'));
        else
        res = (get(est,'res'));    
        end    
        if (isnumeric(get(est,'carg'))==0)
            carg= str2num(get(est,'carg'));
        else
            carg= (get(est,'carg'));      
        end 
            fprintf(fid,'%d\t%d\t%d\t%d\t%d\t%d\n',Xt2,Xt2,Xr1,Xr2,carg,0.0001);
            a = abs(Xr2-Xr1);
            b = abs(Xr1-Xt2);
            factor_geometrico = 2*pi*b*(a+b)/a;
            potencial =(res)/factor_geometrico;
            fprintf(fid2,'%d\t%d\t%d\t%d\t%d\t%d\n',Xt2,Xt2,Xr1,Xr2,potencial,0.0001);
           
        end
end

fclose(fid);
fclose(fid2);
% 
% largo = length(lista);
% B = [];
% for i = 1:largo
%     directorio = char(lista(i)); 
%     A = load('-ascii',[directorio]);
%     B = [B;A];
% end
% 
% C(1:length(B),1:5)=0;
% for i = 1:length(B)
%     C(i,1) = B(i,2); %posicion del electrodo de corriente
%     C(i,2) = B(i,2); %posicion del electrodo de corriente
%     
%     C(i,3) =  B(i,3); %???????????????
%     C(i,4) =  B(i,4); %N????????????????
%     C(i,5) =  B(i,5); %Resistividad
%     C(i,6) =  10^-10; %Resistividad??????????????
% end
% save('-ascii','UBCres.dat','C');
% 
% for i = 1:length(B)
%     C(i,1) = B(i,2); %posicion del electrodo de corriente
%     C(i,2) = B(i,2); %posicion del electrodo de corriente
%     
%     C(i,3) =  B(i,3);
%     C(i,4) =  B(i,4); %N
%     C(i,5) =  B(i,6); %Resistividad
%     C(i,6) =  0.001; %Resistividad
% end
% save('-ascii','UBCcarg.dat','C');
