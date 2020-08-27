function str=get(X,option)

switch option
    case 'filename'
        str = X.filename;
    case 'file'
        str=X.file;
    case 'serie'
        str=X.serie;
    case 'ganancia'
        str=X.ganancia;
    case 'azimut'
        str=X.azimut;
    case 'impedancia'
        str=X.impedancia;
    case 'canal'
        str=X.canal;
    case 'canal_remoto'
        str=X.canal_remoto;
    case 'Xr1'
        str=X.Xr1;
    case 'Xr2'
        str=X.Xr2;
    case 'Xt1'
        str=X.Xt1;
    case 'Xt2'    
        str=X.Xt2;
    case 'frecuencia'    
        str=X.frecuencia;    
    case 'calibracion'
        str=X.calibracion;
    case 'calibracionHx'
        str=X.calibracionHx;
    case 'calibracionHy'
        str=X.calibracionHy;
    case 'calibracionHz'
        str=X.calibracionHz; 
    case 'delta_e'
        str=X.delta_e;     
    case 'tipo_arreglo'
        str=X.tipo_arreglo;     
    case 'corriente'
        str=X.corriente;     
    case 'X'
        str=X.X;     
    case 'carg'
        str=X.carg;
    case 'res'
        str=X.res;
    case 'cargAnt'
        str=X.cargAnt;
    case 'resAnt'
        str=X.resAnt;
    case 'stack'
        str=X.stack;    
    case 'mini_stack'
        str=X.mini_stack;    
    case 'curva_IP'
        str=X.curva_IP;
    case 'mini_stackAnt'
        str=X.mini_stackAnt;    
    case 'curva_IPAnt'
        str=X.curva_IPAnt;
    case 'corte'
        str=X.corte;
    case 'senalFiltrada'
        str=X.senalFiltrada;
    case 'senalFiltradaAnt'
        str=X.senalFiltradaAnt;
    case 'senalStackeada'
        str=X.senalStackeada;
    case 'senalStackeadaAnt'
        str=X.senalStackeadaAnt;
    case 'ruidoTelurico'
        str=X.ruidoTelurico;
    case 'lstFiltros'
        str=X.lstFiltros;
%    case 'stack'
%        str=X.stack;
    case 'fileFiltrada'
        str=X.fileFiltrada;
    case 'fileStackeada'
        str=X.fileStackeada;
    case 'fileIP'
        str=X.fileIP;
    case 'fileMiniStackeada'
        str=X.fileMiniStackeada;
    case 'fileRuidoTelurico'
        str=X.fileRuidoTelurico;
    case 'SP'
        str=X.SP;
    case 'V'
        str=X.V;
    case 'QC'
        str=X.QC;

end    