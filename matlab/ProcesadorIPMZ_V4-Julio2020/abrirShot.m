function X = abrirShot(file)
%    ahs = waitbar(0,['Shot: ',file]);
    progressbar(['Shot: ',file]);
    fd=fopen(file,'rt');
    linea = fgetl(fd); %datos
    objTransmisor = objEstaciones;
    objTransmisor = ToEstacionesTrans(objEstaciones,linea);
    
    %estacion Remota
    linea = fgetl(fd); %datos
    objEstRemota = objEstaciones;
    objEstRemota = ToEstacionesRem(objEstRemota,linea); 
    
    %Lista de Estaciones
    objLstEst_tmp = ListEstaciones();
    objLstEst_tmp = Agregar(objLstEst_tmp,objTransmisor,1);
    objLstEst_tmp = Agregar(objLstEst_tmp,objEstRemota,2);
    %cambio agregando estacion remota a la lista de estaciones ip
    %objLstEst_tmp = Agregar(objLstEst_tmp,objEstRemota,3); 
    %Lee las estaciones de IP hasta el final del archivo.
    i = 20;
    progressbar(i/100);%waitbar(i/100);
    linea=fgetl(fd); %datos
    while linea > 0 
        objEstacionIP = objEstaciones;
        objEstacionIP = ToEstaciones(objEstaciones,linea);
        objLstEst_tmp=Agregar(objLstEst_tmp,objEstacionIP,3);
        linea=fgetl(fd);
        progressbar(i/100);%%waitbar((i+5)/100);
        i=(i+5);
        if i >= 100
            i = 0;
        end
    end 
    X=objLstEst_tmp;
%    close(ahs);
    progressbar(1);
