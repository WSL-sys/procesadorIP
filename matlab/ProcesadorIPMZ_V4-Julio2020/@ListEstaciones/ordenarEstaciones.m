function objLstEst = ordenarEstaciones(Y)
    Xr1 = [];
    tmp_ests = Y;
    for i=2:length(Y.Estaciones)
        X=Y.Estaciones(i);
        Xr1(i-1) = get(X,'Xr1');
        
    end
    
    indices = [];
    res = [];
    k = 1;
    largo = length(Xr1);
    while k <= largo
        min = 999999999;
        i = 1;
        while i <= largo
            if Xr1(i) < min
                min = Xr1(i);
                jjj = i;
            end
            i = i + 1;
        end
        indices(k) = jjj;
        Xr1(jjj) = 999999999;
        res(k) = min;
        k = k+1;
    end
    
    
    % Ordenamos las estaciones

%     tmp_ests.EstacionRemota = Y.EstacionRemota;
%     tmp_ests.Transmisor = Y.Transmisor;
%     
    for i=2:length(Y.Estaciones)
        tmp_ests.Estaciones(i) = Y.Estaciones(indices(i-1)+1);
    end
    
    objLstEst = tmp_ests;