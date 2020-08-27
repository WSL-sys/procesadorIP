function res = guardarRemota(lstRemotas,file)
% Crea un archivo TSn a partir de una lista de estaciones remotas.

X = TSNfiles;
largo = length(lstRemotas);
objX = TSNfiles;
for i=1:largo
    est = lstRemotas{i};
    objX = get(est,'senalFiltrada');
    datos(:,i) = objX.datos;
end
X.datos = datos;
canales = length(datos(1,:));
header = objX.header;
header.canales = canales;
X.header = header;
X.n_paginas = objX.n_paginas;
X.tiempo = objX.tiempo;
write_TSN(X,file);