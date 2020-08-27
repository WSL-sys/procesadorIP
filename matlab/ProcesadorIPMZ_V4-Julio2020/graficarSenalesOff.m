function opcion = graficarSenales(handles,est)

    global est1
     global estRemota;
    est1=est;

    senal = get(handles.rbActual,'Value')*1 + get(handles.rbAnterior,'Value')*2 + get(handles.rbAmbas,'Value')*3;
    tipoSenal(1) = get(handles.chSCruda,'Value');
    tipoSenal(2) = get(handles.chSProcesada,'Value');
    tipoSenal(3) = get(handles.chSRuido,'Value');
    tipoSenal(4) = get(handles.chSStack,'Value');
    tipoSenal(5) = get(handles.chSMiniStack,'Value');
    tipoSenal(6) = get(handles.chSDecaimiento,'Value');
    
   % try
        
        switch senal
            case 1
                if tipoSenal(6) == 1
                    s=(get(est,'curva_IP'));
%                    s(:,2)
                    plot(handles.grSenales,s(:,1),s(:,2));
                    hold(handles.grSenales,'on');
                    plot(handles.grSenales,s(:,1),s(:,2),'x');
                    hold(handles.grSenales,'off');
                    
                   % Xr1_=get(est,'Xr1');
                   %     Xr2_=get(est,'Xr2');
                   %     Xt1_=get(est,'Xt1');
                   %     Xt2_=get(est,'Xt2');
                   %     title(handles.grSenales,[' Xt1= ',num2str(Xt1_),' Xt2= ',num2str(Xt2_),' Xr1= ',num2str(Xr1_),' Xr2= ',num2str(Xr2_)]);
 
                else
                    if tipoSenal(5) == 1
                        %global senalS
                        %    global Xr1_
                        %    global Xr2_
                        %    global Xt1_
                        %    global Xt2_
                        %    global I_
                        %    global res_
                 
                            I_=get(est,'corriente');
%                            res_=str2num(get(est,'res'));
                        s=(get(est,'mini_stack'));
                        senalS=s;
                        plot(handles.grSenales,s(:,1),s(:,2));
                        %Xr1_=get(est,'Xr1');
                        %Xr2_=get(est,'Xr2');
                        %Xt1_=get(est,'Xt1');
                        %Xt2_=get(est,'Xt2');
                        %title(['Xt1= ',str2num(Xt1),'Xt2= ',str2num(Xt2),'Xr1= ',str2num(Xr1),'Xr2= ',str2num(Xr2)]);
                    else
                        if tipoSenal(4) == 1
                          %  global est0
                            frecuencia=get(est,'frecuencia');
%                            X=get(est,'X')
                          %est0 = est;
%                            h = X.header;
%                            f_muestreo = h.f_muestreo;
                            senalS = get(est,'senalStackeada');
                            size(senalS)
%                            f_muestreo=150;
                            tiempo = (1:length(senalS))/length(senalS)*1/frecuencia;
                            plot(handles.grSenales,tiempo,senalS);
                        else
                            if tipoSenal(1) == 1
                                X=get(est,'X');
                                t = X.tiempo;
                                length(X.datos)
                                t = t-t(1);
                                fv = 2.45/2^23;
                                plot(handles.grSenales,t,X.datos*fv);
                                hold(handles.grSenales,'on');
                                global datos 
                                datos = X.datos;
                            end
                            if tipoSenal(2) == 1
                               
                                senalF = get(est,'senalFiltrada');
                                t = senalF.tiempo;
                                fv = 2.45/2^23;
                                t = t-t(1);
                                %t = (1:length(datos))/150;
                               % xlim= get(handles.grSenales,'Xlim')
                               % ylim= get(handles.grSenales,'Ylim')
                                
                                datos=senalF.datos;
                                L=min(length(senalF.datos),length(t))
                                plot(handles.grSenales,t(1:L),datos(1:L)*fv,'black');
                               
                               % set(handles.grSenales,'Xlim',xlim);
                               % set(handles.grSenales,'Ylim',ylim);
                               
                                hold(handles.grSenales,'on');
                                %global datosF;
                                %datosF = senalF.datos;
                            
                            end
                            if tipoSenal(3) == 1
                                XREM=get(estRemota,'X');
                                X=get(est,'X');
                                tr=X.tiempo;
                                rt = get(est,'ruidoTelurico');
                                SenalFiltrada=get(est,'senalFiltrada');
                                t = SenalFiltrada.tiempo;
                                length(SenalFiltrada.datos)
                                %t = t(1);
                                %cOMO PASO ESO??
                                nini=round(length(rt)*0.2);
                                nfin=round(length(rt)*0.8);
%                                SP=median(rt(nini:nfin)/2^23*2.45)
%                                set(handles.txStackEst,'string',num2str(SP))
                                %SenalFiltrada.tiempo-t,
                                xlim= get(handles.grSenales,'Xlim');
                                L=min(length(rt),length(SenalFiltrada.datos));
                                ylim= get(handles.grSenales,'Ylim');
                                plot(handles.grSenales,tr-t(1),rt/2^23*2.45,'red');
