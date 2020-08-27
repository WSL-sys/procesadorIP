function objEst = procesar(objEst)

%objEst.X=open_TSN(objEst.X,objEst.file,objEst.canal);
%objEst = calibrar(objEst);
objEst.ruidoTelurico = [];
lstFiltros = objEst.lstFiltros;

if length(lstFiltros.filtros) > 0
    estFilt = procesar(objEst.lstFiltros,objEst);
else
    estFilt = objEst;
end
objEst.senalFiltradaAnt = objEst.senalFiltrada;
objEst.senalFiltrada = estFilt.X;
objEst.ruidoTeluricoAnt = objEst.ruidoTelurico;
objEst.ruidoTelurico = estFilt.ruidoTelurico;
%estStk = execute(objEst.stack,objEst);
objEst.senalStackeadaAnt = objEst.senalStackeada;
objEst.senalStackeada = execute(objEst.stack,estFilt);
objEst = calcular_IP(objEst);
stackcrudo = execute(objEst.stack,objEst);
objEst=set(objEst,'SP',calcular_SP(objEst,stackcrudo));
