function [MTZ]=open_EDI(FileName)

%[FileName,pathedi,FilterIndex] = uigetfile('*.edi','Seleccionar archivos edi','MultiSelect', 'on');

%if iscell(FileName)
%    Nes = length(FileName);
%    disp(['numero de estaciones: ' num2str(Nes)]);
%else
    Nes = 1;
%    disp(['numero de estaciones: ' num2str(1)]);
%end
pathedi='';
for i = 1:Nes
    if iscell(FileName)
        cfile = [pathedi FileName{i}];
        name=FileName{i};
    else
        cfile = [pathedi FileName];
        name = FileName;
    end
    [ang,nperiod,period, zxx,zxy,zyx,zyy,dzxx,dzxy,dzyx,dzyy,SP,tx,ty,lat,lon,elev]=readedispectr(cfile);
    
    MTZ(i).name=name(1:(end-4));
    MTZ(i).ang = ang;
    MTZ(i).nperiod = nperiod;
    MTZ(i).period = period;
    MTZ(i).zxx = zxx;
    MTZ(i).zxy = zxy;
    MTZ(i).zyx = zyx;
    MTZ(i).zyy = zyy;
    MTZ(i).dzxx = dzxx;
    MTZ(i).dzxy = dzxy;
    MTZ(i).dzyx = dzyx;
    MTZ(i).dzyy = dzyy; 
    MTZ(i).tx = tx;
    MTZ(i).ty = ty;
    [X,Y,Z,Lat,Lon,Elev,utmzone]=ToUTM(lat,lon,elev);
    MTZ(i).X=X;
    MTZ(i).Y=Y;
    MTZ(i).Z=Z;
    MTZ(i).lat=Lat;
    MTZ(i).lon=Lon;
    MTZ(i).elev=Elev;
    MTZ(i).utmzone=utmzone;
    
    if isempty(SP)
        MTZ(i).SP =[];
    else
        MTZ(i).SP = SP;
        MTZ=SP2Z(MTZ,0)
    end
end


%for i = 1:Nes
%    cfile = [pathedi FileName(i)];
%    [ang,nperiod,period, zxx,zxy,zyx,zyy,dzxx,dzxy,dzyx,dzyy,tx,ty]=readedi1995tipper(cfile);
%    TIP.ang=ang;
%    TIP.nperiod=nperiod;
%    TIP.period=period;
%    TIP.zxx=zxx;
%    TIP.zxy=zxy;
%    TIP.zyx=zyx;
%    TIP.zyy=zyy;
%    TIP.tx=tx;
%    TIP.ty=ty;    
%    MTT(i)=TIP;
%end

