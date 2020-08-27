function est = filtroPromedio60(est)
% filtroPromedio50(est) = retorna una estacion
% funcion de filtrado de 50 hz usando promedios.
X = get(est,'X');
datos = X.datos;
% canal = get(est,'canal');
datos = filter([1 1 1 1 1]/5,1,datos); % datos desfasados
datos = [datos(4:length(datos)); 0];
X.datos = datos;
est = set(est,'X',X);
ruido = get(est,'ruidoTelurico');

if ~isempty(ruido)
    ruido = filter([1 1 1 1 1]/5,1,ruido); % datos desfasados
    ruido = [ruido(4:length(ruido)); 0];
    est = set(est,'ruidoTelurico',ruido);
end

%length(ruido)
%length(datos)
