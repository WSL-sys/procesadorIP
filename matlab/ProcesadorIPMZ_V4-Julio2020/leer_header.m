function [header,inicio,final]=leer_header(file)


header_length = 32; %largo del header.
dato_length = 3; %numero de bits por canal.

%trata de abrir el archivo en binario
disp(file)
archivo = dir(file);
File_Size=archivo.bytes;
fclose('all');
fid = fopen(file,'rb');

%lee el header
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

fclose(fid); %cierra el TSN y despues lo abre de nuevo(es mas facil definir el while asi).

%calculo de parametros para leer el archivo TSS
length = header.n_muestras; %datos por pagina 
Ncanales = header.canales;
t_max = header.n_muestras / header.f_muestreo;
largo_pagina = length * Ncanales * dato_length + header_length;
n_paginas = File_Size / (length * Ncanales * dato_length + header_length);
largo_datos = length * Ncanales * dato_length;

%arma los string de las fechas de inicio y final.
inicio = datestr(datenum(2000+header.ano,header.mes,header.dia,header.hor,header.min,header.seg));

final = datestr(datenum(2000+header.ano,header.mes,header.dia,header.hor,header.min,header.seg+(length)*(n_paginas-1)/header.f_muestreo));
