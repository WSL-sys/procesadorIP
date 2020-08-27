function [imp,lowwH] = leer_calibracion(file,serie_p1)
%file
fid = fopen(file,'r');

%Lee el header
%serie_p1 = 4;
serie_p1 = 2;
serie_p2 = 5;%serie_p1;

% UTC	   	   	  UTC	  2007/04/13 13:17:33	
%SNUM	   	   	  Int	1995	
%NCHN	   	   	  Int	3	
%STAT	   	   	  Int	0	
%  HW	   	   	  Str	  RX3EW2I	
% VER	   	   	  Str	  3121D5	
%TCMB	   	   	  Int	4	
%TALS	   	   	  Int	11	
%LFRQ	   	   	  Int	50	
%V5SR	   	   	  Int	0	
%LPFR	   	   	  Int	0	

str = fgetl(fid);
str = fgetl(fid);
str = fgetl(fid);
[s1,s2,s3,s4,s5]=strread(str,'%s%s%s%s%f','delimiter',',');
canal =s5;
str = fgetl(fid);
str = fgetl(fid);
str = fgetl(fid);
str = fgetl(fid);
str = fgetl(fid);
str = fgetl(fid);
str = fgetl(fid);
str = fgetl(fid);
str = fgetl(fid);
str = fgetl(fid);
str = fgetl(fid);
str = fgetl(fid);

%Lee el los datos.
str = fgetl(fid);
j = 1;
k=1;
impedancia5(1).frecuencia(1)=0;
impedancia5(1).real(1)=0;
impedancia5(1).imag(1)=0;
impedancia4(1).frecuencia(1)=0;
impedancia4(1).real(1)=0;
impedancia4(1).imag(1)=0;
frecuencia_ant = 0;

while(ischar(str)) 
%       5,      0.375,   1,
%                       0.0226, 0.9989, 0.0000,  1.92962, 0.9981,-0.0000, 0.9981,  -0.00,
%                       0.0225, 0.9936, 0.0000,  1.92366, 0.9928,-0.0000, 0.9928,  -0.00,
%                      -0.0228,-1.0047, 0.0000,  1.91647,-1.0039, 0.0000, 1.0039, 180.00,

    [serie,frecuencia,N]=strread(str,'%f%f%f','delimiter',',');
    str = fgetl(fid);    
    if serie >= serie_p1 && serie <= serie_p2
    
        for i = 1:canal
        impedancia4.frecuencia(j) = frecuencia;
        [s1,s2,s3,s4,s5,s6,s7,s8]=strread(str,'%f%f%f%f%f%f%f%f','delimiter',',');
%        modulo = s7;
%        fase = s8/180*pi();
        impedancia4.real(j) = s1;%modulo*cos(fase);
        impedancia4.imag(j) = s2;%modulo*sin(fase);
        impedancia4.serie(j) = serie;%modulo*sin(fase);
        H(serie).real(j)=s1;
        H(serie).imag(j)=s2;
        H(serie).F(j)=frecuencia;
        
        end
    j = j+1;
	frecuencia_ant = frecuencia;
    end
     
    str = fgetl(fid); %linea en blanco    
    str = fgetl(fid);
end 
%impedancia5
minF = impedancia4.frecuencia(1);

a = 1;
%while impedancia5.frecuencia(a) <minF
% a = a +1;
% if a >length(impedancia5.frecuencia) break;
% end
%end

%a
%if a > 1
%    impedancia.frecuencia(1:(a-1)) = impedancia5.frecuencia(1:(a-1));
%    impedancia.real(1:(a-1)) = impedancia5.real(1:(a-1));
%    impedancia.imag(1:(a-1)) = impedancia5.imag(1:(a-1));
    largo = length(impedancia4.frecuencia);

impedancia.frecuencia(a:a+largo-1) = impedancia4.frecuencia;
    impedancia.real(a:a+largo-1) = impedancia4.real;
    impedancia.imag(a:a+largo-1) = impedancia4.imag;
    
%else
    impedancia = impedancia4;
%end
k=1;
minF=0;
for i = length(H):-1:1
    mo=10;
    m1=mo;
    m2=mo;
    if i==5
       m1=1;
    end
    if i==2
       m2=0;
    end
    
    for j = m1:(length(H(i).F)-m2)
        if H(i).F(j)>minF
        imp.real(k)=H(i).real(j);
        imp.imag(k)=H(i).imag(j);
        imp.frecuencia(k)=H(i).F(j);
        minF=H(i).F(j);
        k=k+1;
        end
    end        
end

lowH=[0.1757813	1.025867	21.78167; ...
0.1074219	0.9257049	33.15773; ...
0.06347656	0.7427841	47.87062; ...
0.03173828	0.4569781	65.70786; ...
0.02197266	0.331503	72.68609; ...
0.01098633	0.1716589	81.21492; ...
0.0054931	0.08661924	85.65969; ...
2.29E-03	0.0361838	88.28124; ...
1.14E-03	1.81E-02	89.34521]
lowwH.H=lowH(:,2).*(cos(lowH(:,3)/180*pi())+(-1)^0.5*sin(lowH(:,3)/180*pi()));
lowwH.frecuencia=lowH(:,1);
lowwH.real=real(lowwH.H);
lowwH.imag=imag(lowwH.H);
k=length(imp.frecuencia)+1;
for i = 1:length(lowwH.frecuencia)
    imp.frecuencia(k)=lowwH.frecuencia(i);
    imp.imag(k)=lowwH.imag(i);
    imp.real(k)=lowwH.real(i);
    k=k+1;
end
[a,b]=sort(imp.frecuencia);
    imp.frecuencia=imp.frecuencia(b);
    imp.imag=imp.imag(b);
    imp.real=imp.real(b);

%semilogx(impedancia.frecuencia,angle(impedancia.real +(-1)^0.5*impedancia.imag)*180/pi)