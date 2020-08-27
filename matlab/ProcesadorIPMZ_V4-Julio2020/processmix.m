function varargout = processmix(varargin)
% PROCESSMIX MATLAB code for processmix.fig
%      PROCESSMIX, by itself, creates a new PROCESSMIX or raises the existing
%      singleton*.
%
%      H = PROCESSMIX returns the handle to a new PROCESSMIX or the handle to
%      the existing singleton*.
%
%      PROCESSMIX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROCESSMIX.M with the given input arguments.
%
%      PROCESSMIX('Property','Value',...) creates a new PROCESSMIX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before processmix_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to processmix_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help processmix

% Last Modified by GUIDE v2.5 06-Jul-2018 10:10:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @processmix_OpeningFcn, ...
                   'gui_OutputFcn',  @processmix_OutputFcn, ...
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


% --- Executes just before processmix is made visible.
function processmix_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to processmix (see VARARGIN)

% Choose default command line output for processmix
handles.output = hObject;
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:Javaframe');
JF=get(hObject,'JavaFrame');%%%,'JavaFrame');
javax.swing.ImageIcon('myicon.png')
JF.setFigureIcon(javax.swing.ImageIcon('myicon.png'));

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes processmix wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = processmix_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=get(handles.listbox1,'Value');
strlst=get(handles.listbox1,'String');
for i = 1:(n-1)
    strlst2{i}=strlst{i};
end
for i = n:(length(strlst)-1)
    strlst2{i}=strlst{i+1};
end
set(handles.listbox1,'Value',min(n,length(strlst2)),'String',strlst2);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globaldir;
[fileout path] = uiputfile([globaldir '\*.pro']);
globaldir = path;
fileout=[path fileout];
fidout=fopen(fileout,'wt');
n=0;
ind=1;
files = get(handles.listbox1,'String');
if ischar(files)
    cp 
else 
    for i = 1:length(files)
        fid=fopen(files{i},'rt');
        str=fgetl(fid);
        datos=strread(str,'%s','delimiter',';');
        n=str2num(datos{2})+n;
        str=fgetl(fid);
        while ischar(str)
            strtmp=sprintf('%s\n',str);
            strfidout{ind}=strtmp;
            str=fgetl(fid);
            ind=ind+1;
        end
    end
    
    fprintf(fidout,'%s\n',[fileout ';' num2str(n)]);
    for i = 1:length(strfidout)
        fprintf(fidout,'%s',strfidout{i});
    end
    fclose(fidout);
    
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globaldir;
[file,path]=uigetfile([globaldir '\*.pro'],'MultiSelect','on');
globaldir = path;

if ischar(file)
    n=get(handles.listbox1,'Value')
    lststr = get(handles.listbox1,'String');
    for i = length(lststr):-1:n
        lststr{i+1}=lststr{i}; 
    end
    lststr{n}=[path file];
    set(handles.listbox1,'String',lststr);
else
    n=get(handles.listbox1,'Value');
    lststr = get(handles.listbox1,'String');
    m = length(file);
    for i = length(lststr):-1:n 
        lststr{i+m}=lststr{i}; 
    end
    for i = 1:m
        lststr{n+i-1}=[path file{i}];    
    end
    set(handles.listbox1,'String',lststr);
end
