 function estX = filtro_telurico(estX,estXREM,params)
 %lim_inf_,lim_sup,impedancia,canal,ganancia,restar)
 %[datos_corr,ruido] = filtro_telurico(estX,estXREM,estXtrans,impedancia)
 % d2 = filtro_telurico(X,d,drem,f_muestreo,f_trans,impedancia)
 % Calcula y remueve el ruido telurico en estacion ip a partir de mediciones
 % en estacion remota.
%global Hedit;
%global Heditlsq;
%global TF;
%global RTSN;
%global HTSN;
'hole estoy aqui'

global TF
global RTSN
%params

TF = load(params{1});
TF = TF.TF;
Nm=TF.Nm;
N=length(TF.Hxx);
Taper = str2num(params{12});

%Nm=N;
%TF.frecuencia=Hedit.frecuencia;
%TF.Nm=Hedit.Nm;
%TF.gain=str2num(get(handles.strgain,'String'));
nhx=str2num(params{2});
nhy=str2num(params{3});
%[nhx nhy]
%nex=str2num(params{4});
%ney=str2num(params{5});
X = get(estXREM,'X');
HTSN = X.datos;
Hx=[zeros(0,1); HTSN(:,nhx)];
Hy=[zeros(0,1); HTSN(:,nhy)];
RTSN=[];
RTSN(:,1)=(filter(TF.Hxx,1,Hx-mean(Hx))+filter(TF.Hxy,1,Hy-mean(Hy)));
RTSN(:,2)=(filter(TF.Hyx,1,Hx-mean(Hx))+filter(TF.Hyy,1,Hy-mean(Hy)));
%RTSN=filter([1 1 1]/3,1,RTSN(Nm+1:end,:));
dn=str2num(params{7});
%RTSN=[RTSN((Nm+dn+1):end,:); zeros(Nm+dn,length(RTSN(1,:)))]/100;

dn0=Nm+dn
if dn0 < 0
    RTSN=[zeros(abs(dn0),length(RTSN(1,:))); RTSN(1:(end-abs(dn0)),:)]/100;
else
    RTSN=[RTSN((dn0+1):end,:); zeros(dn0,length(RTSN(1,:)))]/100;
end


%length(RTSN)
RTSN=RTSN((Taper+1):(end-Taper),:);
%length(RTSN)
%Taper
f50Hz = params{10};
f60Hz = params{11};

if(f50Hz==1)
RTSN=filter([1 1 1]/3,1,RTSN(:,:));
end
if(f60Hz==1)
RTSN=filter([1 1 1 1 1]/5,1,RTSN(:,:));
end


%RTSN=filter([1 1 1]/3,1,RTSN(Nm+1:end,:));
nE=str2num(params{9});
% ruido=pasa_bandax(ruido,fm,Fmin*0.9,Fmin,Fmax*1.1,Fmax,0,1,1,0)/gain;
Fmin=str2num(params{5});
Fmax=str2num(params{6});
X=get(estX,'X');%,pasa_bandax(RTSN(:,nE),Fm,Fmin*0.9,Fmin,Fmax*1.1,Fmax,0,1,1,0)*str2num(params{4}));%ruido
header=X.header;
%header
Fm=header.f_muestreo;
%'filtro'
%[Fm Fmin Fmax]
%pause
%Fmin=1; 
%Fmax=5;
RTSN(:,nE)=pasa_bandax(RTSN(:,nE),Fm,Fmin*0.9,Fmin,Fmax*1.1,Fmax,0,1,1,0)*str2num(params{4});
%RTSN(:,nE)*str2num(params{4})
estX=set(estX,'ruidoTelurico',RTSN(:,nE));%ruido


if(params{8})
    X=get(estX,'X');
    datosproc=X.datos;
    X.datos=(datosproc-RTSN(:,nE));
    estX=set(estX,'X',X);
%    estX=set(estX,'ruidoTelurico',datosproc-RTSN(:,nE)*str2num(params{4}));%ruido
end

%length(RTSN)
%length(Hx)

