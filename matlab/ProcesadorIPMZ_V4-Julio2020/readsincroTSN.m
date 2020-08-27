function X=readsincroTSN(file1,file2,dN)

[header,tini,tfin] = leer_header(file1);
nini=datenum(tini);
nfin=datenum(tfin);
[header,tini,tfin] = leer_header(file2);
nini2=datenum(tini);
nfin2=datenum(tfin);
N1=round((nini-nini2)*24*3600)*150;
N2=N1+(round((nfin-nini)*24*3600)+1)*150-1;

if N1 < 0
    msgbox('error fatalufi!!');
end

X=TSNfiles;
X=open_TSN_All_page(X,file2);
datos=read_TSN_All_page(X,N1-dN,N2+dN);
X.datos=datos;
length(datos)


