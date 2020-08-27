function X=ListShot(varargin)
%constructor del objeto de lista de estaciones.

if nargin==0 % Usado cuando los objetos provienen del disco!!??
  X = inicializar();
  X = class(X, 'ListShot');
  return;
end
firstArg = varargin{1};
if isa(firstArg, 'ListShot') %usado cuando los objetos son pasados como argumentos.
  X = firstArg;
  return;
end

X = inicializar();
X = class(X,'ListShot');

function X = inicializar()

X.Shots = {};
X.indice = 0;
X.filename = [];