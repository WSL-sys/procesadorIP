function C=toGeoSoft(objLstShot,file)

%% Dialogo para obtener informacion adicional
prompt={'Titulo:','Numero de Linea:','T2X:','T2Y:','Frecuencia de Muestreo'};
name='Ingreso de Datos adicionales para GeoSoft';
numlines=1;
defaultanswer={'Titulo Proyecto','1','1','1','150'};
options.Resize='on';
options.WindowStyle='modal';
options.Interpreter='tex';

answer=inputdlg(prompt,name,numlines,defaultanswer,options);

if length(answer) <= 0
    msgbox('No se puede continuar','Advertencia','modal');
    return
end
%% Fin dialogo

fid = fopen(file,'wt');

shots = objLstShot.Shots;

offset = 0;
datos = [];
curva_IP =[];
c = char(9);
IP = [];
stack_m = [];
fm=str2num(answer{4});
for i=1:length(shots)
    shot = shots{i};
    ests = shot.objLstEst;
    largoEst = length(ests);
    for j=1:largoEst
        est = get(ests,j);
        Xt1=get(est,'Xt1');        
        Xt2=get(est,'Xt2');
        Xr1=get(est,'Xr1');
        Xr2=get(est,'Xr2');
        I = get(est,'corriente');
        IP = get(est,'curva_IP')';
        curva_IP(offset + j,:) = IP(2,:);
        stack = get(est,'senalStackeada');
        stack_m(offset + j,:) = stack(1:6:end);
        %vmax=max(stack);% PIA
        %vmin=min(stack);% PIA
        SP=get(est,'SP');%((vmax+vmin)/2)*1000;% PIA
        %calcula el SP*****JAB
        %X = get(est,'X');
        %SP=calc_SP(X,1,get(est,'frecuencia'));
        
        esp = abs(Xr2 - Xr1); %espaciamiento
%        a = abs(Xr2-Xr1);
%        b = min(abs(Xr1-Xt2),abs(Xr2-Xt2));
%        factor_geometrico = 2*pi*b*(a+b)/a;
%         N=(Xr1-Xt2)/esp;
%         N=abs(N);
        %global est
        %    if(isempty(get(est,'res'))
        %else
        res = (get(est,'res'));
        %end
        Vp = get(est,'V');%mean(res)*I/factor_geometrico;
        carg=(get(est,'carg'));
        
        X=get(est,'X');
        filename=get(est,'filename');
        tiempo=X.tiempo;
        if length(tiempo)>0
            Tstart=datestr((tiempo(1)+datenum(2000,1,1,0,0,0)*24*3600)/24/3600);
            Tend=datestr((tiempo(end)+datenum(2000,1,1,0,0,0)*24*3600)/24/3600);
        else
            Tstart=datestr((0+datenum(2000,1,1,0,0,0)*24*3600)/24/3600);
            Tend=datestr((0+datenum(2000,1,1,0,0,0)*24*3600)/24/3600);    
        end
        % Se crean los datos
        QC=get(est,'QC');
        datos{offset + j} = [num2str(Xt1),c,num2str(Xt2),c,num2str(Xr1),c,num2str(Xr2),c,num2str(Vp),c,num2str(I),c,num2str(SP),c,num2str(carg),c,num2str(res),...
            c,num2str(Tstart),c,num2str(Tend),c,filename,c,num2str(QC)];
    end
    offset = offset + largoEst;
end

%% Calculamos los tiempos entre los puntos de la curva IP
T = num2str(IP(1,1));
for i=2:length(IP(1,:))
    T = [T,',',num2str(IP(1,i) - IP(1,i-1))];
end

% for i=1:length(stack_m(1,:))
%     T = [T,',',num2str(6*1000/fm)];
% end

%% comienza el encabezado del archivo
fprintf(fid,'%s\n',answer{1}); %% Titutlo
fprintf(fid,'LINE:%s ARRAY:PLDP DIPOLE:%s UNITS:M T2X:999999 T2Y:%s T=%s\n',answer{2},num2str(esp),answer{3},T); %% Segunda linea
fprintf(fid,'T1X\tT2X\tR1X\tR2X\tVp\tI\tSp\tM\tR\tTini\tTfin\tCaja\tQC'); %% Titulos de columnas primera parte

%% Titulos de columnas segunda parte (cantidad de datos IP)
for i=1:length(curva_IP(1,:))
    fprintf(fid,'\tIP%d',i-1);
end
% for i=1:length(stack_m(1,:))
%     fprintf(fid,'\tST%d',i-1);
% end
fprintf(fid,'\n');

%% Escritura de los datos requeridos al archivo
for i=1:length(datos)
    datosIP = num2str(curva_IP(i,1));
    for j=2:length(curva_IP(1,:))
        datosIP = [datosIP,c,num2str(curva_IP(i,j))];
    end
%     stackM = num2str(stack_m(i,1));
%     for j=2:length(stack_m(1,:))
%         stackM = [stackM,c,num2str(stack_m(i,j))];
%     end
    fprintf(fid,'%s\t%s\n',datos{i},datosIP);%%,stackM);
end
 
fclose(fid);
