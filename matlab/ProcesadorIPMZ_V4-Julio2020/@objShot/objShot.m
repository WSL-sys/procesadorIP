function X=objShot(varargin)
%constructor del objeto de lista de estaciones.

if nargin==0 % Usado cuando los objetos provienen del disco!!??
  X = inicializar();
  X = class(X, 'objShot');
  return;
end
firstArg = varargin{1};
if isa(firstArg, 'objShot') %usado cuando los objetos son pasados como argumentos.
  X = firstArg;
  return;
end

X = inicializar();
X = class(X,'objShot');

function X = inicializar()

X.filename = [];
X.shotFile = []; %Contiene el nombre del archivo Shot
X.objLstEst = ListEstaciones; %Objeto con la lista de estaciones que contiene el Shot
X.filterFile = []; %Contiene el nombre del archivo con parametros de filtros
X.stackFile = []; %Contiene el nombre del archivo con parametros de stack
%X.lstFiltros = {}; %Contiene la lista de filtros
%X.lstStacks = {}; %Contiene la lista de stacks
%X.resFiltros = {}; %Contiene la lista de mediciones filtradas
%X.resStacks = {}; %Contiene la lista de mediciones stackeadas
%X.indexFiltros = 0; 
%X.indexStacks = 0;
%X.filtroGlobal = [];
%X.stackGlobal = [];
%X.nmediciones = 0; %numero de mediciones que contiene el shot
%X.indiceEstFiltro = []; % indice correspondiente a la corespondencia de estacion con el filtro
%X.indiceEstStack = []; % indice correspondiente a la corespondencia de estacion con el stack
