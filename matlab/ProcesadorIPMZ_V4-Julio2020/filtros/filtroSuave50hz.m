function est=filtroSuave50hz(est)
% est=filtrosuave50hz(est)
% Filtro de 50hz con chebyshev de segundo grado entre 48 y 52 hz
%
X = get(est,'X');
datos = X.datos;

% matriz de coeficientes SOS
SOS(1,1:6) = [1.0000    1.1748    1.0000    1.0000    0.6272    0.9758];
    SOS(2,1:6) = [1.0000    0.8519    1.0000    1.0000    1.3152    0.9809];
    SOS(3,1:6) = [1.0000    1.1725    1.0000    1.0000    1.2868    0.9438];
    SOS(4,1:6) = [1.0000    0.8547    1.0000    1.0000    0.6186    0.9295];
    SOS(5,1:6) = [1.0000    1.1681    1.0000    1.0000    0.6166    0.8865];
    SOS(6,1:6) = [1.0000    0.8603    1.0000    1.0000    1.2559    0.9085];
    SOS(7,1:6) = [1.0000    1.1614    1.0000    1.0000    1.2227    0.8750];
    SOS(8,1:6) = [1.0000    0.8685    1.0000    1.0000    0.6208    0.8470];
    SOS(9,1:6) = [1.0000    1.1526    1.0000    1.0000    1.1875    0.8435];
    SOS(10,1:6) = [1.0000    0.8792    1.0000    1.0000    0.6307    0.8116];
    SOS(11,1:6) = [1.0000    1.1417    1.0000    1.0000    1.1505    0.8142];
    SOS(12,1:6) = [1.0000    0.8922    1.0000    1.0000    0.6461    0.7803];
    SOS(13,1:6) = [1.0000    1.1290    1.0000    1.0000    1.1120    0.7873];
    SOS(14,1:6) = [1.0000    0.9072    1.0000    1.0000    0.6664    0.7535];
    SOS(15,1:6) = [1.0000    1.1145    1.0000    1.0000    1.0721    0.7631];
    SOS(16,1:6) = [1.0000    0.9239    1.0000    1.0000    0.6913    0.7313];
    SOS(17,1:6) = [1.0000    1.0983    1.0000    1.0000    1.0312    0.7418];
    SOS(18,1:6) = [1.0000    0.9421    1.0000    1.0000    0.7201    0.7140];
    SOS(19,1:6) = [1.0000    1.0808    1.0000    1.0000    0.9896    0.7238];
    SOS(20,1:6) = [1.0000    0.9614    1.0000    1.0000    0.7525    0.7014];
    SOS(21,1:6) = [1.0000    1.0621    1.0000    1.0000    0.9478    0.7094];
    SOS(22,1:6) = [1.0000    0.9814    1.0000    1.0000    0.7878    0.6937];
    SOS(23,1:6) = [1.0000    1.0425    1.0000    1.0000    0.9061    0.6989];
    SOS(24,1:6) = [1.0000    1.0019    1.0000    1.0000    0.8256    0.6908];
    SOS(25,1:6) = [1.0000    1.0223    1.0000    1.0000    0.8652    0.6926];

    % filtra los datos
datos = sosfilt(SOS,datos); %filtra la se�al....

X.datos = datos;
est = set(est,'X',X);