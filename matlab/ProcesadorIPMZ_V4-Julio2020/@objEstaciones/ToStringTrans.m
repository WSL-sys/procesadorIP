function str=ToStringTrans(X)
%
%str=ToStringTrans(X)
%
%Imprime el contenido de un objEstacion tipo transmisor en un string.
%
%String = <X.file> <X.serie> <X.canal> <X.azimut> <X.ganancia> <X.Xt1>
%<X.Xt2> <X.frecuencia> <X.corriente>


%c = X.caracter_separacion;
%str = [X.file,c,num2str(round(X.serie)),c,num2str(round(X.canal)),c,num2str(X.azimut),c,num2str(X.ganancia),c,num2str(X.Xt1),c,num2str(X.Xt2),c,num2str(X.frecuencia),c,num2str(X.corriente)];
str = [X.filename,' ',round(num2str(X.canal))];