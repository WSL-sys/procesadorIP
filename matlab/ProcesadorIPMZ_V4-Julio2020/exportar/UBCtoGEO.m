function varargout = UBCtoGEO(varargin)
% UBCTOGEO M-file for UBCtoGEO.fig
%      UBCTOGEO, by itself, creates a new UBCTOGEO or raises the existing
%      singleton*.
%
%      H = UBCTOGEO returns the handle to a new UBCTOGEO or the handle to
%      the existing singleton*.
%
%      UBCTOGEO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UBCTOGEO.M with the given input arguments.
%
%      UBCTOGEO('Property','Value',...) creates a new UBCTOGEO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UBCtoGEO_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UBCtoGEO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UBCtoGEO

% Last Modified by GUIDE v2.5 17-Jun-2008 14:24:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UBCtoGEO_OpeningFcn, ...
                   'gui_OutputFcn',  @UBCtoGEO_OutputFcn, ...
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


% --- Executes just before UBCtoGEO is made visible.
function UBCtoGEO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UBCtoGEO (see VARARGIN)

% Choose default command line output for UBCtoGEO
handles.output = 'yes';

% Update handles structure
guidata(hObject, handles);

% Make the figure modal
set(hObject,'WindowStyle','modal');

% UIWAIT makes UBCtoGEO wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UBCtoGEO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

delete(handles.figure1);


function txugUBC_Callback(hObject, eventdata, handles)
% hObject    handle to txugUBC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txugUBC as text
%        str2double(get(hObject,'String')) returns contents of txugUBC as a double


% --- Executes during object creation, after setting all properties.
function txugUBC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txugUBC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function btugGEO_Callback(hObject, eventdata, handles)
% hObject    handle to btugGEO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of btugGEO as text
%        str2double(get(hObject,'String')) returns contents of btugGEO as a double
global pathGlobal;
global fgeo;
[file,path] = uigetfile({'*.dat','Archivo Geosoft (*.dat)'},'Seleccione el archivo destino',pathGlobal);
if isequal(file,0)
else
    pathGlobal = path;
    fgeo = [path,file];
    set(handles.txugGEO,'String',fgeo);
end


% --- Executes during object creation, after setting all properties.
function btugGEO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btugGEO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btugUBC.
function btugUBC_Callback(hObject, eventdata, handles)
% hObject    handle to btugUBC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathGlobal;
global fubc;
[file,path] = uigetfile({'*.res;*.car', 'Archivos UBC (*.res, *.car)'},'Seleccione el archivo destino',pathGlobal);
if isequal(file,0)
else
    pathGlobal = path;
    fubc = [path,file];
    set(handles.txugUBC,'String',fubc);
end



% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

global fubc;
global fgeo;
global aceptar;
fubc = 'Archivo UBC';
fgeo = 'Archivo GEOSOFT';



% --- Executes on button press in btAceptar.
function btAceptar_Callback(hObject, eventdata, handles)
% hObject    handle to btAceptar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fubc;
global fgeo;
varout = {};
varout{1} = fubc;
varout{2} = fgeo;
handles.output = varout;

% Update handles structure
guidata(hObject, handles);

% Use UIRESUME instead of delete because the OutputFcn needs
% to get the updated handles structure.
uiresume(handles.figure1);



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over btAceptar.
function btAceptar_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to btAceptar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





function txugGEO_Callback(hObject, eventdata, handles)
% hObject    handle to txugGEO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txugGEO as text
%        str2double(get(hObject,'String')) returns contents of txugGEO as a double


% --- Executes during object creation, after setting all properties.
function txugGEO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txugGEO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
if isequal(get(handles.figure1, 'waitstatus'), 'waiting')
    % The GUI is still in UIWAIT, us UIRESUME
    uiresume(handles.figure1);
else
    % The GUI is no longer waiting, just close it
    delete(handles.figure1);
end


