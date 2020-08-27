function [decayW,decayT,NMIP,R,V]=calcIPx(stack,W,Fm,I,perVmax)

N=length(stack);
switch mod(N,4)
    case 0
      N1 = 1;
      N2 = N/4;
      N3 = 2*N/4;
      N4 = 3*N/4;
      N5 = N;
    case 1
      N1 = 1;
      N2 = (N-1)/4;
      N3 = 2*(N-1)/4;
      N4 = 3*(N-1)/4;
      N5 = N;        
    case 2
      N1 = 1;
      N2 = (N+2)/4;
      N3 = 2*N/4;
      N4 = 3*(N+2)/4;
      N5 = N;        
    case 3
      N1 = 1;
      N2 = (N+1)/4;
      N3 = 2*(N-1)/4;
      N4 = 3*(N+1)/4;
      N5 = N;        
end

stack=stack-mean(stack);
decayT=(stack((N2+1):(N2+min(N3-N2,N5-N4)))-stack((N4+1):(N4+min(N3-N2,N5-N4))))/2;
%decayT=(stack((N2+1):(N2+min(N3-N2,N5-N4))));
%decayT=-stack((N4+1):(N4+min(N3-N2,N5-N4)));


for i = 1:length(W)
    NW(i)=round(Fm*W(i))+1;
end

for i = 1:(length(NW)-1)
    if NW(i+1)<length(decayT)
    decayW(i)=median(decayT(NW(i):NW(i+1)));
    else
    decayW(i)=median(decayT(NW(i):end));        
    end
    TW(i)=mean(NW(i)+NW(i+1))/Fm;
    dT(i)=mean(-NW(i)+NW(i+1))/Fm;
end

%Newmont
Fm;
N1=round(0.45*Fm);
N2=round(1.1*Fm);

%Carga y Res
Nmax = N1+round((N2-N1)*(1-perVmax));
%[Nmax N2]
N1=round(0.45*Fm);
N2=round(1.1*Fm);
Nmax0 = N1+round((N2-N1)*(1-perVmax));
Nmax1 = N2;
Nmax2 = (N3-1)+N1+round((N2-N1)*(1-perVmax));
Nmax3 = (N3-1)+N2;
maxV = mean((stack(Nmax0:Nmax1)-stack(Nmax2:Nmax3))/2);
%maxV = mean(stack(Nmax:N2));
V=maxV;

R = maxV/I;
Carg = median(decayW.*dT)/sum(dT)/maxV*1000;
NMIP=median(decayT(N1:N2))*1000/maxV;
decayW=decayW*1000/maxV; 

% % Calculando k para Rhoapp
% C1R1=sqrt((XC1-XR1)^2+(YC1-YR1)^2+(ZC1-ZR1)^2);
% C2R1=sqrt((XC2-XR1)^2+(YC2-YR1)^2+(ZC2-ZR1)^2);
% C1R2=sqrt((XC1-XR2)^2+(YC1-YR2)^2+(ZC1-ZR2)^2);
% C2R2=sqrt((XC2-XR2)^2+(YC2-YR2)^2+(ZC2-ZR2)^2);
% 
% Rapp=(R*2*pi)/((1/C1R1)-(1/C2R1)-((1/C1R2)-(1/C2R2)));