%TFplotTSN(handles);
% global Hedit;
% global Heditlsq;
% global TF;
% global RTSN;
% global HTSN;
% Nm=Hedit.Nm;
% N=length(Hedit.fHxx);
% fHxx=Hedit.fHxx;
% fHxy=Hedit.fHxy;
% fHyx=Hedit.fHyx;
% fHyy=Hedit.fHyy;
% 
% if(get(handles.checklsq,'Value'))
% fHxx=Heditlsq.fHxx;
% fHxy=Heditlsq.fHxy;
% fHyx=Heditlsq.fHyx;
% fHyy=Heditlsq.fHyy;
% end
% 
% if mod(N,2)==0
%    fHxx(Nm+2:end)=(conj(fHxx(Nm:-1:2)));
%    fHxy(Nm+2:end)=(conj(fHxy(Nm:-1:2)));
%    fHyx(Nm+2:end)=(conj(fHyx(Nm:-1:2)));
%    fHyy(Nm+2:end)=(conj(fHyy(Nm:-1:2)));
% else
%    fHxx(Nm+2:end)=(conj(fHxx(Nm+1:-1:2)));
%    fHxy(Nm+2:end)=(conj(fHxy(Nm+1:-1:2)));
%    fHyx(Nm+2:end)=(conj(fHyx(Nm+1:-1:2)));
%    fHyy(Nm+2:end)=(conj(fHyy(Nm+1:-1:2)));
% end
% TF.Hxx=fftshift(real(ifft(fHxx)));
% TF.Hxy=fftshift(real(ifft(fHxy)));
% TF.Hyx=fftshift(real(ifft(fHyx)));
% TF.Hyy=fftshift(real(ifft(fHyy)));
% 
% TF.frecuencia=Hedit.frecuencia;
% TF.Nm=Hedit.Nm;
% TF.gain=str2num(get(handles.strgain,'String'));
% Hx=HTSN(:,nhx);
% Hy=HTSN(:,nhy);
% RTSN=[];
% RTSN(:,1)=(filter(TF.Hxx,1,Hx-mean(Hx))+filter(TF.Hxy,1,Hy-mean(Hy)));
% RTSN(:,2)=(filter(TF.Hyx,1,Hx-mean(Hx))+filter(TF.Hyy,1,Hy-mean(Hy)));
% RTSN=filter([1 1 1]/3,1,RTSN(Nm+1:end,:));

 
 
