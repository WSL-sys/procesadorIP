function X=TSSfiles(varargin)
%constructor del objeto de lista de estaciones.

if nargin==0 % Usado cuando los objetos provienen del disco!!??
  X = inicializar();
  X = class(X, 'TSSfiles');
  return;
end
firstArg = varargin{1};
if isa(firstArg, 'TSSfiles') %usado cuando los objetos son pasados como argumentos.
  X = firstArg;
  return;
end


X = inicializar();
X = class(X,'TSSfiles');



function X = inicializar()
%inicializa los campos de objEstaciones.

X.datos = []; %datos con mediciones
X.tiempo = []; %arreglo con los tiempos.
X.n_paginas = []; %cantidad de paginas.

X.header.seg = [];
X.header.min = [];
X.header.hor = [];
X.header.dia = [];
X.header.mes = [];
X.header.ano = [];
X.header.dat = [];
X.header.serie = [];
X.header.n_muestras = [];
X.header.canales = [];
X.header.TG = [];
X.header.ST = [];
X.header.SA = [];
X.header.Flag = [];
X.header.BY = [];
X.header.f_muestreo = [];
X.header.CK = [];
X.header.TE = [];



