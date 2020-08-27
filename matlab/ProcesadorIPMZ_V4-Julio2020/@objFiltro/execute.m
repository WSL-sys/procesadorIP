function estFiltrada = execute(X,objEst)
% Aplica el filtro a la medicion correspondiente segun el filtro asignado

switch X.nombre
    case 'Telurico'
%        X
        % funcion para el ruido telurico
%        algo = X.params{1}; %archivo de archivos de impedancia
%        params(2) = str2num(X.params{2}); %canal remoto
%        params(3) = str2num(X.params{3}); %ganancia
%        params(4) = str2num(X.params{4}); %frecuencia maxima
%        params(5) = str2num(X.params{5}); %frecuencia minima
%        X.params{6}
%        impedancia = char(X.params{6}); %archivo de impedancia
%        impedancia = char(X.params{1}); %archivo de impedancia

%        restar = X.params{7};
%        if ~isnumeric(restar)
%            restar = str2num(restar);
%        end
        global estRemota;
        params=X.params;
        estFiltrada = filtro_telurico(objEst,estRemota,params);
    case 'weiner'
        % funcion para Weiner
    case '50 hz'
        func = X.params{1};
        switch func
            case '1'
                estFiltrada = filtroPromedio50hz(objEst);
            case '2'
                estFiltrada = filtroRudo50hz(objEst);
            case '3'
                estFiltrada = filtroSuave50hz(objEst);
            case '4'
                estFiltrada = filtroPromedio60hz(objEst);
            case '5'
                estFiltrada = filtroRudo60hz(objEst);
            case '6'
                estFiltrada = filtroSuave60hz(objEst);
        end
    case 'AR'
        % funcion para A.R.
    case 'Banda'
        params(1) = str2num(X.params{1});
        params(2) = str2num(X.params{2});
        params(3) = str2num(X.params{3});
        params(4) = str2num(X.params{4});
        params(5) = str2num(X.params{5});
        params(6) = str2num(X.params{6});
        params(7) = str2num(X.params{7});
        params(8) = str2num(X.params{8});
        restar = X.params{9};
        if ~isnumeric(restar)
            restar = str2num(restar);
        end
        estFiltrada = pasa_banda(objEst,params(1),params(2),params(3),params(4),params(5),params(6),params(7),params(8),restar);
    case 'Nivel'
        params(1) = str2num(X.params{1});
        params(2) = str2num(X.params{2});
        tipo = X.params{3}; % tipo 1 horizontal tipo 2 vertical
        if ~isnumeric(tipo)
            tipo = str2num(tipo);
        end
        tipoCorte = X.params{4}; % tipo 1 rellena de ceros tipo 2 corta la señal;
        if ~isnumeric(tipoCorte)
            tipoCorte = str2num(tipoCorte);
        end
        estFiltrada = filtro_nivel(objEst,params(1),params(2),tipo,tipoCorte);
        % puede ser para el caso opcional
end
