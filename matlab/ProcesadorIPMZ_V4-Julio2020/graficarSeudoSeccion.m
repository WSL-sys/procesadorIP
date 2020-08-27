function graficarSeudoSeccion(objLstEst,handles)

%global objLstEst; %objeto con estacion IP
largo = length(objLstEst);

%grafica cada una de las estaciones IP

hold(handles.seudoseccion,'off');
plot(handles.seudoseccion,[0,0]);
hold(handles.seudoseccion,'on');

maximo_x = 0;
minimo_x = 0;
maximo_y = 0;
for i=1:largo
    objEst=get(objLstEst,i);
    objTrans=getTransmisor(objLstEst);
   
    Xt1=(get(objTrans,'Xt1'));
    Xt2=(get(objTrans,'Xt2'));
    Xr1=(get(objEst,'Xr1'));
    Xr2=(get(objEst,'Xr2'));

    %Xt2
    % si Xt1,Xt2,Xr1,Xr2 estan vacios 
    if length(Xt1)== 0 || length(Xt2)== 0 || length(Xr1) ==0 || length(Xr2) ==0
    
    else
    x = (Xt2 + (Xr1+Xr2)/2)/2;
    y = -abs((Xt2-x)*0.2);
    maximo_x = max([Xt1 Xt2 Xr1 Xr2 maximo_x]);
    minimo_x = min([Xt1 Xt2 Xr1 Xr2 minimo_x]);
    maximo_y = max([-y maximo_y]);
    plot(handles.seudoseccion,Xt2,0,'*');
%     text(Xt2,abs(Xr2-Xr1)*0.2*0.25,'T3', 'HorizontalAlignment','center');
    plot(handles.seudoseccion,Xr1,0,'v');
    plot(handles.seudoseccion,Xr2,0,'v');
    plot(handles.seudoseccion,x,y,'o');
    plot(handles.seudoseccion,[Xt2,x],[0,y]);
    plot(handles.seudoseccion,[x,(Xr1+Xr2)/2],[y,0]);
    %muestra
    str = strcat(num2str(get(objEst,'serie')),'(',num2str(get(objEst,'canal')),')');
%     text((Xr1+Xr2)/2,abs(Xr2-Xr1)*0.2*0.25,str, 'HorizontalAlignment','center');
    end 
end

ancho = maximo_x  - minimo_x;
xmin=(minimo_x - ancho*0.25 );
xmax= ( maximo_x +ancho*0.25);
xlim([xmin;xmax]);
ylim([ -maximo_y*1.25 ; maximo_y*0.25]);
