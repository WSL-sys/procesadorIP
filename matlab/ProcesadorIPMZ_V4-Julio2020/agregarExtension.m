function str = agregarExtension(str,tipo)
% Asegura que la extension sea la correcta para el tipo de archivo que se
% está guardando
str_tmp = strtok(str,'.');
str = [str_tmp,'.',tipo];

% switch tipo
%     case 'sht'
%         str = [str_tmp,'.sht'];
%     case 'pro'
%         str = [str_tmp,'.pro'];
%     case 'txt'
%         str = [str_tmp,'.txt'];
%     case 'dstk'
%         str = [str_tmp,'.dstk'];
%     case 'cip'
%         str = [str_tmp,'.cip'];
%     case 'rto'
%         str = [str_tmp,'.rto'];
%     case 'mstk'
%         str = [str_tmp,'.mstk'];
%     case 'TS4'
%         str = [str_tmp,'.TS4'];
%     case 'dat'
%         str = [str_tmp,'.dat'];
%     otherwise
%         str = str;
% end