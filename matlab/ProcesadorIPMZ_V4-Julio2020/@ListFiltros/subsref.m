function X=subsref(A,S)
switch S.type
    case '.'
        switch S.subs
            case 'filtros'
                X = A.filtros;
            case 'largo'
                X = A.index;
        end
end