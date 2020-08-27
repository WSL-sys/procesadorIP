function objLstEst_tmp=leer_configuracion(X,file)
%X=leer_configuracion(file)
%
%Lee el archivo de configuracion y crea con el contenido un objeto
%Listestaciones.
%
%
    
    %Lee el archivo de configuracion
    fid=fopen(file,'rt');
    
    %parametros de configuracion.
    %Transmisor.
    linea = fgetl(fid); %titulos
    linea = fgetl(fid); %datos
    objTransmisor = objEstaciones;
    objTransmisor = ToEstacionesTrans(objEstaciones,linea);
    
    %estacion Remota
    linea = fgetl(fid); %titulos
    linea = fgetl(fid); %datos
    objEstRemota = objEstaciones;
    objEstRemota = ToEstacionesRem(objEstRemota,linea); 
    
    %Lista de Estaciones
    objLstEst_tmp = ListEstaciones();
    objLstEst_tmp.Transmisor = objTransmisor;
    objLstEst_tmp.EstacionRemota = objEstRemota;
    
    %Lee las estaciones de IP hasta el finaldel archivo.
    linea = fgetl(fid); %titulos
    linea=fgetl(fid); %datos
    i=1;
    while(ischar(linea)) 
        objEstacionIP = objEstaciones;
        objEstacionIP = ToEstaciones(objEstaciones,linea);
        objLstEst_tmp=Agregar(objLstEst_tmp,objEstacionIP,1);
        linea=fgetl(fid);
        i=i+1;
    end 
   
    
  