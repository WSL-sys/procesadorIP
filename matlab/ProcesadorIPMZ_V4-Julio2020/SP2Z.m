function MTZ=SP2Z(MTZ,opt)

for i = 1:length(MTZ)
    SP = MTZ(i).SP;
    zxx=[];
    zxy=[];
    zyx=[];
    zyy=[];

    for j = 1:length(SP);
        s = SP(j);       
        EHL=[conj(s.HxEx) conj(s.HyEx); conj(s.HxEy) conj(s.HyEy)];
        HHL=[s.HxHx s.HxHy; conj(s.HxHy) s.HyHy];

        EHR=[s.ExHrx s.ExHry; s.EyHrx s.EyHry];
        HHR=[s.HxHrx s.HxHry; s.HyHrx s.HyHry];
        Z = EHR*(HHR)^(-1);
        ZL = EHL*(HHL)^(-1);
        
        if opt == 0
        zxx(j) = Z(1,1);
        zxy(j) = Z(1,2);
        zyx(j) = Z(2,1);
        zyy(j) = Z(2,2);
        else
        zxx(j) = ZL(1,1);
        zxy(j) = ZL(1,2);
        zyx(j) = ZL(2,1);
        zyy(j) = ZL(2,2); 
        end


        %Calcula Coherencias simples
        MTZ(i).cexey(j)=abs(s.ExEy)^2./(s.ExEx*s.EyEy);
        MTZ(i).cexhx(j)=abs(s.HxEx)^2./(s.ExEx*s.HxHx);
        MTZ(i).cexhy(j)=abs(s.HyEx)^2./(s.ExEx*s.HyHy);
        MTZ(i).cexhrx(j)=abs(s.ExHrx)^2./(s.ExEx*s.HrxHrx);
        MTZ(i).ceyhry(j)=abs(s.ExHry)^2./(s.ExEx*s.HryHry);

        MTZ(i).ceyhx(j)=abs(s.HxEy)^2./(s.EyEy*s.HxHx);
        MTZ(i).ceyhy(j)=abs(s.HyEy)^2./(s.EyEy*s.HyHy);
        MTZ(i).ceyhrx(j)=abs(s.EyHrx)^2./(s.EyEy*s.HrxHrx);
        MTZ(i).ceyhry(j)=abs(s.EyHry)^2./(s.EyEy*s.HryHry);

        MTZ(i).chxhy(j)=abs(s.HxHy)^2./(s.HxHx*s.HyHy);
        MTZ(i).chxhrx(j)=abs(s.HxHrx)^2./(s.HxHx*s.HrxHrx);
        MTZ(i).chxhry(j)=abs(s.HxHry)^2./(s.HxHx*s.HryHry);

        MTZ(i).chyhrx(j)=abs(s.HyHrx)^2./(s.HyHy*s.HrxHrx);
        MTZ(i).chyhry(j)=abs(s.HyHry)^2./(s.HyHy*s.HryHry);

        MTZ(i).chrxhry(j)=abs(s.HrxHry)^2./(s.HrxHrx*s.HryHry);

        MTZ(i).chxhz(j)=abs(s.HxHz)^2./(s.HxHx*s.HzHz);
        MTZ(i).chyhz(j)=abs(s.HyHz)^2./(s.HyHy*s.HzHz);

        %Calcula Coherencias multiples
            HH = [s.HxHx s.HxHy; conj(s.HxHy) s.HyHy];
            HH = HH^(-1);
            ExH = [conj(s.HxEx) conj(s.HyEx)];
            EyH = [conj(s.HxEy) conj(s.HyEy)];
            MTZ(i).cexhxhy(j)=abs(ExH*HH*ExH')/(s.ExEx);
            MTZ(i).ceyhxhy(j)=abs(EyH*HH*EyH')/(s.EyEy);

            EE = [s.ExEx s.ExEy; conj(s.ExEy) s.EyEy];
            EE = EE^(-1);
            HxE = [s.HxEx s.HxEy];
            HyE = [s.HyEx s.HyEy];
            MTZ(i).chxexey(j)=abs(HxE*EE*HxE')/(s.HxHx);
            MTZ(i).chyexey(j)=abs(HyE*EE*HyE')/(s.HyHy);

            HH = [s.HrxHrx s.HrxHry; conj(s.HrxHry) s.HryHry];
            HH = HH^(-1);
            %ExH = [s.ExHrx s.ExHry];
            %EyH = [s.EyHrx s.EyHry];
            MTZ(i).cexhrxhry(j)=abs(ExH*HH*ExH')/(s.ExEx);
            MTZ(i).ceyhrxhry(j)=abs(EyH*HH*EyH')/(s.EyEy);

            HH = [s.HrxHrx s.HrxHry; conj(s.HrxHry) s.HryHry];
            HH = HH^(-1);
            HxH = [s.HxHrx s.HxHry];
            HyH = [s.HyHrx s.HyHry];
            MTZ(i).chxhrxhry(j)=abs(HxH*HH*HxH')/(s.HxHx);
            MTZ(i).chyhrxhry(j)=abs(HyH*HH*HyH')/(s.HyHy);


    end

    MTZ(i).zxx=zxx;
    MTZ(i).zxy=zxy;
    MTZ(i).zyx=zyx;
    MTZ(i).zyy=zyy;
    Np = length(zxx);
    period = MTZ(i).period;
    
    %Calcula resistividad aparente.
    [Rxy,Ryx,Pxy,Pyx,Rxx,Ryy,Pxx,Pyy]=calAppPhs(1,Np,period,zxy,zyx,zxx,zyy);    
    
    MTZ(i).rxx=Rxx;
    MTZ(i).rxy=Rxy;
    MTZ(i).ryx=Ryx;
    MTZ(i).ryy=Ryy;
    MTZ(i).pxx=Pxx;
    MTZ(i).pxy=Pxy;
    MTZ(i).pyx=Pyx;
    MTZ(i).pyy=Pyy;
    

    %Calcular Varianzas.
    
    
    
end