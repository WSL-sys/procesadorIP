function objEst = procesarRemota(objEst)

%objEst.X=open_TSN(objEst.X,objEst.file,objEst.canal);

lstFiltros = objEst.lstFiltros;
if length(lstFiltros.filtros) > 0
    estFilt = procesar(objEst.lstFiltros,objEst);
else
    estFilt = objEst;
end
objEst.senalFiltradaAnt = objEst.senalFiltrada;
objEst.senalFiltrada = estFilt.X;
%estStk = execute(objEst.stack,objEst);
objEst.senalStackeadaAnt = objEst.senalStackeada;
objEst.senalStackeada = execute(objEst.stack,estFilt);
%objEst = calcular_IP(objEst);
