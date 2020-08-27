function X = crearFiltro(name,params)
X = objFiltro;
switch name
    case 'Telurico'
        X.nombre = name;
%        for i = 1:length(params)
%           tmp{i}=params{i};
%        end
%            tmp{1} = params{1}; % Archivo de archivos de impedancias
%        tmp{2} = params{2}; % Canal Remoto
%        tmp{3} = params{3}; % Ganancia
%       tmp{4} = params{4}; % Frecuancia Max.
%        tmp{5} = params{5}; % Frecuencia Min.
%        tmp{6} = params{6}; % Archivo de Impedancias
%        tmp{7} = params{7}; % 0 sin restar ruido 1 si restar ruido
%        tmp{7} = params{7}; % 0 sin restar ruido 1 si restar ruido
%        tmp{7} = params{7}; % 0 sin restar ruido 1 si restar ruido
%        tmp{7} = params{7}; % 0 sin restar ruido 1 si restar ruido%

        X.params = params;
        X.indexParams = length(params);
    case 'Weiner'
        X.nombre = name;
        tmp{1} = params;
        X.params = tmp;
        X.indexParams = length(tmp);
    case '50 hz'
        X.nombre = name;
        tmp{1} = params;
        X.params = tmp;
        % Convertir la funcion en parametros o un puntero a funcion en 
        % el parametro
        X.indexParams = length(tmp);
    case 'AR'
        X.nombre = name;
        tmp{1} = params{1};
        tmp{2} = params{2};
        X.params = tmp;
        X.indexParams = length(tmp);
    case 'Banda'
        X.nombre = name;
        tmp{1} = params{1}; % F0
        tmp{2} = params{2}; % F1
        tmp{3} = params{3}; % F2
        tmp{4} = params{4}; % F3
        tmp{5} = params{5}; % G0
        tmp{6} = params{6}; % G1
        tmp{7} = params{7}; % G2
        tmp{8} = params{8}; % G3
        tmp{9} = params{9}; % Restar Ruido
        X.params = tmp;
        X.indexParams = length(tmp);
    case 'Nivel'
        X.nombre = name;
        tmp{1} = params{1};
        tmp{2} = params{2};
        tmp{3} = params{3};
        tmp{4} = params{4};
        X.params = tmp;
        X.indexParams = length(tmp);
end