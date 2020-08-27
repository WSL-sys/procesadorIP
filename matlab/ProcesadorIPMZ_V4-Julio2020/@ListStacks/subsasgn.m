function A = subsasgn(A,S,B)

switch S.type
    case '.'
        switch S.subs
            case 'stacks'
                A.stacks = B;
            case 'largo'
                A.index = B;
        end
end