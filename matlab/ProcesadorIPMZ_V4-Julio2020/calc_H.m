function H=calc_H(MTZ,N,Fm,calfilex,calfiley)

[caltx,calFx]=calc_Hcal(calfilex,N,Fm);
[calty,calFy]=calc_Hcal(calfiley,N,Fm);
%calFx
%calFy
calFx=(calFx)/4.3;
calFy=(calFy)/4.3;

t=(1:N)/Fm;
F=(1:N)/N*Fm;
factor=250;
    
Hxx=interp1(1./MTZ.period,-conj(MTZ.zxx)/factor,F,'linear','extrap');
Hxy=interp1(1./MTZ.period,-conj(MTZ.zxy)/factor,F,'linear','extrap');
Hyx=interp1(1./MTZ.period,-conj(MTZ.zyx)/factor,F,'linear','extrap');
Hyy=interp1(1./MTZ.period,-conj(MTZ.zyy)/factor,F,'linear','extrap');
%plot(angle(Hxy));
%pause
fp=(0:(N-1))/N;
if mod(N,2)==0
    nn=N/2;
    fftHxx=[0 Hxx(1:(nn-1)) real(Hxx(nn)) conj(Hxx((nn-1):-1:1))];
    fftHxy=[0 Hxy(1:(nn-1)) real(Hxy(nn)) conj(Hxy((nn-1):-1:1))];
    fftHyx=[0 Hyx(1:(nn-1)) real(Hyx(nn)) conj(Hyx((nn-1):-1:1))];
    fftHyy=[0 Hyy(1:(nn-1)) real(Hyy(nn)) conj(Hyy((nn-1):-1:1))];
    F=[fp(1:(nn+1)) fp(nn:-1:2)];
else
    nn=(N-1)/2;
    fftHxx=[0 Hxx(1:nn) conj(Hxx(nn:-1:1))];    
    fftHxy=[0 Hxy(1:nn) conj(Hxy(nn:-1:1))];    
    fftHyx=[0 Hyx(1:nn) conj(Hyx(nn:-1:1))];    
    fftHyy=[0 Hyy(1:nn) conj(Hyy(nn:-1:1))];    
    F=[fp(1:(nn+1)) fp((nn+1):-1:2)];
end
fp=(0:(length(fftHxx)-1))/(length(fftHxx));
tmp=fftHxx./calFx; tmp(1)=0;
tHxx=real(ifft(tmp));
tmp=fftHxy./calFy; tmp(1)=0;
tHxy=real(ifft(tmp));
tmp=fftHyx./calFx; tmp(1)=0;
tHyx=real(ifft(tmp));
tmp=fftHyy./calFy; tmp(1)=0;
tHyy=real(ifft(tmp));
H.Hxx=fftshift(tHxx);
H.Hyx=fftshift(tHyx);
H.Hxy=fftshift(tHxy);
H.Hyy=fftshift(tHyy);
H.frecuencia=(0:length(H.Hxx)-1)/length(H.Hxx)*Fm;
%figure
%semilogx(H.frecuencia,180/pi*angle(calFy))

function Y=interpolar(X,F,ff)

rY=interp1(real(X),log(F),log(ff));
iY=interp1(imag(X),log(F),log(ff));
Y=rY+(-1)^0.5*iY;



