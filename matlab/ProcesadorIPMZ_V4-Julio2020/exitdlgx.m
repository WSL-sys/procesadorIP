function varargout = exitdlgx(varargin)
% EXITDLGX MATLAB code for exitdlgx.fig
%      EXITDLGX, by itself, creates a new EXITDLGX or raises the existing
%      singleton*.
%
%      H = EXITDLGX returns the handle to a new EXITDLGX or the handle to
%      the existing singleton*.
%
%      EXITDLGX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXITDLGX.M with the given input arguments.
%
%      EXITDLGX('Property','Value',...) creates a new EXITDLGX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exitdlgx_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exitdlgx_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exitdlgx

% Last Modified by GUIDE v2.5 20-Jul-2018 14:18:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exitdlgx_OpeningFcn, ...
                   'gui_OutputFcn',  @exitdlgx_OutputFcn, ...
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


% --- Executes just before exitdlgx is made visible.
function exitdlgx_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exitdlgx (see VARARGIN)

% Choose default command line output for exitdlgx
handles.output = hObject;
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:Javaframe');
JF=get(hObject,'JavaFrame');%%%,'JavaFrame');
javax.swing.ImageIcon('myicon.png');
JF.setFigureIcon(javax.swing.ImageIcon('myicon.png'));

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes exitdlgx wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = exitdlgx_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%get(handles.pushbutton1,'Value')
varargout{1} = get(handles.figure1,'UserData');%handles.output;
delete(handles.figure1);

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(~, ~, ~)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(~, ~, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.figure1,'UserData',0);
uiresume(handles.figure1);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(~, ~, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.figure1,'UserData',1);
uiresume(handles.figure1);
