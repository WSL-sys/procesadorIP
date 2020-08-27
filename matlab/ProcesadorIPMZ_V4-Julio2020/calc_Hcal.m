function [tH,fH]=calc_Hcal(file,N,Fm)
global imp
imp = leer_calibracion_coil(file,0);

t=(1:N)/Fm;
F=(1:N)/N*Fm;
Hr=interp1(imp.frecuencia,imp.real,F);
Hi=interp1(imp.frecuencia,imp.imag,F);
H=Hr+Hi*(-1)^0.5;
%H(1)
%F(1)
if mod(N,2)==0
    nn=N/2;
    fftH=[0 H(1:(nn-1)) real(H(nn)) conj(H((nn-1):-1:1))];
else
    nn=(N-1)/2;
    fftH=[0 H(1:nn) conj(H(nn:-1:1))];    
end
tH=fftshift(real(ifft(fftH)));
fH=fftH;

function Y=interpolar(X,F,ff)

rY=interp1(real(X),log(F),log(ff));
iY=interp1(imag(X),log(F),log(ff));
Y=rY+(-1)^0.5*iY;



