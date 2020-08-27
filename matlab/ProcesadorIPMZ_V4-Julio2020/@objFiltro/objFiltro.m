function X=objFiltro(varargin)
%constructor del objeto de lista de estaciones.

if nargin==0 % Usado cuando los objetos provienen del disco!!??
  X = inicializar();
  X = class(X, 'objFiltro');
  return;
end
firstArg = varargin{1};
if isa(firstArg, 'objFiltro') %usado cuando los objetos son pasados como argumentos.
  X = firstArg;
  return;
end

X = inicializar();
X = class(X,'objFiltro');

function X = inicializar()

X.nombre = []; %Nombre del filtro
X.params = {}; %Parametros del filtro
X.indexParams = 0; %Cantidad de parametros del filtro