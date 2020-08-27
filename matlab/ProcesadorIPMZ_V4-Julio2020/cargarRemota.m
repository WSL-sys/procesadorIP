function est = cargarRemotaSinc(est)
% Carga todos los canales de una estacion remota y devuelve una lista de
% ellos.
file = get(est,'file');
X = TSNfiles;
X = open_TSN_All(X,file);
est = set(est,'X',X);
% datos = X.datos;
% largo = length(datos(1,:))
% for i=1:largo
%     objX = get(est,'X');
%     objX.datos = datos(:,i);
%     est = set(est,'X',objX);
%     est = set(est,'canal',i);
%     lstRemotas{i} = est;
% end
    
