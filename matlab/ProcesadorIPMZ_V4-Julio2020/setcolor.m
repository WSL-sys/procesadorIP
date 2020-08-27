function setcolor(handles,n,cmin,cmax)

    s=[0 0 1; 0.0 0.5 1; 0.1 0.8 1; 0 1 0.1; 1 1 0; 1 0.5 0; 1 0 0];
    n=128;
    indx=1:((n-1)/(length(s(:,1))-1)):n;
    r(:,1)=interp1(indx,s(:,1),1:n);
    r(:,2)=interp1(indx,s(:,2),1:n);
    r(:,3)=interp1(indx,s(:,3),1:n);
    colormap(handles.figure1,r);
    colorbar('peer',handles.axes1);
    
    caxis(handles.axes1,[cmin,cmax]);
    
