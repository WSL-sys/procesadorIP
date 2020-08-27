function [ang,nperiod,period, zxx,zxy,zyx,zyy,dzxx,dzxy,dzyx,dzyy,SP,tx,ty,lat,long,elev]=readediespectr(cfile)
disp(cfile);
fid = fopen(cfile);
il = 1;
isp = 1;
ang=0;
SP=[];
zxxr=[];
zxyr=[];
zyxr=[];
zyyr=[];
zxxi=[];
zxyi=[];
zyxi=[];
zyyi=[];
zxxv=[];
zxyv=[];
zyxv=[];
zyyv=[];
txr=[];
txi=[];
tyr=[];
tyi=[];


while (feof(fid) == 0);
    tmp=fgetl(fid);[idum,len]=size(tmp);
    if (len>0)
        ctmp = strcat(tmp(1:len),'                                  EE');
        if (strfind(tmp, 'LAT=')>0)
            nn=strfind(tmp, 'LAT=');
            tmp = tmp((nn(1)+4):end);
            nn = strfind(tmp,':');
            disp([tmp(1:(nn(1)-1)),' ',tmp((nn(1)+1):(nn(2)-1)),' ',tmp((nn(2)+1):end)]);
            lat=sign(str2num(tmp(1:(nn(1)-1))))*(abs(str2num(tmp(1:(nn(1)-1))))+str2num(tmp((nn(1)+1):(nn(2)-1)))/60+str2num(tmp((nn(2)+1):end))/3600);
        end;
        if (strfind(ctmp,'LONG=')>0)
            nn=strfind(tmp, 'LONG=');
            tmp = tmp((nn(1)+5):end);
            nn = strfind(tmp,':');
            tmp(1:(nn(1)-1));
            tmp((nn(1)+1):(nn(2)-1));
            tmp((nn(2)+1):end);
            long=sign(str2num(tmp(1:(nn(1)-1))))*(abs(str2num(tmp(1:(nn(1)-1))))+str2num(tmp((nn(1)+1):(nn(2)-1)))/60+str2num(tmp((nn(2)+1):end))/3600);
        end;
        if (strfind(ctmp,'ELEV=')>0)
            nn=strfind(tmp, 'ELEV=');
            tmp = tmp((nn(1)+5):end);
            nn = strfind(tmp,':');
            elev=str2num(tmp(1:end));
        end;
        if (strfind(ctmp(1:8),'>ZROT //'))
            nfreq = str2num(ctmp(9:11));
            ang = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp(1:8),'>FREQ //'))
            nfreq = str2num(ctmp(9:11));
            freq = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp,'>ZXXR ROT=ZROT //'))
            zxxr = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp,'>ZXXI ROT=ZROT //'))
            zxxi = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp,'>ZXX.VAR ROT=ZROT //'))
            zxxv = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp,'>ZXYR ROT=ZROT //'))
            zxyr = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp,'>ZXYI ROT=ZROT //'))
            zxyi = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp,'>ZXY.VAR ROT=ZROT //'))
            zxyv = fscanf(fid,'%e',nfreq);
        end
        if (strfind(ctmp,'>ZYXR ROT=ZROT //'))
            zyxr = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp,'>ZYXI ROT=ZROT //'))
            zyxi = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp,'>ZYX.VAR ROT=ZROT //'))
            zyxv = fscanf(fid,'%e',nfreq);
        end
        if (strfind(ctmp,'>ZYYR ROT=ZROT //'))
            zyyr = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp,'>ZYYI ROT=ZROT //'))
            zyyi = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp,'>ZYY.VAR ROT=ZROT //'))
            zyyv = fscanf(fid,'%e',nfreq);
        end
                if (strfind(ctmp,'>TXR.EXP //'))
            txr = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp,'>TXI.EXP //'))
            txi = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp,'>TYR.EXP //'))
            tyr = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp,'>TYI.EXP //'))
            tyi = fscanf(fid,'%e',nfreq);
        end;
        if (strfind(ctmp(1:9), '>SPECTRA'))
            datos = strread(ctmp,'%s');
            tmpstr= datos{2};
            F = str2num(tmpstr(6:end));
            
            tmpstr= datos{end};
            ND = str2num(tmpstr);
            if isempty(ND)
                tmpstr= datos{end-1};
                ND = str2num(tmpstr);
            end                
            spectra = fscanf(fid,'%e',ND);            
            SP(isp).F = F;
            nl=7;
            SP(isp).HxHx = spectra((1-1)*nl + 1);
            SP(isp).HxHy = (-1)^0.5*spectra((1-1)*nl + 2)+spectra((2-1)*nl + 1);
            SP(isp).HxHz = (-1)^0.5*spectra((1-1)*nl + 3)+spectra((3-1)*nl + 1);
            SP(isp).HxEx = (-1)^0.5*spectra((1-1)*nl + 4)+spectra((4-1)*nl + 1);
            SP(isp).HxEy = (-1)^0.5*spectra((1-1)*nl + 5)+spectra((5-1)*nl + 1);
            SP(isp).HxHrx = (-1)^0.5*spectra((1-1)*nl + 6)+spectra((6-1)*nl + 1);
            SP(isp).HxHry = (-1)^0.5*spectra((1-1)*nl + 7)+spectra((7-1)*nl + 1);

            SP(isp).HyHy = spectra((2-1)*nl + 2);
            SP(isp).HyHz = (-1)^0.5*spectra((2-1)*nl + 3)+spectra((3-1)*nl + 2);
            SP(isp).HyEx = (-1)^0.5*spectra((2-1)*nl + 4)+spectra((4-1)*nl + 2);
            SP(isp).HyEy = (-1)^0.5*spectra((2-1)*nl + 5)+spectra((5-1)*nl + 2);
            SP(isp).HyHrx = (-1)^0.5*spectra((2-1)*nl + 6)+spectra((6-1)*nl + 2);
            SP(isp).HyHry = (-1)^0.5*spectra((2-1)*nl + 7)+spectra((7-1)*nl + 2);

            SP(isp).HzHz = spectra((3-1)*nl + 3);
            SP(isp).HzEx = (-1)^0.5*spectra((3-1)*nl + 4)+spectra((4-1)*nl + 3);
            SP(isp).HzEy = (-1)^0.5*spectra((3-1)*nl + 5)+spectra((5-1)*nl + 3);
            SP(isp).HzHrx = (-1)^0.5*spectra((3-1)*nl + 6)+spectra((6-1)*nl + 3);
            SP(isp).HzHry = (-1)^0.5*spectra((3-1)*nl + 7)+spectra((7-1)*nl + 3);

            SP(isp).ExEx = spectra((4-1)*nl + 4);
            SP(isp).ExEy = (-1)^0.5*spectra((4-1)*nl + 5)+spectra((5-1)*nl + 4);
            SP(isp).ExHrx = (-1)^0.5*spectra((4-1)*nl + 6)+spectra((6-1)*nl + 4);
            SP(isp).ExHry = (-1)^0.5*spectra((4-1)*nl + 7)+spectra((7-1)*nl + 4);

            SP(isp).EyEy = spectra((5-1)*nl + 5);
            SP(isp).EyHrx = (-1)^0.5*spectra((5-1)*nl + 6)+spectra((6-1)*nl + 5);
            SP(isp).EyHry = (-1)^0.5*spectra((5-1)*nl + 7)+spectra((7-1)*nl + 5);

            SP(isp).HrxHrx = spectra((6-1)*nl + 6);
            SP(isp).HrxHry = (-1)^0.5*spectra((6-1)*nl + 7)+spectra((7-1)*nl + 6);

            SP(isp).HryHry = spectra((7-1)*nl + 7);

            freq(isp) = F;
            isp = isp + 1;
            
        end;

    end;
    il = il+1;
end;
nperiod= length(freq);
period = 1./freq;

ii = sqrt(-1);
zxx = zxxr + ii*zxxi;
zxy = zxyr + ii*zxyi;
zyx = zyxr + ii*zyxi;
zyy = zyyr + ii*zyyi;
dzxx = zxxv;
dzxy = zxyv;
dzyx = zyxv;
dzyy = zyyv;
if length(txr)>0
tx = txr + ii*txi;
ty = tyr + ii*tyi;
else
    tx=[];
    ty=[];
end

%
fclose(fid);