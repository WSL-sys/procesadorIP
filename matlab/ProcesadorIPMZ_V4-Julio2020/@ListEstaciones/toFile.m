function Y = toFile(Y,file)
fd=fopen(file,'wt');
Y=ordenarEstaciones(Y);
tr=Y.Transmisor;
str=toStringAllTrans(tr);
fprintf(fd,'%s\n',str);
X=Y.EstacionRemota;
X=set(X,'frecuencia',get(tr,'frecuencia'));
X=set(X,'corriente',get(tr,'corriente'));
X=set(X,'Xt1',get(tr,'Xt1'));
X=set(X,'Xt2',get(tr,'Xt2'));
str=toStringAllRem(X);
fprintf(fd,'%s\n',str);
for i=2:length(Y.Estaciones)
    X=Y.Estaciones(i);
    % asignacion de frecuencia, corriente y coordenadas del transmisor en
    % cada estacion.
    X=set(X,'frecuencia',get(tr,'frecuencia'));
    X=set(X,'corriente',get(tr,'corriente'));
    X=set(X,'Xt1',get(tr,'Xt1'));
    X=set(X,'Xt2',get(tr,'Xt2'));
    str=toStringAll(X);
   fprintf(fd,'%s\n',str);
end
fclose(fd);
%     global objLstEst;
%     if length(getTransmisor(objLstEst)) < 1
%     else
%         tr = getTransmisor(objLstEst);
%         X=set(X,'frecuencia',get(tr,'frecuencia'));
%         X=set(X,'corriente',get(tr,'corriente'));
%         X=set(X,'Xt1',get(tr,'Xt1'));
%         X=set(X,'Xt2',get(tr,'Xt2'));
%     end