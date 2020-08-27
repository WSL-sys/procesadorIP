function shots = guardarResultados(shots,currentPath)
    largo = length(shots);
    grls = waitbar(0,'Guardando Resultados...');
     for i=1:largo
        ests = shots{1}.objLstEst; %ests = shots{i}.objLstEst;
        largoEst = length(ests);% + 1;
        nameShot = shots{1}.filename;%nameShot = shots{i}.filename;
        grle = waitbar(0,['Guardando Estaciones para Shot: ',nameShot]);
        strDir = strtok(nameShot,'.');
        pathChg = mkdir(currentPath,char(strDir));
        path = [currentPath,char(strDir),'\'];
        for j=1:largoEst
%             if j < largoEst
                est = get(ests,j);
%             else
%                 est = getEstRemota(ests);
%             end
            filename = get(est,'filename');
            canal = num2str(get(est,'canal'));
            pathF = mkdir(path,'senalesFiltradas');
            fileFiltrada = [path,'senalesFiltradas\',canal,'F_',filename];
            est = set(est,'fileFiltrada',fileFiltrada);
            senal = get(est,'senalFiltrada');
            header = senal.header;
            header.canales = 1;
            senal.header = header;
            write_TSN(senal,fileFiltrada);
            pathS = mkdir(path,'senalesStackeadas');
            fileStackeada = [path,'senalesStackeadas\',canal,'S_',strcat(strtok(filename,'.'),'.dstk')];
            est = set(est,'fileStackeada',fileStackeada);
            datos = get(est,'senalStackeada')';
            save('-ascii',fileStackeada,'datos');
            pathMS = mkdir(path,'senalesMiniStackeadas');
            fileMiniStackeada = [path,'senalesMiniStackeadas\',canal,'MS_',strcat(strtok(filename,'.'),'.mstk')]; %mini_stack
            est = set(est,'fileMiniStackeada',fileMiniStackeada);
            datos = get(est,'mini_stack');
            save('-ascii',fileMiniStackeada,'datos');
            pathCI = mkdir(path,'curvasIP');
            fileIP = [path,'curvasIP\',canal,'IP_',strcat(strtok(filename,'.'),'.cip')]; %curva_IP
            est = set(est,'fileIP',fileIP);
            datos = get(est,'curva_IP');
            save('-ascii',fileIP,'datos');
            pathRT = mkdir(path,'ruidoTelurico');
            fileRT = [path,'ruidoTelurico\',canal,'RT_',strcat(strtok(filename,'.'),'.rto')]; %curva_IP
            est = set(est,'fileRuidoTelurico',fileRT);
            datos = get(est,'ruidoTelurico');
            save('-ascii',fileRT,'datos');
%             if j < largoEst
                ests = set(ests,est,j);
%             else
%                 ests = setEstRemota(ests,est);
%             end
%            waitbar(j/largoEst);
        end
        close(grle);
        filename = shots{1}.filename;%filename = shots{i}.filename;
        fileShot = [path,char(filename)];
        shots{1}.shotFile = fileShot;%shots{i}.shotFile = fileShot;
        toFile(ests,fileShot);
        shots{1}.objLstEst = ests;%shots{i}.objLstEst = ests;
        waitbar(i/largo);
    end
%    close(grls);
        
    