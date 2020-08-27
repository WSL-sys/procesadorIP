function stacksync=fasestack(stack)

global stackb
global res

stackb=stack;

'QUE ONDA!!'
N = length(stack);
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
res(1:N)=0;
res(N1:N2)=1;
res((N2+1):N3)=0;
res((N3+1):N4)=-1;
res((N4+1):N5)=0;
size([res res]')
size(stack)
%[a,b]=max((xcorr([res res],stack)));
[a,b]=max(cconv(res,stackb,length(res)));
b = b-N/4;
b
for i = 1:N
    
    if((i+b)<=N)
        if(i+b)>0
            stacksync(i)=stack(i+b);
        else
            stacksync(i)=stack(i+b+N);    
        end
    else
        stacksync(i)=stack(i+b-N);
        
    end
end
%figure
%plot(res)
%hold on
%plot(stack,'k')
%plot(stacksync,'r')
%hold off
%plot(xcorr(res,stack),'x');
