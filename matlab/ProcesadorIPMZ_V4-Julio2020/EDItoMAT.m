function EDItoMAT()

gain=-4;
L=2400;
Fm=150;
global gdir;
[filex,gdir]=uigetfile([gdir '*.edi'],'MultiSelect', 'on');

if ischar(filex)
    file=[gdir filex];
        disp(file);
    [MTZ]=read_EDI(file);
    Hxcal=[pwd '\BMT53663.txt'];
    Hycal=[pwd '\BMT53663.txt'];
    TF=calc_H(MTZ,L,Fm,Hxcal,Hycal);
    fHxx=fft(fftshift(TF.Hxx));
    fHxy=fft(fftshift(TF.Hxy));
    fHyx=fft(fftshift(TF.Hyx));
    fHyy=fft(fftshift(TF.Hyy));
    N=length(fHyy);
    if(mod(N,2)==0)
        Nm=N/2;
    else
        Nm=(N-1)/2;
    end

    if mod(N,2)==0
        fHxx(Nm+2:end)=(conj(fHxx(Nm:-1:2)));
        fHxy(Nm+2:end)=(conj(fHxy(Nm:-1:2)));
        fHyx(Nm+2:end)=(conj(fHyx(Nm:-1:2)));
        fHyy(Nm+2:end)=(conj(fHyy(Nm:-1:2)));
    else
        fHxx(Nm+2:end)=(conj(fHxx(Nm+1:-1:2)));
        fHxy(Nm+2:end)=(conj(fHxy(Nm+1:-1:2)));
        fHyx(Nm+2:end)=(conj(fHyx(Nm+1:-1:2)));
        fHyy(Nm+2:end)=(conj(fHyy(Nm+1:-1:2)));
    end
    TF.Hxx=fftshift(real(ifft(fHxx)));
    TF.Hxy=fftshift(real(ifft(fHxy)));
    TF.Hyx=fftshift(real(ifft(fHyx)));
    TF.Hyy=fftshift(real(ifft(fHyy)));

    TF.frecuencia=Hedit.frecuencia;
    TF.Nm=Hedit.Nm;
    TF.gain=gain;%str2num(get(handles.strgain,'String'));
%    [matfile,gdir]=uiputfile([gdir '*.mat']);
    matfile=[file(1:(end-4)) '.mat'];
    save(matfile,'TF');
else
    
    for i = 1:length(filex)
    file=[gdir filex{i}];
        disp(file);
        [MTZ]=read_EDI(file);
         Hxcal=[pwd '\BMT53663.txt'];
         Hycal=[pwd '\BMT53663.txt'];
        TF=calc_H(MTZ,L,Fm,Hxcal,Hycal);

    %TF=varargin{1};
    fHxx=fft(fftshift(TF.Hxx));
    fHxy=fft(fftshift(TF.Hxy));
    fHyx=fft(fftshift(TF.Hyx));
    fHyy=fft(fftshift(TF.Hyy));
    N=length(fHyy);
    if(mod(N,2)==0)
        Nm=N/2;
    else
        Nm=(N-1)/2;
    end
    if mod(N,2)==0
        fHxx(Nm+2:end)=(conj(fHxx(Nm:-1:2)));
        fHxy(Nm+2:end)=(conj(fHxy(Nm:-1:2)));
        fHyx(Nm+2:end)=(conj(fHyx(Nm:-1:2)));
        fHyy(Nm+2:end)=(conj(fHyy(Nm:-1:2)));
    else
        fHxx(Nm+2:end)=(conj(fHxx(Nm+1:-1:2)));
        fHxy(Nm+2:end)=(conj(fHxy(Nm+1:-1:2)));
        fHyx(Nm+2:end)=(conj(fHyx(Nm+1:-1:2)));
        fHyy(Nm+2:end)=(conj(fHyy(Nm+1:-1:2)));
    end
    TF.Hxx=fftshift(real(ifft(fHxx)));
    TF.Hxy=fftshift(real(ifft(fHxy)));
    TF.Hyx=fftshift(real(ifft(fHyx)));
    TF.Hyy=fftshift(real(ifft(fHyy)));
    TF.Nm=Nm;
    TF.gain=gain;%str2num(get(handles.strgain,'String'));
    matfile=[file(1:(end-4)) '.mat'];
    save(matfile,'TF');
    end
end