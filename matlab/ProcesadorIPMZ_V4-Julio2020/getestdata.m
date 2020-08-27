function [RRR,CCC]=pseudoseccion(ListShot)

%Parametros
global objLstShot;
shots = objLstShot.Shots;

%por cada shot 
%objLstShot_tmp=ordenar(objLstShot); %ordena los shot deacuerdo a la posiciopn del transmisor.
N = length(shots);
%obtiene el espaciamiento entre receptores y transmisor.
% if length(shots)>1
%     shot1 = shots{1};
%     shot2 = shots{2};
%     objLstEst = shot1.objLstEst;
%     est = get(objLstEst,1);
%     Xr1 = get(est,'Xr1');
%     Xr2 = get(est,'Xr2');
%     dXr = Xr2 - Xr1; 
%     objLstEst = shot1.objLstEst;
%     Xt1 = get(getTransmisor(objLstEst),'Xt2');
%     objLstEst = shot2.objLstEst;
%     Xt2 = get(getTransmisor(objLstEst),'Xt2');
%     dXt = abs(Xt1-Xt2);
% else
%     shot1 = shots{1};
%     objLstEst = shot1.objLstEst;
%     est = get(objLstEst,1);
%     Xr1 = get(est,'Xr1');
%     Xr2 = get(est,'Xr2');
%     dXr = Xr2 - Xr1; 
%     objLstEst = shot1.objLstEst;
%     Xt1 = get(getTransmisor(objLstEst),'Xt2');
%     dXt = 100; %abs(Xt1)
% end

%XX=0:dXr:maxX;
%YY=0:-dXr/2:maxY;
k=1;
for i = 1:N
    shot = shots{i};
    ests = shot.objLstEst;
    M = length(ests);
    for j = 1:M
        est = get(ests,j);
        
        
      %calcula la posicion en la imagen
        Xt2=get(est,'Xt2');
        Xt1=get(est,'Xt1');
        Xr2=get(est,'Xr2');
        Xr1=get(est,'Xr1');
        
        resis = get(est,'res');
        RRR(k,1)=Xr1;
        RRR(k,2)=Xr2;
        RRR(k,3)=Xt1;
        RRR(k,4)=Xt2;
        RRR(k,6)=i;
        RRR(k,7)=j;
        
        CCC(k,1)=Xr1;
        CCC(k,2)=Xr2;
        CCC(k,3)=Xt1;
        CCC(k,4)=Xt2;
        CCC(k,6)=i;
        CCC(k,7)=j;
             
        if get(est,'QC')
        if isnumeric(resis)
             RRR(k,5)=resis;% = Res(nx,ny) = resis;
         else
             RRR(k,5)=str2num(resis);% Res(nx,ny) = str2num(resis);
         end
         
         cargab = get(est,'carg');
         if isnumeric(cargab)
             CCC(k,5)=cargab;%Carg(nx,ny) = cargab;
         else
             CCC(k,5)=str2num(cargab);%Carg(nx,ny) = str2num(cargab);
         end
        else
            CCC(k,5)=NaN;
            RRR(k,5)=NaN;
        end
                k=k+1;    
    end
 end
