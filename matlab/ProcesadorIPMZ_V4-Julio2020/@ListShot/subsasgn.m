function A = subsasgn(A,S,B)

switch S.type
    case '.'
        switch S.subs
            case 'Shots'
                A.Shots = B;   % asigna un arreglo de Shots
            case 'filename'
                A.filename = B;
            case 'agregar'
                A = agregar(A,B); % agrega un shot al final del arreglo
        end
end
