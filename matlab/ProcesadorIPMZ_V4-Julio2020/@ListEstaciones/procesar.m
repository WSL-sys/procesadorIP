function objLstEst = procesar(objLstEst)
% calcula el tiempo corte de la primera estacion

% carga todos los datos de la estacion remota
global estRemota;
est = objLstEst.EstacionRemota;
XX = get(est,'X');
if length(XX.datos) == 0
    estRemota = cargarRemota(est);
end

corte = 0;
liberar;
for i=2:length(objLstEst.Estaciones)
    est = objLstEst.Estaciones(i);
    XX = get(est,'X');
    if length(XX.datos) == 0
        est  = set(est,'X',open_TSN(TSNfiles,get(est,'file'),get(est,'canal')));
%        est = calibrar(est);
        %   disp('hola');
    end
    %         try
    %              est = calibrar(est);
    %         catch
    %             msgbox('Error en la calibracion');
    %             return;
    %         end
    %est = set(est,'corte',corte);
    if i == 2
        % est = procesar(est);
        corte = corregirFase(est);
        %est = set(est,'corte',corte);

        %est = procesar(est);
    end
    est = set(est,'corte',corte);
    est = procesar(est);

    objLstEst.Estaciones(i) = est;
end
%est = objLstEst.EstacionRemota;
%est  = set(est,'X',open_TSN(TSNfiles,get(est,'file'),get(est,'canal')));
%est = calibrar(est);
%est = set(est,'corte',corte);
%est = procesarRemota(est);
objLstEst.EstacionRemota = estRemota;