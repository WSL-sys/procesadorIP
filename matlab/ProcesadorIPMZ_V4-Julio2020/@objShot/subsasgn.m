function A = subsasgn(A,S,B)

switch S.type
    case '.'
        switch S.subs
            case 'filename'
                A.filename = B;
            case 'shotFile'
                A.shotFile = B;
            case 'objLstEst'
                A.objLstEst = B;
            case 'filterFile'
                A.filterFile = B;
            case 'stackFile'
                A.stackFile = B;
            case 'lstFiltros'
                A.lstFiltros = B;
            case 'lstStacks'
                A.lstStacks = B;
            case 'filtroGlobal'
                A.filtroGlobal = B;
            case 'stackGlobal'
                A.stackGlobal = B;
            case 'indiceEstFiltro'
                A.indiceEstFiltro = B;
            case 'indiceEstStack'
                A.indiceEstStack = B;
        end
end
