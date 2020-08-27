function [XX,YY]=plotdata(arr,handles)

    [res,XX,YY]=pseudomap(arr);
    b=pcolor(handles.axes1,XX,YY,log10(res)');

    set(b,'AlphaData',~isnan(res)); 
    b.ButtonDownFcn = get(handles.axes1,'ButtonDownFcn');
    
    cmin=str2num(get(handles.strmin,'String'));
    cmax=str2num(get(handles.strmax,'String'));
    
    setcolor(handles,128,cmin,cmax);
