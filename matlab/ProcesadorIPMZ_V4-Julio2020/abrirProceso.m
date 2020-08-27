function objLstShot = abrirProceso(file)
% Abre un archivo de proceso 
objLstShot = ListShot;
fd = fopen(file);
linea=fgetl(fd);
str = strread(linea,'%s','delimiter',';');
objLstShot.filename = char(str(1));
cantShots = str2num(char(str(2)));
%hls = waitbar(0,'Abriendo archivo de proceso...');
progressbar('Opening process...');
for i=1:cantShots
    linea=fgetl(fd);
    str = strread(linea,'%s','delimiter',';');
    shotFile = char(str(1));
    cantEst = str2num(char(str(2)));
    shot = crearObjShot(shotFile);
    ests = shot.objLstEst;
    for j=1:cantEst
        %if j < cantEst
            est = get(ests,j);
        %else
         %   est = getEstRemota(ests);
        %end
        linea=fgetl(fd);
        str = strread(linea,'%s','delimiter',';');
        cantFiltros = str2num(char(str(1)));
        for k=1:cantFiltros
            linea=fgetl(fd);
            str = strread(linea,'%s','delimiter',';');
            
            filtName = char(str(1));
            if length(str) <= 2
                params = char(str(2));
            else
                for w=2:length(str)
                    params{w-1} = char(str(w));
                end
            end
            objF = crearFiltro(filtName,params);
            clear('params');
            filtros{k}=objF;
        end
        lstFiltros = ListFiltros;
        lstFiltros.filtros = filtros;
        lstFiltros.largo = length(filtros);
        clear('filtros');
        linea=fgetl(fd);
        str = strread(linea,'%s','delimiter',';');
        stackName = char(str(1));
        if length(str) <= 2
            params = char(str(2));
        else
            for w=2:length(str)
                params{w-1} = char(str(w));
            end
        end
        objS = crearStack(stackName,params);
        clear('params');
        est = set(est,'lstFiltros',lstFiltros);
        est = set(est,'stack',objS);
        %if j < cantEst
            ests = set(ests,est,j);
        %else
         %   ests = setEstRemota(ests,est);
        %end
    end
    shot.objLstEst = ests;
    objLstShot.agregar = shot;
    progressbar(i/cantShots);
    %waitbar(i/cantShots);
end
progressbar(1);%close(hls);
objLstShot.largo=cantShots;
