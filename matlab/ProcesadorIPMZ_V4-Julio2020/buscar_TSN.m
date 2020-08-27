function file=buscar_TSN(path,dir_,iniciox,finalx)

%tiempos inicial y y final buscado en las series de tiempo
ini=datenum(iniciox);
fin=datenum(finalx);

%busca todas las series de tiempo en el directorio.
s=strcat(path,dir_);
files=dir(s);
if length(files) == 0
    msgbox(concat('no hay archivos en TSN en ', path)); 
else
    for i=1:length(files)
        file=strcat(path,files(i).name);    %arma el path + nombre del archivo tsn
        [x,txt_inicio,txt_final]=leer_header(file);     %obtiene el tiempo inicio y final del archivo.        
        inicio = datenum(txt_inicio);
        final = datenum(txt_final);
        if (inicio <= fin) && (ini <= inicio) || (final <= fin) && (ini <= final) || (inicio<=ini) && (fin<=final)
            break;
        end
        file ='';
    end
end