%                                figure
%                                plot(rt(1:L),'red');

                                set(handles.grSenales,'Xlim',xlim);
                                set(handles.grSenales,'Ylim',ylim);
                                
                            end
                        end
                    end
                end
                hold(handles.grSenales,'off');
            case 2
                if tipoSenal(6) == 1
                    s=(get(est,'curva_IPAnt'));
                    plot(handles.grSenales,s(:,1),s(:,2));
                    hold(handles.grSenales,'on');
                    plot(handles.grSenales,s(:,1),s(:,2),'x');

                else
                    if tipoSenal(5) == 1
                        s=(get(est,'mini_stackAnt'));
                        plot(handles.grSenales,s(:,1),s(:,2));
                    else
                        if tipoSenal(4) == 1
                            X=get(est,'X');
                            h = X.header;
                            f_muestreo = h.f_muestreo;
                            senalS = get(est,'senalStackeadaAnt');
                            tiempo = (1:length(senalS))/f_muestreo;
                            plot(handles.grSenales,tiempo,senalS);
                        else
                            if tipoSenal(1) == 1
                                X=get(est,'X');
                                t = X.tiempo;
                                length(X.datos)
                                t = t(1);
                                plot(handles.grSenales,X.tiempo-t,X.datos);
                                hold(handles.grSenales,'on');
                            end
                            if tipoSenal(2) == 1
                                senalF = get(est,'senalFiltradaAnt');
                                t = senalF.tiempo;
                                t = t(1);
                                plot(handles.grSenales,senalF.tiempo-t,senalF.datos,'black');
                                hold(handles.grSenales,'on');
                            end
                            if tipoSenal(3) == 1
                                rt = get(est,'ruidoTeluricoAnt');
                                X=get(est,'X');
                                t = X.tiempo;
                                length(X.datos)
                                t = t(1);
                                %xlim= get(handles.grSenales,'Xlim');
                                %ylim= get(handles.grSenales,'Ylim');
                                plot(handles.grSenales,X.tiempo-t,rt(1:length(X.datos)),'red');
                                %set(handles.grSenales,'Xlim',xlim);
                                %set(handles.grSenales,'Ylim',ylim);
                                
                            end
                        end
                    end
                    hold(handles.grSenales,'off');
                end
            case 3
                if tipoSenal(6) == 1
                    sa=(get(est,'curva_IPAnt'));
                    s=(get(est,'curva_IP'));
                    plot(handles.grSenales,sa(:,1),sa(:,2));
                    hold(handles.grSenales,'on');
                    plot(handles.grSenales,sa(:,1),sa(:,2),'x');
                    hold(handles.grSenales,'on');
                    plot(handles.grSenales,s(:,1),s(:,2),'red');
                    hold(handles.grSenales,'on');
                    plot(handles.grSenales,s(:,1),s(:,2),'x');

                else
                    if tipoSenal(5) == 1
                        sa=(get(est,'mini_stackAnt'));
                        plot(handles.grSenales,sa(:,1),sa(:,2));
                        hold(handles.grSenales,'on');
                        s=(get(est,'mini_stack'));
                        plot(handles.grSenales,s(:,1),s(:,2),'red');
                    else
                        if tipoSenal(4) == 1
                            X=get(est,'X');
                            h = X.header;
                            f_muestreo = h.f_muestreo;
                            senalS = get(est,'senalStackeada');
                            senalSAnt = get(est,'senalStackeadaAnt');
                            tiempo = (1:length(senalS))/f_muestreo;
                            plot(handles.grSenales,tiempo,senalSAnt);
                            hold(handles.grSenales,'on');
                            plot(handles.grSenales,tiempo,senalS,'magenta');
                        else
                            if tipoSenal(1) == 1
                                X=get(est,'X');
                                t = X.tiempo;
%                                length(X.datos)
                                t = t(1);
                                plot(handles.grSenales,X.tiempo-t,X.datos);
                                hold(handles.grSenales,'on');
                            end
                            if tipoSenal(2) == 1
                                senalF = get(est,'senalFiltrada');
                                senalFAnt = get(est,'senalFiltradaAnt');
                                t = senalF.tiempo;
                                t = t(1);
                                xlim= get(handles.grSenales,'Xlim');
                                ylim= get(handles.grSenales,'Ylim');

                                plot(handles.grSenales,senalF.tiempo-t,senalFAnt.datos,'black');
                                hold(handles.grSenales,'on');
                                plot(handles.grSenales,senalF.tiempo-t,senalF.datos,'cyan');
                                hold(handles.grSenales,'on');
                                set(handles.grSenales,'Xlim',xlim);
                                set(handles.grSenales,'Ylim',ylim);
                            end
                            if tipoSenal(3) == 1
                                rtA = get(est,'ruidoTeluricoAnt');
                                rt = get(est,'ruidoTelurico');
                                X=get(est,'X');
                                t = X.tiempo;
                                length(X.datos)
                                %xlim= get(handles.grSenales,'Xlim');
                                %ylim= get(handles.grSenales,'Ylim');
                                t = t(1);

                                plot(handles.grSenales,X.tiempo-t,rtA(1:length(X.datos)),'red');
                                hold(handles.grSenales,'on');
                                plot(handles.grSenales,X.tiempo-t,rt(1:length(X.datos)),'green');
                                %set(handles.grSenales,'Xlim',xlim);
                                %set(handles.grSenales,'Ylim',ylim);

                            end
                        end
                    end
                    hold(handles.grSenales,'off');
                end
        end
    %catch
     %   errordlg('Debe cargar los datos de la estacion antes de graficar','Error al graficar la senal','modal');
    %end