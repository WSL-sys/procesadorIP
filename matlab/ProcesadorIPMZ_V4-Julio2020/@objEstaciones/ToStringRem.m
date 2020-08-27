function str=ToStringRem(X)
%str=ToString(X)
%Imprime el contenido de un objEstacion tipo Remota en un string.
%
%String = <X.file> <X.serie> <X.canal> <X.azimut> <X.ganancia> <delta_e> <X.calibracion> <X.calibracionHx> <X.calibracionHy>


%c = X.caracter_separacion;
%str = [X.file,c,round(num2str(X.serie)),c,round(num2str(X.canal)),c,num2str(X.azimut),c,num2str(X.ganancia),c,num2str(X.delta_e),c,X.calibracion,c,X.calibracionHx,c,X.calibracionHy];
str = [X.filename,' ',round(num2str(X.canal))];