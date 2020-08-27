function varargout = pscarg(varargin)
% PSCARG MATLAB code for pscarg.fig
%      PSCARG, by itself, creates a new PSCARG or raises the existing
%      singleton*.
%
%      H = PSCARG returns the handle to a new PSCARG or the handle to
%      the existing singleton*.
%
%      PSCARG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PSCARG.M with the given input arguments.
%
%      PSCARG('Property','Value',...) creates a new PSCARG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pscarg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pscarg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pscarg

% Last Modified by GUIDE v2.5 20-Jul-2018 12:22:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pscarg_OpeningFcn, ...
                   'gui_OutputFcn',  @pscarg_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

    



% --- Executes just before pscarg is made visible.
function pscarg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pscarg (see VARARGIN)

% Choose default command line output for pscarg
handles.output = hObject;
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:Javaframe');
JF=get(hObject,'JavaFrame');%%%,'JavaFrame');
javax.swing.ImageIcon('myicon.png');
JF.setFigureIcon(javax.swing.ImageIcon('myicon.png'));

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pscarg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


colorbar('peer',handles.axes1);
if(length(varargin)>0)
    global imcarg;
    imcarg=varargin{1};

    
    %[res,XX,YY]=pseudomap(imres);
    %b=pcolor(XX,YY,log10(res'));
    set(handles.strmin,'String',num2str((min(imcarg(:,5)))));
    set(handles.strmax,'String',num2str((max(imcarg(:,5)))));
    plotdatacarg(imcarg,handles)
%    set(b,'AlphaData',~isnan(res)) 
    
%    setcolor(128,log10(min(res(:,3))),log10(max(imres(:,3))));   
end

if(length(varargin)>1)
    global procIPhnd;
    procIPhnd = varargin{2};
end

global pscarhnd;
pscarhnd = handles;



% --- Outputs from this function are returned to the command line.
function varargout = pscarg_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function strmin_Callback(hObject, eventdata, handles)
% hObject    handle to strmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strmin as text
%        str2double(get(hObject,'String')) returns contents of strmin as a double


% --- Executes during object creation, after setting all properties.
function strmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function strmax_Callback(hObject, eventdata, handles)
% hObject    handle to strmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strmax as text
%        str2double(get(hObject,'String')) returns contents of strmax as a double


% --- Executes during object creation, after setting all properties.
function strmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imcarg;
plotdatacarg(imcarg,handles);

%function plotdata(arr,handles)
%
%    [res,XX,YY]=pseudomap(arr);
%    b=pcolor(handles.axes1,XX,YY,(res)');
%
%    set(b,'AlphaData',~isnan(res)) 
%    cmin=str2num(get(handles.strmin,'String'));
%    cmax=str2num(get(handles.strmax,'String'));
%    
%    setcolor(128,cmin,cmax);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global procIPhnd;
global imcarg;
imres=imcarg;
[XX,YY]=plotdatacarg(imres,handles);

x(length(imres(:,1)))=0;
y(length(imres(:,1)))=0;
for i = 1:length(imres)
    if imres(i,3)==imres(i,4)
        x(i)=(imres(i,1)+imres(i,3))/2;
        y(i)=-abs(-imres(i,1)+imres(i,3))/2;
    else
        x(i)=(imres(i,1)+imres(i,3))/2;
        y(i)=-abs(-imres(i,4)+imres(i,3))/2;    
    end
end
[xo,yo]=ginput(1);
dX=XX(2)-XX(1);
dY=YY(2)-YY(1);

[a,nx]=min((XX-xo+dX/2).^2);
[a,ny]=min((YY-yo+dY/2).^2);
[a,n]=min((y-YY(ny)).^2+(x-XX(nx)).^2);
set(procIPhnd.popShot,'Value',imres(n,6));
set(procIPhnd.popEstacion,'Value',imres(n,7));
hold on;
plot(handles.axes1,XX(nx)+dX/2,YY(ny)+dY/2,'xk');
hold off;

global objLstShot;
shots = objLstShot.Shots;
%valor
shot = shots{imres(n,6)};
ests = shot.objLstEst;
est = get(ests,imres(n,7));
graficarSenales(procIPhnd,est);
setad(procIPhnd,est);
