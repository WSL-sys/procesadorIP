function [X,Y]=Sacar(X,index)
%constructor del objeto de lista de estaciones.


Y = X.Estaciones(index);
j=1;
for i = 1:length(X.Estaciones)
    if i == index+1
    else
        Est(j)=X.Estaciones(i);
        j = j + 1;
    end
end
X.Estaciones = Est;

