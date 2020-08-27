function X=set(X,option,value)
%X=Set(X,option,value)
% 

switch option
    case 'filename'
        X.filename = value;
    case 'file'
        X.file = value;
    case 'serie'
        X.serie = value;
    case 'ganancia'
        X.ganancia = value;
    case 'azimut'
        X.azimut = value;
    case 'impedancia'
        X.impedancia = value;
    case 'canal'
        X.canal = value;
    case 'canal_remoto'
        X.canal_remoto = value;
    case 'Xr1'
        X.Xr1 = value;
    case 'Xr2'
        X.Xr2 = value;
    case 'Xt1'
        X.Xt1 = value;
    case 'Xt2'    
        X.Xt2 = value;
    case 'frecuencia'    
        X.frecuencia = value;    
    case 'calibracion'
        X.calibracion = value;
    case 'calibracionHx'
        X.calibracionHx = value;
    case 'calibracionHy'
        X.calibracionHy = value;
    case 'calibracionHz'
        X.calibracionHz = value; 
    case 'delta_e'
        X.delta_e = value;     
    case 'tipo_arreglo'
        X.tipo_arreglo = value;     
    case 'corriente'
        X.corriente = value;     
    case 'X'
        X.X=value;     
    case 'carg'
        X.carg=value;
    case 'res'
        X.res=value;
    case 'cargAnt'
        X.cargAnt=value;
    case 'resAnt'
        X.resAnt=value;
    case 'stack'
        X.stack=value;
    case 'mini_stack'
        X.mini_stack=value;
    case 'curva_IP'
        X.curva_IP=value;
    case 'mini_stackAnt'
        X.mini_stackAnt=value;
    case 'curva_IPAnt'
        X.curva_IPAnt=value;
    case 'corte'
        X.corte=value;
    case 'senalFiltrada'
        X.senalFiltrada=value;
    case 'senalFiltradaAnt'
        X.senalFiltradaAnt=value;
    case 'senalStackeada'
        X.senalStackeada=value;
    case 'senalStackeadaAnt'
        X.senalStackeadaAnt=value;
    case 'ruidoTelurico'
        X.ruidoTelurico=value;
    case 'lstFiltros'
        X.lstFiltros=value;
%    case 'stack'
%        X.stack=value;
    case 'fileFiltrada'
        X.fileFiltrada = value;
    case 'fileStackeada'
        X.fileStackeada = value;
    case 'fileIP'
        X.fileIP = value;
    case 'fileMiniStackeada'
        X.fileMiniStackeada = value;
    case 'fileRuidoTelurico'
        X.fileRuidoTelurico = value;
    case 'SP'
        X.SP = value;
    case 'V'
        X.V = value;
    case 'QC'
        X.QC = value;
end    
