function str=toStringAll(X)
    c=[char(9),';',char(9)];
    str = [X.filename,c,X.file,c,round(num2str(X.serie)),c,round(num2str(X.canal)),c,num2str(X.azimut),c,num2str(X.ganancia),c,num2str(X.Xr1),c,num2str(X.Xr2),c,num2str(X.delta_e),c,num2str(X.Xt1),c,num2str(X.Xt2),c,num2str(X.frecuencia),c,num2str(X.corriente),c,X.calibracion,c,X.calibracionHx,c,X.calibracionHy,c,num2str(X.res),c,num2str(X.carg),c,num2str(X.corte),c,X.fileFiltrada,c,X.fileStackeada,c,X.fileIP,c,X.fileMiniStackeada,c,X.fileRuidoTelurico,c,num2str(X.QC),c,num2str(X.SP)];