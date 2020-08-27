function str=ToString(X)
%str=ToString(X)
%Imprime el contenido de un objEstacion tipo EstacionIP en un string.
%
%String = <X.file> <X.serie> <X.canal> <X.azimut> <X.ganancia> <X.Xr1>
%<X.Xr2> <X.calibracionHx> <X.calibracionHy>


%c = X.caracter_separacion;
%str = [X.file,c,round(num2str(X.serie)),c,round(num2str(X.canal)),c,num2str(X.azimut),c,num2str(X.ganancia),c,num2str(X.Xr1),c,num2str(X.Xr2),c,X.calibracion,c,X.calibracionHx,c,X.calibracionHy,c,X.res,c,X.carg,c,X.corte,c];
str = [X.filename,' ',round(num2str(X.canal))];