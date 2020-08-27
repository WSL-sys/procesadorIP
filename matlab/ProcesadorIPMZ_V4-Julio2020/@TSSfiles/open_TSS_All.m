
function X = open_TSN(X,file)
%X=open_TSN(file)
%Abre un archivo TSN y entrega un objeto con los seis canales, header y tiempo.
%file: string con path del archivo tss.
%
%X.datos = arreglo con seis canales.
%X.header = header con datos de medicion
%X.tiempo = tiempo de las muestras.

%contantes.
header_length = 32; %largo del header.
dato_length = 3; %numero de bits por canal.

%trata de abrir el archivo en binario
archivo = dir(file);
File_Size=archivo.bytes;
%fclose('all');
fid = fopen(file,'rb');

%lee el header
header = leer_header(fid); 
fclose(fid); %cierra el TSN y despues lo abre de nuevo(es mas facil definir el while asi).

%calculo de parametros para leer el archivo TSS
length = header.n_muestras %datos por pagina 
Ncanales = header.canales
t_max = header.n_muestras / header.f_muestreo;
largo_pagina = (length * Ncanales * dato_length + header_length);
n_paginas = floor(File_Size / (length * Ncanales * dato_length + header_length))
largo_datos = length * Ncanales * dato_length;

%abre de nuevo el TSN y lee todos sus datos.
fid = fopen(file,'rb');
arr(1:largo_datos)=0;
datos(length*n_paginas,1:Ncanales)=0;
tiempo(1:length*n_paginas)=0;
header_tmp(1:32)=0;
cont = 0;
ttt=0;
%lee todas las pagina con datos del archivo
%    disp(strcat('cargando archivo:          ', file));
hot = waitbar(0,['Abriendo archivo TSn: ',file]);
for j=1:n_paginas
        %arr = fread(fid,largo_pagina);
        off = (j-1)*length; %ultima posicion en el arreglo.
        header_tmp = leer_header(fid); 
        tiempo_tmp = header_tmp.dat;
        dt = 1/header.f_muestreo;
        arr = fread(fid,largo_datos);
        offset = 1;
        for i=1:length
            tiempo_tmp = tiempo_tmp + dt;
            for k = 1:Ncanales
                A = arr(offset:offset+dato_length-1);
                offset = offset + 3;
                datos(i+off,k) = bin2dec(dato_length,A);
                tiempo(i+off) = tiempo_tmp;
            end
        end
    %indica el avance...
    %if cont > 10
    %    cont = 0;
        waitbar(j/n_paginas);
    %else 
    %    cont = cont + 1;
    %end
end
fclose(fid); %cierra el archivo
close(hot);
%construye el objeto de resultado..
X.datos = datos;
X.header = header;
X.tiempo = tiempo;
X.n_paginas = n_paginas;

function header=leer_header(fid)
%lee el encabezado de pagina de phoenix.

%contantes.
header_length = 32; %largo del header.

%lee el header
arr = fread(fid,header_length);
header.seg = arr(1);
header.min = arr(2);
header.hor = arr(3);
header.dia = arr(4);
header.mes = arr(5);
header.ano = arr(6);
header.dat = datenum(2000+header.ano,header.mes,header.dia,header.hor,header.min,header.seg)*24*3600 - datenum(2000,1,1,0,0,0)*24*3600; %hora serializada
header.serie = arr(9) + arr(10) * 256; %numero de serie de instrumento medidor
header.n_muestras = arr(11) + arr(12) * 256; %numero de muestras
header.canales = arr(13);
header.TG = arr(14);
header.ST = arr(15);
header.SA = arr(16);
header.Flag = arr(17);
header.BY = arr(18);
header.f_muestreo = (arr(19) + arr(20) * 256); %frecuencia de muestreo
header.CK = arr(22);
header.TE = arr(23) + arr(24) * 256 + arr(25) * 65536; %error de tiempo




function x = bin2dec(largo,A)
%convierte un arreglo con 3 binario a decimal
    if A(3) < 128
        x= A(3)*2^16 + A(2)*2^8 + A(1);  
    else
        x= A(3)*2^16 + A(2)*2^8 + A(1) - 2^24;
    end
