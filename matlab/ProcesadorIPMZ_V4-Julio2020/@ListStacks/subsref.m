function X=subsref(A,S)
switch 'S.type'
    case '.'
        switch 'S.subs'
            case 'filtros'
                X = A.stacks;
            case 'largo'
                X = index;
        end
end