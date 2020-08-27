function [SP]=calcSPx(stack,Fm,perVmax)

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

%stack=stack-mean(stack);
%decayT=(stack((N2+1):(N2+min(N3-N2,N5-N4)))+stack((N4+1):(N4+min(N3-N2,N5-N4))))/2;

%for i = 1:length(W)
%    NW(i)=round(Fm*W(i))+1;
%end


%Newmont
N1=round(0.45*Fm);
N2=round(1.1*Fm);
Nmax0 = N1+round((N2-N1)*(1-perVmax));
Nmax1 = N2;
Nmax2 = (N3-1)+N1+round((N2-N1)*(1-perVmax));
Nmax3 = (N3-1)+N2;

SP = mean((stack(Nmax0:Nmax1)+stack(Nmax2:Nmax3))/2);

