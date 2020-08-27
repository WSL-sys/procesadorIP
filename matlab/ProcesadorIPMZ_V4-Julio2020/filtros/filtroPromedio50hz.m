function est = filtroPromedio50(est)
% filtroPromedio50(est) = retorna una estacion
% funcion de filtrado de 50 hz usando promedios.
X = get(est,'X');
header=X.header;
fm=header.f_muestreo;

datos = X.datos;
% canal = get(est,'canal');
datos = filter([1 1 1]/3,1,datos); % datos desfasados
datos = [datos(2:length(datos)); 0];
X.datos = datos;

ruido = get(est,'ruidoTelurico');
% canal = get(est,'canal');
if ~isempty(ruido)
    ruido = filter([1 1 1]/3,1,ruido); % datos desfasados
    ruido = [ruido(2:length(ruido)); 0];
    est = set(est,'ruidoTelurico',ruido);
end
%X.datos = datos;

est = set(est,'X',X);