%  params
%  xfile=params{1};
%  Hxch=str2num(params{2});
%  Hych=str2num(params{3});
%  gain=str2num(params{4});
%  Fmax=str2num(params{5});
%  Fmin=str2num(params{6});
%  Nw=str2num(params{7});
%  restar=params{8};
%  Hxcal=(params{9});
%  Hycal=(params{10});
% 
%  XX = get(estXREM,'X');
% 
%  hd = XX.header;
%  tr = XX.tiempo;
%  fm = hd.f_muestreo;
%  %parámetros.
%  %ft = get(estXtrans,'frecuencia')
%  %
% %global ruidoy;
% %global rx;
% %global ry;
% %global Xdatos;
% %global ref;
%  canalx = Hxch;
%  canaly = Hych;
% %[edifile,gdir]=uigetfile([gdir '*.edi']);
% %edifile=[gdir edifile];
% %set(handles.edifile,'String',edifile);
% Fm=fm;
% xfile
% if strcmp(xfile(end-2:end),'edi')
%     L=Nw;
%     [MTZ]=read_EDI(xfile);
%     if isempty(Hxcal)
%      Hxcal=[pwd '\BMT53663.txt'];
%     % set(handles.calHxfile,'String',Hxcal);
%     end
%     if isempty(Hycal)
%      Hycal=[pwd '\BMT53663.txt'];
%     % set(handles.calHyfile,'String',Hycal);
%     end
%     TF=calc_H(MTZ,L,Fm,Hxcal,Hycal);
% end
% xfile(end-2:end)
% if strcmp(xfile(end-2:end),'mat')
%     load(xfile);
%     Hedit=TF;
% end
% 
%  XREM = get(estXREM,'X');  %datos de la estacion_remota.
%  X = get(estX,'X');        %datos de la estacion_IP
%  header = X.header; %header de estacion_IP
%  Xdatos = X.datos; %datos de estacion_IP
%  Xtiempo = X.tiempo;
%  
%  tmp_datos = XREM.datos;
% % size(tmp_datos)
%  Hx = tmp_datos(:,canalx); %datos de estacion_REM
%  Hy = tmp_datos(:,canaly); %datos de estacion_REM
%  RTSN(:,1)=(filter(TF.Hxx,1,Hx-mean(Hx))+filter(TF.Hxy,1,Hy-mean(Hy)));
%  RTSN(:,2)=(filter(TF.Hyx,1,Hx-mean(Hx))+filter(TF.Hyy,1,Hy-mean(Hy)));
%  RTSN=RTSN(Nw+1:end,:);
% % XREMtiempo = XREM.tiempo;
%  fm = header.f_muestreo;
%  %ruido=pasa_bandax(RTSN(:,2),fm,Fmin*0.9,Fmin,Fmax*1.1,Fmax,0,1,1,0)/gain;
% 
%  
% %global Hedit;
% %global Heditlsq;
% %global TF;
% %global RTSN;
% %global HTSN;
% Nm=Hedit.Nm;
% N=length(Hedit.fHxx);
% fHxx=Hedit.fHxx;
% fHxy=Hedit.fHxy;
% fHyx=Hedit.fHyx;
% fHyy=Hedit.fHyy;
% 
% %if(get(handles.checklsq,'Value'))
% %fHxx=Heditlsq.fHxx;
% %fHxy=Heditlsq.fHxy;
% %fHyx=Heditlsq.fHyx;
% %fHyy=Heditlsq.fHyy;
% %end
% 
% if mod(N,2)==0
%    fHxx(Nm+2:end)=(conj(fHxx(Nm:-1:2)));
%    fHxy(Nm+2:end)=(conj(fHxy(Nm:-1:2)));
%    fHyx(Nm+2:end)=(conj(fHyx(Nm:-1:2)));
%    fHyy(Nm+2:end)=(conj(fHyy(Nm:-1:2)));
% else
%    fHxx(Nm+2:end)=(conj(fHxx(Nm+1:-1:2)));
%    fHxy(Nm+2:end)=(conj(fHxy(Nm+1:-1:2)));
%    fHyx(Nm+2:end)=(conj(fHyx(Nm+1:-1:2)));
%    fHyy(Nm+2:end)=(conj(fHyy(Nm+1:-1:2)));
% end
% TF.Hxx=fftshift(real(ifft(fHxx)));
% TF.Hxy=fftshift(real(ifft(fHxy)));
% TF.Hyx=fftshift(real(ifft(fHyx)));
% TF.Hyy=fftshift(real(ifft(fHyy)));
% 
% TF.frecuencia=Hedit.frecuencia;
% TF.Nm=Hedit.Nm;
% TF.gain=1;%str2num(get(handles.strgain,'String'));
% nhx=canalx;%str2num(get(handles.strNHx,'String'));
% nhy=canaly;%str2num(get(handles.strNHy,'String'));
% nex=1;%str2num(get(handles.strNEx,'String'));
% ney=1;%str2num(get(handles.strNEy,'String'));
% %Hx=HTSN(:,nhx);
% %Hy=HTSN(:,nhy);
% RTSN=[];
% RTSN(:,1)=(filter(TF.Hxx,1,Hx-mean(Hx))+filter(TF.Hxy,1,Hy-mean(Hy)));
% RTSN(:,2)=(filter(TF.Hyx,1,Hx-mean(Hx))+filter(TF.Hyy,1,Hy-mean(Hy)));
% RTSN=filter([1 1 1]/3,1,RTSN((Nm+1):end,:));
% ruido=[RTSN(2:end,2)' zeros(Nm+1,1)']';
% ruido=pasa_bandax(ruido,fm,Fmin*0.9,Fmin,Fmax*1.1,Fmax,0,1,1,0)/gain;
% length(ruido)
% length(Hx)
% 
% 
% if restar
%     datos_corr=Xdatos;
%     L=min(length(ruido),length(Xdatos));    
%     ind=find((Xtiempo-tr(1))>0);
%     ini=ind(1)-1;
% %    'cucu'
% %    ini
%     for kk=1:min(length(Xdatos(ini:end)),length(ruido))
%     datos_corr(ini) = Xdatos(ini)-ruido(kk);%(1:length(Xdatos)); 
%     ini=ini+1;
%     end
%     ruidoAnt = - ruido;    
% else
%     datos_corr = Xdatos;
% end
% 
% X.datos = datos_corr;
% estX = set(estX,'X',X);
% estX = set(estX,'ruidoTelurico',ruido);
%  
%  
%   