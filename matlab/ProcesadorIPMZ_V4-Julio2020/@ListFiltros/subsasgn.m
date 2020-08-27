function A = subsasgn(A,S,B)

switch S.type
    case '.'
        switch S.subs
            case 'filtros'
                A.filtros = B;
            case 'largo'
                A.index = B;
        end
end