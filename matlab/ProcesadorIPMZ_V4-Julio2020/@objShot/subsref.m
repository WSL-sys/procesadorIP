function X = subsref(A,S)

switch S.type
    case '.'
        switch S.subs
            case 'filename'
                X = A.filename;
            case 'shotFile'
                X = A.shotFile;
            case 'objLstEst'
                X = A.objLstEst;
            case 'filterFile'
                X = A.filterFile;
            case 'stackFile'
                X = A.stackFile;
            case 'lstFiltros'
                X = A.lstFiltros;
            case 'lstStacks'
                X = A.lstStacks;
            case 'filtroGlobal'
                X = A.filtroGlobal;
            case 'stackGlobal'
                X = A.stackGlobal;
            case 'indiceEstFiltro'
                X = A.indiceEstFiltro;
            case 'indiceEstStack'
                X = A.indiceEstStack;
        end
end
