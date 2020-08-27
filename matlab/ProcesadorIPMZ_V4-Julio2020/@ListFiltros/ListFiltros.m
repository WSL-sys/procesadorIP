function X=ListFiltros(varargin)
%constructor del objeto de lista de estaciones.

if nargin==0 % Usado cuando los objetos provienen del disco!!??
  X = inicializar();
  X = class(X, 'ListFiltros');
  return;
end
firstArg = varargin{1};
if isa(firstArg, 'ListFiltros') %usado cuando los objetos son pasados como argumentos.
  X = firstArg;
  return;
end

X = inicializar();
X = class(X,'ListFiltros');

function X = inicializar()

X.filtros = {}; %Arreglo de filtros
X.index = 0; % cantidad de filtros
