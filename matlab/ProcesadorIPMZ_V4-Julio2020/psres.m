function varargout = psres(varargin)
% PSRES MATLAB code for psres.fig
%      PSRES, by itself, creates a new PSRES or raises the existing
%      singleton*.
%
%      H = PSRES returns the handle to a new PSRES or the handle to
%      the existing singleton*.
%
%      PSRES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PSRES.M with the given input arguments.
%
%      PSRES('Property','Value',...) creates a new PSRES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before psres_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to psres_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help psres

% Last Modified by GUIDE v2.5 20-Jul-2018 12:12:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @psres_OpeningFcn, ...
                   'gui_OutputFcn',  @psres_OutputFcn, ...
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

    



% --- Executes just before psres is made visible.
function psres_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to psres (see VARARGIN)

% Choose default command line output for psres
handles.output = hObject;
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:Javaframe');
JF=get(hObject,'JavaFrame');%%%,'JavaFrame');
javax.swing.ImageIcon('myicon.png');
JF.setFigureIcon(javax.swing.ImageIcon('myicon.png'));

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes psres wait for user response (see UIRESUME)
% uiwait(handles.figure1);


colorbar('peer',handles.axes1);
if(length(varargin)>0)
    global imres;
    imres=varargin{1};    
    val=imres(:,5);
    k=1;
    for i = 1:length(imres(:,5))
        if ~((isnan(val(i)))||isinf(val(i))||(val(i)<=0))
            val(k)=imres(i,5);
            k=k+1;
        end
    end
    val=val(1:(k-1));
    
    set(handles.strmin,'String',num2str(log10(min(val))));
    set(handles.strmax,'String',num2str(log10(max(val))));
    plotdata(imres,handles)
end
if(length(varargin)>1)
    global procIPhnd;
    procIPhnd = varargin{2};
end
global psreshnd;
psreshnd = handles;

% --- Outputs from this function are returned to the command line.
function varargout = psres_OutputFcn(hObject, eventdata, handles) 
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
global imres;
plotdata(imres,handles);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global procIPhnd;
global imres;

[XX,YY]=plotdata(imres,handles);

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



% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
global psreshnd;
psreshnd = [];


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
'hola'
