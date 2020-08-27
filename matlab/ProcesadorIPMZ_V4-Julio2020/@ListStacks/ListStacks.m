function X=ListStacks(varargin)
%constructor del objeto de lista de estaciones.

if nargin==0 % Usado cuando los objetos provienen del disco!!??
  X = inicializar();
  X = class(X, 'ListStacks');
  return;
end
firstArg = varargin{1};
if isa(firstArg, 'ListStacks') %usado cuando los objetos son pasados como argumentos.
  X = firstArg;
  return;
end

X = inicializar();
X = class(X,'ListStacks');

function X = inicializar()

X.stacks = {}; %Arreglo de stacks
X.index = 0; % cantidad de stacks
