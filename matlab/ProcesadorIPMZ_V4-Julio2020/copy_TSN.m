
function [res,str_error] = copy_TSN(file,destino,inicio,final)
%X=open_TSN(file)
%Abre un archivo TSN y entrega un objeto con los seis canales, header y tiempo.
%file: string con path del archivo tss.
%
%X.datos = arreglo con seis canales.
%X.header = header con datos de medicion
%X.tiempo = tiempo de las muestras.
% file
% inicio
% final 

%contantes.
header_length = 32; %largo del header.
dato_length = 3; %numero de bits por canal.

%trata de abrir el archivo en binario
archivo = dir(file);
if length(archivo)==0 %si el archivo no existe.
    res = -1; %Si el archivo no se puede abrir.
    msgbox( ['No se encuentra el archivo TSN: ' file]);
    return;
end
File_Size=archivo.bytes;
fclose('all');
[fid,str_error] = fopen(file,'rb');
if fid <0 
    res = -1; %Si el archivo no se puede abrir.
    msgbox( ['El archivo TSN no se puede abrir: ' file]);
    return;
end

%lee el header
header = leer_header(fid); 
fclose(fid); %cierra el TSN y despues lo abre de nuevo(es mas facil definir el while asi).

%calculo de parametros para leer el archivo TSS
lengthx = header.n_muestras; %datos por pagina 
Ncanales = header.canales;
t_max = header.n_muestras / header.f_muestreo;
largo_pagina = lengthx * Ncanales * dato_length + header_length;
n_paginas = File_Size / (lengthx * Ncanales * dato_length + header_length);
largo_datos = lengthx * Ncanales * dato_length;

%abre de nuevo el TSN y lee todos sus datos.
fid = fopen(file,'rb');
fid2 = fopen(destino,'wb');
arr(1:largo_datos)=0;
datos(lengthx*n_paginas,1:Ncanales)=0;
tiempo(1:lengthx*n_paginas)=0;
header_tmp(1:32)=0;
cont = 0;
ttt=0;

%calcula el origen y fin de la serie a partir de los tiempos
%(inicio,final)
%el round es importante porque a veces existen decimales que introducen
%errores en el trucamiento...
a = (datenum(inicio));
b = (datenum(final));
c = (datenum(2000+header.ano,header.mes,header.dia,header.hor,header.min,header.seg));
d = (c + n_paginas/24/3600*header.n_muestras/header.f_muestreo); %tiempo del ultimo dato
round((a-c)*24*3600)/header.n_muestras*header.f_muestreo;
offset = ceil(round((a-c)*24*3600)/header.n_muestras*header.f_muestreo);
%largo = round(round((b-a)*24*3600)/header.n_muestras*header.f_muestreo+1); 

if (b < c) || (d < a)
    %res = -1;
    %msgbox( ['El archivo TSN no se puede abrir: ' file]);
    %str_error = 'El intervalo de tiempo seleccionado no existe en el archivo .TSN';
    %return;
end




%desplaza el stream_reader al origen
fseek(fid,0,-1); %offset en el inicio de archivo.
arr = fread(fid,largo_datos+header_length);
header = arr2header(arr(1:32));

datenum_inicio = datenum(inicio)*24*3600 - datenum(2000,1,1,0,0,0)*24*3600;

while (header.dat)<datenum_inicio
 %disp(header.dat)
 %disp(datenum_inicio)
    %arr = fread(fid,largo_pagina);
    %largo_datos+header_length
        arr = fread(fid,largo_datos+header_length);
        header = arr2header(arr(1:32));      
end
%fseek(fid,offset*(largo_datos+header_length),-1);
%header.dat

%n_pagina = min(n_paginas,fin-origen);

%lee todas las pagina con datos del archivo

%for j=1:largo %n_paginas
arr = fread(fid,largo_datos+header_length);
header = arr2header(arr(1:32));

datenum_final = datenum(final)*24*3600 - datenum(2000,1,1,0,0,0)*24*3600;

while (header.dat)<datenum_final
    %arr = fread(fid,largo_pagina);
        fwrite(fid2,arr);
        arr = fread(fid,largo_datos+header_length);
        header = arr2header(arr(1:32));
        
end
%end
fclose(fid); %cierra el archivo
fclose(fid2);

%construye el objeto de resultado..
res = 0;% no hay error
str_error = '';

function header=leer_header(fid)
%lee el encabezado de pagina de phoenix.

%contantes.
header_length = 32; %largo del header.

%lee el header
arr = fread(fid,header_length);
header = arr2header(arr);

function header = arr2header(arr)
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
