function X=Agregar(X,Y,opcion)
%agrega estaciones a partir de objestaciones Y.

switch opcion
    case 3
        X.Estaciones(length(X.Estaciones) + 1)=Y;
    case 2
        X.EstacionRemota=Y;
    case 1
        X.Transmisor=Y;
    case default
end
        


