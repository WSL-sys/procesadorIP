function X=objStack(varargin)
%constructor del objeto de lista de estaciones.

if nargin==0 % Usado cuando los objetos provienen del disco!!??
  X = inicializar();
  X = class(X, 'objStack');
  return;
end
firstArg = varargin{1};
if isa(firstArg, 'objStack') %usado cuando los objetos son pasados como argumentos.
  X = firstArg;
  return;
end

X = inicializar();
X = class(X,'objStack');

function X = inicializar()

X.nombre = []; %Nombre del Stack
X.params = {}; %Parametros del Stack
X.indexParams = 0; %Cantidad de parametros del Stack