function X=objEstaciones(varargin)
%constructor del objeto de lista de estaciones.

if nargin==0 % Usado cuando los objetos provienen del disco!!??
  X = inicializar();
  X = class(X, 'objEstaciones');
  return;
end
firstArg = varargin{1};
if isa(firstArg, 'objEstaciones') %usado cuando los objetos son pasados como argumentos.
  X = firstArg;
  return;
end


X = inicializar();
X = class(X,'objEstaciones');



function X = inicializar()
%inicializa los campos de objEstaciones.

%Datos series de tiempo.
X.filename = 'c';
X.file = 'c';
X.serie = 0;
X.canal = 0;
X.azimut = 0; %azimut de los electrodos de la estación.
X.ganancia = 0; %ganancia de los canales medidos. 

%Datos estación IP.
X.Xr1 = 0; %coordenada del electrodo receptor 1 %'';
X.Xr2 = 0; %coordenada del electrodo receptor 2 %'';

%Datos estacion Remota.
X.delta_e = 0; %distancia entre los electrodos de la estacion remota.

%Datos del Transmisor.
X.Xt1 = 0; %coordenada del electrodo del transmisor 1 %'';
X.Xt2 = 0; %coordenada del electrodo del transmisor 2 %'';
X.frecuencia = 0; %frecuencia de la señal del transmisor '';
%X.tipo_arreglo = []; %arreglo usando durante el levantamiento IP ;
X.corriente = 0; %corriente transmitida durante la medición. 

%Archivos de Calibraciones.
X.calibracion = 'c'; %calibracion del instrumento.
X.calibracionHx = 'c'; %calibracion de las bobinas.
X.calibracionHy = 'c';
%X.calibracionHz = [];

%objEstaciones
X.X = TSNfiles();   %objeto con las mediciones
%X.stack = [];       %señal stackeada.
X.mini_stack = 0;
X.mini_stackAnt = 0;
X.fileMiniStackeada = 'c';
X.curva_IP = 0;
X.curva_IPAnt = 0;
X.fileIP = 'c';

%datos de filtros y stack
X.lstFiltros = ListFiltros;
X.stack = objStack;

%Señales Resultados
X.senalStackeadaAnt = 0; % guarda la señal anteriormente stackeda
X.senalStackeada = 0; % guarda la señal stackeada
X.fileStackeada = 'c'; % guarda el nombre del archivo con la señal stackeada
X.senalFiltrada = 0; % guarda la señal filtrada
X.fileFiltrada = 'c'; % guarda el nombre del archivo con la señal filtrada.
X.senalFiltradaAnt = 0; % guarda la señal anteriormente filtrada
X.ruidoTelurico = 0; % guarda el ruido telurico
X.ruidoTeluricoAnt = 0; % guarda el ruido telurico anterior
X.fileRuidoTelurico = 'c'; % guarda el nombre del archivo con el ruido telurico;
%Resultados de Proceso.
X.carg = 0;
X.cargAnt = 0;%
X.res = 0;
X.resAnt = 0;
%tiempo de corte.
X.corte = 0;
X.SP = 0;
X.V = 0;
X.QC = 1;


%basura para eliminar.
%X.impedancia = [];
%X.canal_remoto = []; %''

%Privados....
%***************************************

X.caracter_separacion = [char(9),';',char(9)];
