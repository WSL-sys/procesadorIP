function str=toStringAllRem(X)
    c=[char(9),';',char(9)];
    str = [X.filename,c,X.file,c,round(num2str(X.serie)),c,round(num2str(X.canal)),c,num2str(X.azimut),c,num2str(X.ganancia),c,num2str(X.Xr1),c,num2str(X.Xr2),c,num2str(X.delta_e),c,num2str(X.Xt1),c,num2str(X.Xt2),c,num2str(X.frecuencia),c,num2str(X.corriente),c,X.calibracion,c,X.calibracionHx,c,X.calibracionHy,c,X.res,c,X.carg,c,X.corte,c,X.fileFiltrada,c,X.fileStackeada];
    