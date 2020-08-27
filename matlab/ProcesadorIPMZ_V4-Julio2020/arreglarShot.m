function arreglarShot(archivo,numEst)
% transforma un Shot en dos Shots 

%[file,path] = uigetfile({'*.sht','Archivo Shot'},'archivo shot',dir);
%if isequal(file,0)
%else
%    archivo = [path,file];
    data = cargarDatos(archivo);
    dataA{1} = data{1};
    dataB{1} = data{1};
    dataA{2} = data{2};
    dataB{2} = data{2};
    
    for i=3:(numEst+2)
        dataA{i} = data{i};
    end
    
    for i=3:(length(data)-numEst)
        dataB{i} = data{i+numEst};
    end
    dataAFile = [strtok(archivo,'.'),'A','.sht'];
    dataBFile = [strtok(archivo,'.'),'B','.sht'];
    
    guardarDatos(dataA,dataAFile);
    guardarDatos(dataB,dataBFile);
    
%end

function data = cargarDatos(file)
    data = {};
    fid = fopen(file,'rt');
    linea = fgetl(fid);
    k = 1;
    while linea > 0
        data{k}=linea;
        k = k + 1;
        linea = fgetl(fid);
    end
    fclose(fid);

function guardarDatos(data,filename)
    fid = fopen(filename,'wt');
    
    for i=1:length(data)
        fprintf(fid,'%s\n',data{i});
    end
    
    fclose(fid);
