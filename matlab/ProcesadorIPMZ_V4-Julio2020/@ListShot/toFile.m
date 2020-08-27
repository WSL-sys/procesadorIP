function toFile(X,file)
% guarda el contenido de la lista de shot en el archivo de proceso
fd=fopen(file,'wt');
fprintf(fd,'%s;%d\n',X.filename,length(X.Shots)); % cantidad de shots en el archivo
for i=1:X.indice
    shot = X.Shots{i};
    largoEsts = length(shot.objLstEst);% + 1;
    fprintf(fd,'%s;%d\n',shot.shotFile,largoEsts); %Nombre del archivo shot y la cantidad de estaciones
    objLstEst = shot.objLstEst;
    for j=1:largoEsts
        %if j < largoEsts
            est = get(objLstEst,j);
        %else
         %   est = getEstRemota(objLstEst);
        %end
        filt = get(est,'lstFiltros');
        flt = filt.filtros;
        largoFlt = length(flt);
        fprintf(fd,'%d\n',largoFlt);
        for k=1:largoFlt
            fprintf(fd,'%s\n',toString(flt{k}));
        end
        fprintf(fd,'%s\n',toString(get(est,'stack')));
    end
end
fclose(fd);
