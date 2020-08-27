function X=ListEstaciones()
%constructor del objeto de lista de estaciones.
Y=objEstaciones;
X.Estaciones=[Y];
X.EstacionRemota=Y;
X.Transmisor=Y;
X = class(X,'ListEstaciones');


