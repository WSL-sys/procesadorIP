function [X,Y,Z,Lats,Lons,Elevs,utmzone]=ToUTM(Lats,Lons,Elevs)
%Latm = str2double(Lats(3:8));
%Lonm = str2double(Lons(4:9));
%Latdeg = str2double(Lats(1:2));
%Londeg = str2double(Lons(1:3));
%Elev = Elevs;
%Lat=Latm/60 + Latdeg;
%Lon=Lonm/60 + Londeg;
%if(Lats(end)=='S')
%    Lat=-Lat;
%end
%if(Lons(end)=='W')
%    Lon=-Lon;
%end
[X,Y,utmzone] = deg2utm(Lats, Lons);
Z=Elevs;
