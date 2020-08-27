function estado = write_TSN(X,file)
%retorno = guardar_TSN(file,X)
%escribe en un archivo tipo TSN los datos del objeto TSNFile X
% parametros:
% X: objeto TSNFile
% file: ruta al nuevo archivo
% Retorno:
% estado: entero positivo indicando si el procedimiento fue realizado
% correctamente. 1 si es correcto, 0 si es incorrecto.

%constantes
header_length = 32; %largo del header
dato_length = 3; % numero de bits por canal

%Si file existe se borra.
if isempty(dir(file)) > 0
    delete(file);
end

fclose('all');
fid = fopen(file,'wb');

header = X.header;

%calculo de parametros para leer el archivo TSS
length = header.n_muestras; %datos por pagina 
Ncanales = header.canales;
t_max = header.n_muestras / header.f_muestreo;
largo_pagina = length * Ncanales * dato_length + header_length;
n_paginas = X.n_paginas;%File_Size / (length * Ncanales * dato_length + header_length);
largo_datos = length * Ncanales * dato_length;

arr(1:largo_datos)=0;
datos(length*n_paginas,1:Ncanales)=0;
tiempo(1:length*n_paginas)=0;
header_tmp(1:32)=0;
cont = 0;
ttt=0;

%hwt = waitbar(0,['Creando archivo TSn para la estacion: ',file]);
%escribe todas las pagina con datos de X
for j=1:n_paginas
        off = (j-1)*(length); %ultima posicion en el arreglo.
        %calcula la fecha..
        fecha=datevec(datestr(X.tiempo(off+1)/3600/24 + datenum(2000,1,1,0,0,0),0)); %calcula la fecha
        header.ano = fecha(1)-2000; %asigna la fecha
        header.mes = fecha(2); %asigna la fecha
        header.dia = fecha(3); %asigna la fecha
        header.hor = fecha(4); %asigna la fecha
        header.min = fecha(5); %asigna la fecha
        header.seg = fecha(6); %asigna la fecha
        %header.dat = X.tiempo(off+1);
        
        escribir_header(fid,header);
        %fwrite(fid,header,'interger*1')
      %  fwrite(fid,X.datos(off+1:+offn_muestras,:),'integer*3')
        
        
        offset = 1;
        for i=1:length
            %tiempo_tmp = tiempo_tmp + dt;
            for k = 1:Ncanales
                A = X.datos(i+off,k);
                 datos(offset:offset+dato_length-1) = dec2bin(A);
                 offset = offset + 3;
               % dato = dec2bin(A);
                %tiempo(i+off) = tiempo_tmp;
                %fwrite(fid,dato,'int');
            end
        end
         fwrite(fid,datos(1:length*Ncanales*3),'char');
    %indica el avance...
    %if cont > 10
     %   cont = 0;
        %waitbar(j/n_paginas);
       % disp(strcat('cargando archivo:          ', file,sprintf( '       %d%%',porcentaje)));
    %else 
     %   cont = cont + 1;
    %end
end
fclose(fid); %cierra el archivo
%close(hwt);

%construye el objeto de resultado..
X.datos = datos;
X.header = header;
X.tiempo = tiempo;


function arr=escribir_header(fid,header)
%lee el encabezado de pagina de phoenix.

%contantes.
header_length = 32; %largo del header.
arr(1:32) = 0;
%lee el header
%arr = fread(fid,header_length);
arr(1) = header.seg;
arr(2) = header.min;
arr(3) = header.hor;
arr(4) = header.dia;
arr(5) = header.mes;
arr(6) = header.ano;
arr(9) = mod(header.serie,256); %numero de serie de instrumento medidor
arr(10) = (header.serie-arr(9))/256;
arr(11) = mod(header.n_muestras,256); %numero de muestras
arr(12) = (header.n_muestras-arr(11))/256;
arr(13) = header.canales;
arr(14) = header.TG;
arr(15) = header.ST;
arr(16) = header.SA;
arr(17) = header.Flag;
arr(18) = header.BY;
arr(19) = mod(header.f_muestreo,256);
arr(20) = (header.f_muestreo-arr(19))/256; %frecuencia de muestreo
arr(22) = header.CK;
arr(23) = mod(header.TE,256); %error de tiempo
arr(24) = mod((header.TE - arr(23))/256,256); %error de tiempo
arr(25) = ( ( header.TE - arr(23) ) / 256 - arr(24) ) / 256; %error de tiempo

fwrite(fid,arr(1:32),'char');

% funcion que convierte de numero decimal a su representacion binaria
function x = dec2bin(num)
    if num < 0
        num = num + 2^24;
        x(1) = mod(num,256);
        x(2) = floor(mod(num/256,256));
        x(3) = floor(mod((num/256)/256,256));
    else
        x(1) = mod(num,256);
        x(2) = floor(mod(num/256,256));
        x(3) = floor(mod((num/256)/256,256));
    end
        