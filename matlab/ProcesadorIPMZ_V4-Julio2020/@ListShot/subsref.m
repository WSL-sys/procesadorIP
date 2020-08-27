function X = subsref(A,S)

switch S.type
    case '.'
        switch S.subs
            case 'Shots'
                X = A.Shots;
            case 'largo'
                X = A.indice;
            case 'filename'
                X = A.filename;
            case 'listarShots'
                X = listarShots(A);
        end
end
