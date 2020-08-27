function objLstShot = procesar(objLstShot,path)
largo = objLstShot.indice;
%h = waitbar(0,'Procesando...');
shots = objLstShot.Shots;
for i=1:largo
    objLstShot.Shots{i} = procesar(objLstShot.Shots{i});
    shot{1} = objLstShot.Shots{i};
    shot = guardarResultados(shot,path);
    s = shot{1};
    ests = s.objLstEst;
    for j=1:length(ests)
        est = get(ests,j);
        X = get(est,'X');
        X.datos = [];
        est = set(est,'X',X);
        est = set(est,'senalFiltrada',TSNfiles);
        est = set(est,'senalFiltradaAnt',TSNfiles);
        ests = set(ests,est,j);
    end
    s.objLstEst = ests;
    objLstShot.Shots{i} = s;
%    waitbar(i/largo);
end
%close(h);