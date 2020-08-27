

function [Rxy,Ryx,Pxy,Pyx,Rxx,Ryy,Pxx,Pyy]=calAppPhs(Ns,Np,period,zxy,zyx,zxx,zyy)

mue = 4*pi*1E-07;
for is = 1:Ns
    for ip = 1:Np
        omega = 2*pi/period(is,ip);
        if omega == 0 
            zzxy = zxy(is,ip)/796;
            zzyx = zyx(is,ip)/796;
            zzxx = zxx(is,ip)/796;
            zzyy = zyy(is,ip)/796;
            Rxy(is,ip) = 0;
            Ryx(is,ip) = 0;
            Pxy(is,ip) = 0;
            Pyx(is,ip) = 0;
            Rxx(is,ip) = 0;
            Ryy(is,ip) = 0;
            Pxx(is,ip) = 0;
            Pyy(is,ip) = 0;
        else
            zzxy = zxy(is,ip)/796;
            zzyx = zyx(is,ip)/796;
            zzxx = zxx(is,ip)/796;
            zzyy = zyy(is,ip)/796;
            Rxy(is,ip) = (1/(omega*mue))*abs(zzxy*zzxy);
            Ryx(is,ip) = (1/(omega*mue))*abs(zzyx*zzyx);
            Pxy(is,ip) = atan2(imag(zzxy),real(zzxy))*180/pi;
            Pyx(is,ip) = atan2(imag(zzyx),real(zzyx))*180/pi;
            Rxx(is,ip) = (1/(omega*mue))*abs(zzxx*zzxx);
            Ryy(is,ip) = (1/(omega*mue))*abs(zzyy*zzyy);
            Pxx(is,ip) = atan2(imag(zzxx),real(zzxx))*180/pi;
            Pyy(is,ip) = atan2(imag(zzyy),real(zzyy))*180/pi;
        end
    end;
end;
