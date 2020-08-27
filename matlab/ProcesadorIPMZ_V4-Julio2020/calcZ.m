function [Z,Ec]=calcZ(Hxxx,Hyyy,EEE,N,opt)
Nz=N*15;
M=length(Hxxx);
Nwz=floor(M/Nz);
Nw=floor(Nz/N);
%[N M Nwz Nw]
length(EEE)
off=0;
opt='mix';
for kk=1:Nwz
%    kk
    Hx=Hxxx((off+1):(off+Nz));
    Hy=Hyyy((off+1):(off+Nz));
    E=EEE((off+1):(off+Nz));
    fftHx(Nw,N)=0;
    fftHy(Nw,N)=0;
    fftE(Nw,N)=0;
    for i = 1:Nw
        ini=(i-1)*N+1;
        fin=(i)*N;
        fftHx(i,:)=fft(hann(N).*Hx(ini:fin));
        fftHy(i,:)=fft(hann(N).*Hy(ini:fin));
        fftE(i,:)=fft(hann(N).*E(ini:fin));
    end
    varlim=0.6;
    Z(N,2)=0;
    maxiter=30;
    W=[];
    W(1:Nw)=(1:Nw)*0 +1;
    for i = 1:N
        Ro=median(abs(fftE(:,i)-median(fftE(:,i))));
        for iter=1:maxiter
            if iter == 1
            else
                disp([kk i iter])
                disp((Rmm/Ro))
                if (abs(1-(Rmm/Ro))> varlim) && (Rmm<Ro)
                    break;
                end
                if abs(Rmm-Rmm_ant) < 1e-4*Ro
                    break;
                end
                    
            end
    %    length(fftHx)
    %    length(hann(N))
        HHx=fftHx(:,i);
        HHy=fftHy(:,i);
        EE=fftE(:,i);
%        HHxEE=HHxHHx*Zxx + HHxHHy*Zxy   
%        HHyEE=HHyHHx*Zxx + HHyHHy*Zxy   
        HHxEE=dot(HHx,W'.*EE);
        HHyEE=dot(HHy,W'.*EE);
        HHxHHx=dot(HHx,W'.*HHx);
        HHxHHy=dot(HHx,W'.*HHy);
        HHyHHx=dot(HHy,W'.*HHx);
        HHyHHy=dot(HHy,W'.*HHy);
        switch opt
            case 'mix'
                M=[HHxHHx HHxHHy;HHyHHx HHyHHy];
                X=[HHxEE;HHyEE];
                Z(i,:)=M^(-1)*X;
            case 'Hx'
                M=[HHxHHx];
                X=[HHxEE];
                Z(i,1)=M^(-1)*X;
                Z(i,2)=0;
            case 'Hy'
                M=[HHxHHy];
                X=[HHyEE];
                Z(i,2)=M^(-1)*X;
                Z(i,1)=0;
        end
        R=(EE-Z(i,1)*HHx-Z(i,2)*HHy);
        R=R.*W'/median(W);
        Rm=median(R);
        Rmm=median(abs(R-Rm));
        k=1.345*Rmm;
        for n =1:Nw
%            W(n)
            if (abs(R(n)-Rm)<k) 
%                if (W(n)<1)
%                    W(n)
%                end
                W(n)=W(n);
            else
                W(n)=W(n)*k/abs(R(n)-Rm);     
            end            
        end
    %    W
    %    disp([Rm iter]);
        %    [HHx,HHy]
        Rmm_ant=Rmm;
        end
%        disp([Rm i]);
    end
    off=off+Nz;
    ZZ1(:,kk)=Z(:,1);
    ZZ2(:,kk)=Z(:,2);
    RR1(kk)=Rmm;
    RR2(kk)=Rmm;
end

for i = 1:length(ZZ1(:,1))
    ZZZ(i,1)=mean(ZZ1(i,:).*RR1)/mean(RR1);
    ZZZ(i,2)=mean(ZZ2(i,:).*RR2)/mean(RR2);
end
Z=[];
Z(:,1)=ZZZ(:,1);
Z(:,2)=ZZZ(:,2);
Hz1=ifft(Z(:,1));
Hz2=ifft(Z(:,2));
Ec=filter(Hz1,1,Hx)+filter(Hz2,1,Hy);

%Ec=Ec(N:end);