function Guardar_Resultados(X,dir_name)

largo = length(X);

objEst = get(X,1);
objTransmisor = getTransmisor(X);
stack = get(objEst,'stack');
mini_stack = get(objEst,'mini_stack');
curva_IP = get(objEst,'curva_IP');
carg = get(objEst,'carg');
res = get(objEst,'res');

l_stack = length(stack);
l_mini_stack = length(mini_stack);
l_curva_IP = length(curva_IP);

stack_(1:l_stack,1:largo)=0;
mini_stack_(1:l_mini_stack,1:largo*2)=0;
curva_IP_(1:l_curva_IP,1:largo*2)=0;
resultado(1:largo,1:6)=0;


for i = 1:largo
    i
objEst = get(X,i);
stack = get(objEst,'stack');
mini_stack = get(objEst,'mini_stack');
curva_IP = get(objEst,'curva_IP');
carg = get(objEst,'carg');
res = get(objEst,'res');
Xr1 = get(objEst,'Xr1');
Xr2 = get(objEst,'Xr2');
Xt1 = get(objTransmisor,'Xt1');
Xt2 = get(objTransmisor,'Xt2');

%crea un arreglo con todos los stack,mini_stack,cuarva_IP, cargabilidad y resistividad.
stack_(:,i)=stack(:);
%stack_(:,2*(i-1)+2)=stack(2,:);
mini_stack_(:,2*(i-1)+1)=mini_stack(:,1);
mini_stack_(:,2*(i-1)+2)=mini_stack(:,2);
curva_IP_(:,2*(i-1)+1)=curva_IP(:,1);
curva_IP_(:,2*(i-1)+2)=curva_IP(:,2);
resultado(i,6) = carg;
resultado(i,5) = res;
resultado(i,4) = Xr2;
resultado(i,3) = Xr1;
resultado(i,2) = Xt2;
resultado(i,1) = Xt1;

end

%Guardar los resultados
save('-ascii',[dir_name '.res'], 'resultado');
save('-ascii',[dir_name '.stk'], 'stack_');
save('-ascii',[dir_name '.msk'], 'mini_stack_');
save('-ascii',[dir_name '.cur'], 'curva_IP_');





