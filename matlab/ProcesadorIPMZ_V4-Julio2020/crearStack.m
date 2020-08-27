function X = crearStack(name,params)
X = objStack;
switch name
    case 'Normal'
        X.nombre = name;
%        tmp{1} = '0';
params
        params{1} = '0';
        X.params = params;
        X.indexParams = length(params);
    case 'Robusto'
        X.nombre = name;
        tmp = params;
%        tmp{2} = params{2};
        X.params = tmp;
        X.indexParams = length(tmp);
%     case 'Tiempos'
%         X.nombre = name;
%         tmp{1} = params;
%         fid = fopen(params,'r');
%         line = fgetl(fid);
%         str=strread(line,'%s','delimiter','\\');
%         for i=1:length(str)
%             tmp{i+1}=str(i);
%         end
%         fclose(fid);
%         X.params = tmp;
%         X.indexParams = length(tmp);
%     case 'Halvelson'
%         X.nombre = name;
%         tmp{1} = params;
%         X.params = tmp;
%         X.indexParams = length(tmp);
end