function res = ubcToGeosoft()
global pathGlobal;

try
forg = UBCtoGEO;
catch
    disp('funcion');
    res = 0;
    return;
end

[file,path] = uiputfile({'*.dat','Archivo Geosoft (*.dat)'},'Seleccione el archivo destino',pathGlobal);
if isequal(file,0)
    disp('abrir archivo');
    res = 0;
    return;
else
    pathGlobal = path;
    agregarExtension(file,'dat');
    fdest = [path,file];
    try
    arreglar(forg,fdest);
    catch
        res = 0;
        disp('arreglar');
        return;
    end
end

res = 1;


function arreglar(forg,fdest)

fubc = fopen(forg{1},'rt');
fgeo = fopen(forg{2},'rt');
fdes = fopen(fdest,'wt');

header{1} = fgetl(fgeo);
header{2} = fgetl(fgeo);
header{3} = fgetl(fgeo);

fgetl(fubc);
fgetl(fubc);

i=1;
linea = fgetl(fubc);
while linea > 0
    dubc(i,:) = strread(linea,'%s');
    linea = fgetl(fubc);
    i = i + 1;
end

i=1;
linea = fgetl(fgeo);
while linea > 0
    dgeo(i,:) = strread(linea,'%s');
    linea = fgetl(fgeo);
    i = i + 1;
end


k=1;
for i=1:length(dubc(:,1))
   for j=1:length(dgeo(:,1))
       if (str2num(char(dubc(i,1))) == str2num(char(dgeo(j,1)))) & (str2num(char(dubc(i,3))) == str2num(char(dgeo(j,3)))) & (str2num(char(dubc(i,4))) == str2num(char(dgeo(j,4))))
           datos(k,:) = dgeo(j,:);
           k = k + 1;
           break;
       end
   end
end

fprintf(fdes,'%s\n%s\n%s\n',header{1},header{2},header{3});

for i=1:length(datos(:,1))
    fprintf(fdes,'%s',char(datos(i,1)));
    for j=2:length(datos(i,:))
        fprintf(fdes,'\t%s',char(datos(i,j)));
    end
    fprintf(fdes,'\n');
end

fclose(fubc);
fclose(fgeo);
fclose(fdes);