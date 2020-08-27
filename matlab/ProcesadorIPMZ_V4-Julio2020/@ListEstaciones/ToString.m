function str=ToString(X)
%str=ToString(X)
%
%Crea una arreglo de strings (cells) con los objetos Estaciones que
%contiene X.
%


largo = length(X.Estaciones);
%Transmisor
%str(1) = cellstr('Serie_Tiempo canal Xt1 Xt2 Frecuencia');
%s = ToStringTrans(X.Transmisor);
%str(2) = cellstr(s);

%Estacion remota
%str(3) = cellstr('Serie_Tiempo Impedancia canal canal_remoto Xt1 Xt2 Xr1 Xr2');
%s = ToString(X.EstacionRemota);
%str(4) = cellstr(s);

%Estaciones IP
%str(5) = cellstr('Serie_Tiempo Impedancia canal canal_remoto Xt1 Xt2 Xr1 Xr2');
if(largo>1)
    for i = 2:(largo)
            s = ToString(X.Estaciones(i));
            str(i-1) = cellstr(s);  
    end
end

