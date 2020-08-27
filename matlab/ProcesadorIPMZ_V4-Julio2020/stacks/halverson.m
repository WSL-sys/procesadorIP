function Y = halverson(X,fmuestreo,freqT)
%Y = halverson(X,ventana,freqT,fmuestreo)
%
%Aplica el stacking de halverson reducido con la ventana definida en
%ventana.
%freqT: define la frecuencia del transmisor.
%fmuestreo: define la frecuencia de muestreo.
%
%ventanas:
%    @bartlett       - Bartlett window.
%    @barthannwin    - Modified Bartlett-Hanning window. 
%    @blackman       - Blackman window.
%    @blackmanharris - Minimum 4-term Blackman-Harris window.
%    @bohmanwin      - Bohman window.
%    @chebwin        - Chebyshev window.
%    @flattopwin     - Flat Top window.
%    @gausswin       - Gaussian window.
%    @hamming        - Hamming window.
%    @hann           - Hann window.
%    @kaiser         - Kaiser window.
%    @nuttallwin     - Nuttall defined minimum 4-term Blackman-Harris window.
%    @parzenwin      - Parzen (de la Valle-Poussin) window.
%    @rectwin        - Rectangular window.
%    @tukeywin       - Tukey window.
%    @triang         - Triangular window.

largo = length(X);
periodo = round(fmuestreo/freqT); %periodo del transmisor.
N = floor(largo/periodo - 1);

%ventana del filtro de halverson.
'hola'
filtro = [1/4 1/2 1/4];

%calcula coeficientes
%ventana = @chebwin;
2*N

W = chebwin(2*N);

Coef = conv(W,filtro);

Coef = Coef(length(filtro):length(W)+length(filtro)-1);
norm = sum(Coef);
i = 1:2*N;
arr = (-1).^(i-1);
Coef = arr.*Coef';
%filtra...
i = 1:periodo/2:periodo*N;
Y(1:periodo)=0;
for j = 1:periodo
    Y(j)=dot(Coef,X(1+(j-1):periodo/2:periodo*(N)+(j-1)));
    %Y(j) = sum(Coef.*X(1+(j-1):periodo/2:periodo*(N)+(j-1)));
end
Y = Y /norm;



