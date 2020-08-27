function [im,XX,YY] = pseudoap(RRR)

X=sort(RRR(:,1));
k=1;
for i = 1:length(X)-1
    if(abs(X(i)-X(i+1)) > 0)
        dX(k)=abs(X(i)-X(i+1));
        k=k+1;
        break;
    end
end
dX=min(dX);
XX = 0:dX:max(X);
YY = 0:((-dX)/2):-max(max(abs(RRR(:,4)-RRR(:,1))),max(abs(RRR(:,4)-RRR(:,2))))/2;

for i = 1:length(RRR(:,1))
    if RRR(i,3)==RRR(i,4)
    xo=(RRR(i,1)+RRR(i,3))/2;
    yo=-abs(RRR(i,1)-RRR(i,3))/2;
    else
    xo=(RRR(i,1)+RRR(i,3))/2;
    yo=-abs(RRR(i,4)-RRR(i,3))/2;
    end
    [a,nx] = min(abs(xo-XX));
    [a,ny] = min(abs(yo-YY));
    RRR(i,1)=nx;
    RRR(i,2)=ny;
    
end



for i = 1:length(XX)
     for j = 1:length(YY)
             im(i,j)=NaN;
     end
end
 
for i = 1:length(RRR(:,3))
             im(RRR(i,1),RRR(i,2))=RRR(i,5);
end
 
