function est = get_estacion(j,i)
%function X = get_estacion(j,i)
%
%Devuelve una estacion de IP.
%j = indica el indice de shot.
%i = indica el indice de estacion.

global objLstShot;

shots = objLstShot.Shots;
ests = shots{j}.objLstEst;
largo = length(ests);
est = get(ests,i);
        