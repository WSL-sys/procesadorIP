global objLstShot;
shots = objLstShot.Shots;
for i=1:length(shots)
    shot = shots{i};
    ests = shot.objLstEst;
    for j=1:length(ests)
        est = get(ests,j);
        X = get(est,'X');
        X.datos = [];
        est = set(est,'X',X);
%         est = set(est,'senalFiltrada',TSNfiles);
%         est = set(est,'senalFiltradaAnt',TSNfiles);
        ests = set(ests,est,j);
    end
    shot.objLstEst = ests;
    shots{i} = shot;
end
objLstShot.Shots = shots;