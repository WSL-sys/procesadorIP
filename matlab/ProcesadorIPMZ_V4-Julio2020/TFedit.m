function varargout = TFedit(varargin)
% TFEDIT MATLAB code for TFedit.fig
%      TFEDIT, by itself, creates a new TFEDIT or raises the existing
%      singleton*.
%
%      H = TFEDIT returns the handle to a new TFEDIT or the handle to
%      the existing singleton*.
%
%      TFEDIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TFEDIT.M with the given input arguments.
%
%      TFEDIT('Property','Value',...) creates a new TFEDIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TFedit_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TFedit_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TFedit

% Last Modified by GUIDE v2.5 10-Aug-2018 18:44:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TFedit_OpeningFcn, ...
                   'gui_OutputFcn',  @TFedit_OutputFcn, ...
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

% --- Executes just before TFedit is made visible.
function TFedit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TFedit (see VARARGIN)

% Choose default command line output for TFedit
handles.output = hObject;
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:Javaframe');
JF=get(hObject,'JavaFrame');%%%,'JavaFrame');
javax.swing.ImageIcon('myicon.png')
JF.setFigureIcon(javax.swing.ImageIcon('myicon.png'));

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TFedit wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global gdir;
gdir=pwd;


% --- Outputs from this function are returned to the command line.
function varargout = TFedit_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over axes background.
function axes2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loc=ginput(handles.axes2);
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Hedit;
global Heditlsq;
global TF;
global RTSN;
global HTSN;
Nm=Hedit.Nm;
N=length(Hedit.fHxx);
fHxx=Hedit.fHxx;
fHxy=Hedit.fHxy;
fHyx=Hedit.fHyx;
fHyy=Hedit.fHyy;

if(get(handles.checklsq,'Value'))
    fHxx=Heditlsq.fHxx;
    fHxy=Heditlsq.fHxy;
    fHyx=Heditlsq.fHyx;
    fHyy=Heditlsq.fHyy;
end

if mod(N,2)==0
    fHxx(Nm+2:end)=(conj(fHxx(Nm:-1:2)));
    fHxy(Nm+2:end)=(conj(fHxy(Nm:-1:2)));
    fHyx(Nm+2:end)=(conj(fHyx(Nm:-1:2)));
    fHyy(Nm+2:end)=(conj(fHyy(Nm:-1:2)));
else
    fHxx(Nm+2:end)=(conj(fHxx(Nm+1:-1:2)));
    fHxy(Nm+2:end)=(conj(fHxy(Nm+1:-1:2)));
    fHyx(Nm+2:end)=(conj(fHyx(Nm+1:-1:2)));
    fHyy(Nm+2:end)=(conj(fHyy(Nm+1:-1:2)));
end
TF.Hxx=fftshift(real(ifft(fHxx)));
TF.Hxy=fftshift(real(ifft(fHxy)));
TF.Hyx=fftshift(real(ifft(fHyx)));
TF.Hyy=fftshift(real(ifft(fHyy)));

TF.frecuencia=Hedit.frecuencia;
TF.Nm=Hedit.Nm;
TF.gain=str2num(get(handles.strgain,'String'));
nhx=str2num(get(handles.strNHx,'String'));
nhy=str2num(get(handles.strNHy,'String'));
nex=str2num(get(handles.strNEx,'String'));
ney=str2num(get(handles.strNEy,'String'));
Hx=[zeros(0,1); HTSN(:,nhx)];
Hy=[zeros(0,1); HTSN(:,nhy)];
RTSN=[];
RTSN(:,1)=(filter(TF.Hxx,1,Hx-mean(Hx))+filter(TF.Hxy,1,Hy-mean(Hy)));
RTSN(:,2)=(filter(TF.Hyx,1,Hx-mean(Hx))+filter(TF.Hyy,1,Hy-mean(Hy)));
%RTSN=filter([1 1 1]/3,1,RTSN(Nm+1:end,:));
RTSN=[RTSN((Nm+2):end,:); zeros(Nm,length(RTSN(1,:)))];
length(RTSN)
length(Hx)

TFplotTSN(handles);

% global Hedit;
% global Heditlsq;
% global TF;
% global RTSN;
% global HTSN;
% Nm=Hedit.Nm;
% N=length(Hedit.fHxx);
% fHxx=Hedit.fHxx;
% fHxy=Hedit.fHxy;
% fHyx=Hedit.fHyx;
% fHyy=Hedit.fHyy;
% 
% if(get(handles.checklsq,'Value'))
% fHxx=Heditlsq.fHxx;
% fHxy=Heditlsq.fHxy;
% fHyx=Heditlsq.fHyx;
% fHyy=Heditlsq.fHyy;
% end
% 
% if mod(N,2)==0
%    fHxx(Nm+2:end)=(conj(fHxx(Nm:-1:2)));
%    fHxy(Nm+2:end)=(conj(fHxy(Nm:-1:2)));
%    fHyx(Nm+2:end)=(conj(fHyx(Nm:-1:2)));
%    fHyy(Nm+2:end)=(conj(fHyy(Nm:-1:2)));
% else
%    fHxx(Nm+2:end)=(conj(fHxx(Nm+1:-1:2)));
%    fHxy(Nm+2:end)=(conj(fHxy(Nm+1:-1:2)));
%    fHyx(Nm+2:end)=(conj(fHyx(Nm+1:-1:2)));
%    fHyy(Nm+2:end)=(conj(fHyy(Nm+1:-1:2)));
% end
% TF.Hxx=fftshift(real(ifft(fHxx)));
% TF.Hxy=fftshift(real(ifft(fHxy)));
% TF.Hyx=fftshift(real(ifft(fHyx)));
% TF.Hyy=fftshift(real(ifft(fHyy)));
% 
% TF.frecuencia=Hedit.frecuencia;
% TF.Nm=Hedit.Nm;
% TF.gain=str2num(get(handles.strgain,'String'));
% Hx=HTSN(:,nhx);
% Hy=HTSN(:,nhy);
% RTSN=[];
% RTSN(:,1)=(filter(TF.Hxx,1,Hx-mean(Hx))+filter(TF.Hxy,1,Hy-mean(Hy)));
% RTSN(:,2)=(filter(TF.Hyx,1,Hx-mean(Hx))+filter(TF.Hyy,1,Hy-mean(Hy)));
% RTSN=filter([1 1 1]/3,1,RTSN(Nm+1:end,:));

% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pos=get(handles.axes1,'CurrentPoint');


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function strpoints_Callback(hObject, eventdata, handles)
% hObject    handle to strpoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strpoints as text
%        str2double(get(hObject,'String')) returns contents of strpoints as a double


% --- Executes during object creation, after setting all properties.
function strpoints_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strpoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in editaxes2.
function editaxes2_Callback(hObject, eventdata, handles)
% hObject    handle to editaxes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loc=ginput();
global Hedit;
TF=Hedit;
F=TF.frecuencia;
str=get(handles.popupmenu1,'String');
n=get(handles.popupmenu1,'Value');
opt=str{n};
switch opt
    case 'Hxy'
        arr=TF.fHxy;
    case 'Hyx'
        arr=TF.fHyx;
    case 'Hyy'
        arr=TF.fHyy;
    case 'Hxx'
        arr=TF.fHxx;
end        
absH=abs(arr);
phsH=angle(arr)*180/pi;

for i = 1:(length(loc(:,1))-1)
[a,nini]=min(abs(F-loc(i,1)));
[a,nfin]=min(abs(F-loc(i+1,1)));
phsH(nini:nfin)=(loc(i,2)-loc(i+1,2))/ ...
    (log10(loc(i,1))-log10(loc(i+1,1)))* ...
    (log10(F(nini:nfin))-log10(F(nini))) + ...
    loc(i,2);
end
arr=absH.*exp(phsH/180*pi*(-1)^0.5);
switch opt
    case 'Hxy'
        TF.fHxy=arr;
    case 'Hyx'
        TF.fHyx=arr;
    case 'Hyy'
        TF.fHyy=arr;
    case 'Hxx'
        TF.fHxx=arr;
end        
Hedit=TF;
plotTF(handles,opt);
% --- Executes on button press in editaxes1.
function editaxes1_Callback(hObject, eventdata, handles)
% hObject    handle to editaxes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loc=ginput();
global Hedit;
TF=Hedit;
F=TF.frecuencia;
str=get(handles.popupmenu1,'String');
n=get(handles.popupmenu1,'Value');
opt=str{n};
switch opt
    case 'Hxy'
        arr=TF.fHxy;
    case 'Hyx'
        arr=TF.fHyx;
    case 'Hyy'
        arr=TF.fHyy;
    case 'Hxx'
        arr=TF.fHxx;
end        
absH=abs(arr);
phsH=angle(arr)*180/pi;
for i = 1:(length(loc(:,1))-1)
    [a,nini]=min(abs(F-loc(i,1)));
    [a,nfin]=min(abs(F-loc(i+1,1)));
    absH(nini:nfin)=10.^((log10(loc(i,2))-log10(loc(i+1,2)))/ ...
    (log10(loc(i,1))-log10(loc(i+1,1)))* ...
    (log10(F(nini:nfin))-log10(F(nini))) + ...
    log10(loc(i,2)));
end
arr=absH.*exp(phsH/180*pi*(-1)^0.5);
switch opt
    case 'Hxy'
        TF.fHxy=arr;
    case 'Hyx'
        TF.fHyx=arr;
    case 'Hyy'
        TF.fHyy=arr;
    case 'Hxx'
        TF.fHxx=arr;
end        
Hedit=TF;
plotTF(handles,opt);



function plotTF(handles,opt)
global Hori;
global Hedit;
global Heditlsq;

%Hori
hold(handles.axes1,'off');
hold(handles.axes2,'off');

TF=Hori;
switch opt
    case 'Hxy'
        fHxy=TF.fHxy;
    case 'Hyx'
        fHxy=TF.fHyx;
    case 'Hyy'
        fHxy=TF.fHyy;
    case 'Hxx'
        fHxy=TF.fHxx;
end        
F=TF.frecuencia;
Nm=TF.Nm;
F(2:Nm)
%fHxy
gain=str2num(get(handles.strgain,'String'));
loglog(handles.axes1,F(2:Nm),abs(fHxy(2:Nm)),'b');
semilogx(handles.axes2,F(2:Nm),180/pi*angle(fHxy(2:Nm)),'b');
Ndiv=str2num(get(handles.strpoints,'String'));
minF=F(2);
maxF=F(Nm);
Fm=logspace(log10(minF),log10(maxF),Ndiv);
nn(Ndiv)=0;
for i = 1:Ndiv
    [a,b]=min(abs(F(1:Nm)-Fm(i)));
    nn(i)=b;
end
X=F(nn);
Y=fHxy(nn);
hold(handles.axes1,'on');
gain=str2num(get(handles.strgain,'String'));
plot(handles.axes1,X,abs(Y)*gain,'or'); 
hold(handles.axes2,'on');
plot(handles.axes2,X,180/pi*angle(Y),'or'); 
%
TF=Heditlsq;
if ~isempty(TF)
switch opt
    case 'Hxy'
        fHxy=TF.fHxy;
    case 'Hyx'
        fHxy=TF.fHyx;
    case 'Hyy'
        fHxy=TF.fHyy;
    case 'Hxx'
        fHxy=TF.fHxx;
end        
F=TF.frecuencia;
%Nm=TF.Nm;
loglog(handles.axes1,F(2:end),abs(fHxy(2:end)),'g');
semilogx(handles.axes2,F(2:end),180/pi*angle(fHxy(2:end)),'g');
end



%Hedit
TF=Hedit;
switch opt
    case 'Hxy'
        fHxy=TF.fHxy;
    case 'Hyx'
        fHxy=TF.fHyx;
    case 'Hyy'
        fHxy=TF.fHyy;
    case 'Hxx'
        fHxy=TF.fHxx;
end        
Nm=TF.Nm;
F=TF.frecuencia;
gain=str2num(get(handles.strgain,'String'));
loglog(handles.axes1,F(2:Nm),abs(fHxy(2:Nm))*gain,'k');
semilogx(handles.axes2,F(2:Nm),180/pi*angle(fHxy(2:Nm)),'k');
Ndiv=str2num(get(handles.strpoints,'String'));
minF=F(2);
maxF=F(Nm);

hold(handles.axes1,'off');
hold(handles.axes2,'off');

%Fm=logspace(log10(minF),log10(maxF),Ndiv);
%nn(Ndiv)=0;
%for i = 1:Ndiv
%    [a,b]=min(abs(F(1:Nm)-Fm(i)));
%    nn(i)=b;
%end
%X=F(nn);
%Y=fHxy(nn);
%hold(handles.axes1,'on');
%plot(handles.axes1,X,abs(Y),'or'); 
%hold(handles.axes2,'on');
%plot(handles.axes2,X,180/pi*angle(Y),'or'); 


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
str=get(handles.popupmenu1,'String');
n=get(handles.popupmenu1,'Value');
plotTF(handles,str{n});

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


% --- Executes during object deletion, before destroying properties.
function editaxes2_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to editaxes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function strgain_Callback(hObject, eventdata, handles)
% hObject    handle to strgain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strgain as text
%        str2double(get(hObject,'String')) returns contents of strgain as a double


% --- Executes during object creation, after setting all properties.
function strgain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strgain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edifile_Callback(hObject, eventdata, handles)
% hObject    handle to edifile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edifile as text
%        str2double(get(hObject,'String')) returns contents of edifile as a double


% --- Executes during object creation, after setting all properties.
function edifile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edifile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user dfata (see GUIDATA)
global gdir;
[file,gdir]=uigetfile([gdir '*.edi']);
file=[gdir file];
set(handles.edifile,'String',file);

if strcmp(file((end-2):end),'edi')
    global TF;
    [MTZ]=read_EDI(file);
    L=str2num(get(handles.edit22,'String'))
    Fm=str2num(get(handles.strFm,'String'))
    Hxcal=get(handles.calHxfile,'String');
    Hycal=get(handles.calHyfile,'String');
    if isempty(Hxcal)
     Hxcal=[pwd '\BMT53663.txt'];
     set(handles.calHxfile,'String',Hxcal);
    end
    if isempty(Hycal)
     Hycal=[pwd '\BMT53663.txt'];
     set(handles.calHyfile,'String',Hycal);
    end
    TF=calc_H(MTZ,L,Fm,Hxcal,Hycal);

else
    load(file);
end

%TF=varargin{1};
fHxx=fft(fftshift(TF.Hxx));
fHxy=fft(fftshift(TF.Hxy));
fHyx=fft(fftshift(TF.Hyx));
fHyy=fft(fftshift(TF.Hyy));
N=length(fHyy);
if(mod(N,2)==0)
    Nm=N/2;
else
    Nm=(N-1)/2;
end
global Hori
global Hedit
Hori=[];
Hedit=[];
Hori.frecuencia=TF.frecuencia;
Hori.Nm=Nm;
Hori.fHyx=fHyx;
Hori.fHxy=fHxy;
Hori.fHyy=fHyy;
Hori.fHxx=fHxx;
Hedit=Hori;
str=get(handles.popupmenu1,'String');
n=get(handles.popupmenu1,'Value');
plotTF(handles,str{n});

if mod(N,2)==0
    fHxx(Nm+2:end)=(conj(fHxx(Nm:-1:2)));
    fHxy(Nm+2:end)=(conj(fHxy(Nm:-1:2)));
    fHyx(Nm+2:end)=(conj(fHyx(Nm:-1:2)));
    fHyy(Nm+2:end)=(conj(fHyy(Nm:-1:2)));
else
    fHxx(Nm+2:end)=(conj(fHxx(Nm+1:-1:2)));
    fHxy(Nm+2:end)=(conj(fHxy(Nm+1:-1:2)));
    fHyx(Nm+2:end)=(conj(fHyx(Nm+1:-1:2)));
    fHyy(Nm+2:end)=(conj(fHyy(Nm+1:-1:2)));
end
TF.Hxx=fftshift(real(ifft(fHxx)));
TF.Hxy=fftshift(real(ifft(fHxy)));
TF.Hyx=fftshift(real(ifft(fHyx)));
TF.Hyy=fftshift(real(ifft(fHyy)));

TF.frecuencia=Hedit.frecuencia;
TF.Nm=Hedit.Nm;
TF.gain=str2num(get(handles.strgain,'String'));



function calHxfile_Callback(hObject, eventdata, handles)
% hObject    handle to calHxfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of calHxfile as text
%        str2double(get(hObject,'String')) returns contents of calHxfile as a double


% --- Executes during object creation, after setting all properties.
function calHxfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to calHxfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gdir
[calfile,gdir]=uigetfile([gdir '*.txt']);
calfile=[gdir calfile];
set(handles.calHxfile,'String',calfile);


function calHyfile_Callback(hObject, eventdata, handles)
% hObject    handle to calHyfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of calHyfile as text
%        str2double(get(hObject,'String')) returns contents of calHyfile as a double


% --- Executes during object creation, after setting all properties.
function calHyfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to calHyfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with ha[calfile,path]=uigetfile('*.txt');
global gdir;
[calfile,gdir]=uigetfile([gdir '*.txt']);
calfile=[gdir calfile];
set(handles.calHxfile,'String',calfile);



function ETSNfile_Callback(hObject, eventdata, handles)
% hObject    handle to ETSNfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ETSNfile as text
%        str2double(get(hObject,'String')) returns contents of ETSNfile as a double


% --- Executes during object creation, after setting all properties.
function ETSNfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ETSNfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gdir;
[tsnfile,gdir]=uigetfile([gdir '*.TS4']);
tsnfile=[gdir tsnfile];
set(handles.ETSNfile,'String',tsnfile);

function HxTSNfile_Callback(hObject, eventdata, handles)
% hObject    handle to HxTSNfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HxTSNfile as text
%        str2double(get(hObject,'String')) returns contents of HxTSNfile as a double


% --- Executes during object creation, after setting all properties.
function HxTSNfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HxTSNfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10x.
function butGuardar_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global gdir
%[tsnfile,gdir]=uigetfile([gdir '*.TS4']);
%tsnfile=[gdir tsnfile];
%set(handles.HxTSNfile,'String',tsnfile);
global TF;
global gdir;
[matfile,gdir]=uiputfile([gdir '*.mat']);
matfile=[gdir matfile];
save(matfile,'TF');


function strtfin_Callback(hObject, eventdata, handles)
% hObject    handle to strtfin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strtfin as text
%        str2double(get(hObject,'String')) returns contents of strtfin as a double


% --- Executes during object creation, after setting all properties.
function strtfin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strtfin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function strtini_Callback(hObject, eventdata, handles)
% hObject    handle to strtini (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strtini as text
%        str2double(get(hObject,'String')) returns contents of strtini as a double


% --- Executes during object creation, after setting all properties.
function strtini_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strtini (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton10x.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gdir;
[tsnfile,gdir]=uigetfile([gdir '*.TS4']);
tsnfile=[gdir tsnfile];
set(handles.HxTSNfile,'String',tsnfile);
% global ETSN;
% global HTSN;
% X=TSNfiles;
% Y=TSNfiles;
% Fm=str2num(get(handles.strFm,'String'));
% nini=round(str2num(get(handles.strtini,'String'))*Fm);
% nfin=round(str2num(get(handles.strtfin,'String'))*Fm);
% X=open_TSN_All_page(X,get(handles.ETSNfile,'String'));
% Y=open_TSN_All_page(Y,get(handles.HxTSNfile,'String'));
% Fm
% nini 
% nfin
% X=read_TSN_All_page(X,nini,nfin);
% Y=read_TSN_All_page(Y,nini,nfin);
% ETSN=X;
% HTSN=Y;
% TFplotTSN(handles);

% --- Executes on button press in pushbutton10x.
function pushbutton10x_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global gdir;
%[tsnfile,gdir]=uigetfile([gdir '*.TS4']);
%tsnfile=[gdir tsnfile];
%set(handles.HxTSNfile,'String',tsnfile);
global ETSN;
global HTSN;
X=TSNfiles;
Y=TSNfiles;
Fm=str2num(get(handles.strFm,'String'));
nini=round(str2num(get(handles.strtini,'String'))*Fm);
nfin=round(str2num(get(handles.strtfin,'String'))*Fm);
X=open_TSN_All_page(X,get(handles.ETSNfile,'String'));
Y=open_TSN_All_page(Y,get(handles.HxTSNfile,'String'));
%Fm
%nini 
%nfin
X=read_TSN_All_page(X,nini,nfin);
Y=read_TSN_All_page(Y,nini,nfin);
ETSN=X;
HTSN=Y;
TFplotTSN(handles);


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function strNEx_Callback(hObject, eventdata, handles)
% hObject    handle to strNEx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strNEx as text
%        str2double(get(hObject,'String')) returns contents of strNEx as a double


% --- Executes during object creation, after setting all properties.
function strNEx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strNEx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function strNEy_Callback(hObject, eventdata, handles)
% hObject    handle to strNEy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strNEy as text
%        str2double(get(hObject,'String')) returns contents of strNEy as a double


% --- Executes during object creation, after setting all properties.
function strNEy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strNEy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function strNHx_Callback(hObject, eventdata, handles)
% hObject    handle to strNHx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strNHx as text
%        str2double(get(hObject,'String')) returns contents of strNHx as a double


% --- Executes during object creation, after setting all properties.
function strNHx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strNHx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function strNHy_Callback(hObject, eventdata, handles)
% hObject    handle to strNHy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strNHy as text
%        str2double(get(hObject,'String')) returns contents of strNHy as a double


% --- Executes during object creation, after setting all properties.
function strNHy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strNHy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function strFm_Callback(hObject, eventdata, handles)
% hObject    handle to strFm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strFm as text
%        str2double(get(hObject,'String')) returns contents of strFm as a double


% --- Executes during object creation, after setting all properties.
function strFm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strFm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function [E,H]=TFplotTSN(handles)

global ETSN;
global HTSN;
global RTSN;

n = get(handles.strsignal1,'Value');
types1 = get(handles.strsignal1,'String');
types1=types1{n};
enx=str2num(get(handles.strNEx,'String'));
eny=str2num(get(handles.strNEy,'String'));
hnx=str2num(get(handles.strNHx,'String'));
hny=str2num(get(handles.strNHy,'String'));
datosx=ETSN;
datosy=HTSN;

for i =1:length(datosx(1,:))
    datosx(:,i)=datosx(:,i)-mean(datosx(:,i));
end
for i =1:length(datosy(1,:))
    datosy(:,i)=datosy(:,i)-mean(datosy(:,i));
end

if ~isempty(RTSN)
    datosr=RTSN;
else
    datosr=datosx;
end
hold(handles.axes3,'off');
switch types1
    case 'Ex'
      %plot(handles.axes3,datosx(:,enx));
      E=datosx(:,enx);
    case 'Ey'
      %plot(handles.axes3,datosx(:,eny));
      E=datosx(:,eny);
    case 'Hx'
      %plot(handles.axes3,datosy(:,hnx));
      E=datosy(:,hnx);
    case 'Hy'
      %plot(handles.axes3,datosy(:,hny));
      E=datosy(:,hny);
    case 'Rx'
      %plot(handles.axes3,datosr(:,1)*str2num(get(handles.strgain,'String')));
      E=datosr(:,1)*str2num(get(handles.strgain,'String'));
    case 'Ry'
      %plot(handles.axes3,datosr(:,2)*str2num(get(handles.strgain,'String')));
      E=datosr(:,2)*str2num(get(handles.strgain,'String'));
end
hold(handles.axes3,'on');
n = get(handles.strsignal2,'Value');
types2 = get(handles.strsignal2,'String');
types2=types2{n};
gain=str2num(get(handles.strgain,'String'));
switch types2
    case 'Ex'
      %plot(handles.axes3,datosx(:,enx));
      H=datosx(:,enx);
    case 'Ey'
      %plot(handles.axes3,datosx(:,eny));
      H=datosx(:,eny);
    case 'Hx'
      %plot(handles.axes3,datosy(:,hnx));
      H=datosx(:,hnx);
    case 'Hy'
      %plot(handles.axes3,datosy(:,hny));
      H=datosx(:,hny);
    case 'Rx'
      %plot(handles.axes3,datosr(:,1)*gain);
      H=datosr(:,1)*str2num(get(handles.strgain,'String'));
    case 'Ry'
      %plot(handles.axes3,datosr(:,2)*gain);
      H=datosr(:,2)*str2num(get(handles.strgain,'String'));
end



if(get(handles.chk50Hz,'Value'))
    '50Hz'
    length(E)
    length(H)
    E=filter([1 1 1]/3,1,E);
    H=filter([1 1 1]/3,1,H);
end

if(get(handles.chk60Hz,'Value'))
    '60Hz'
    E=filter([1 1 1 1 1]/5,1,E);
    H=filter([1 1 1 1 1]/5,1,H);    
end

hold(handles.axes3,'off');
plot(handles.axes3,E);
hold(handles.axes3,'on');
plot(handles.axes3,H);
hold(handles.axes3,'off');


minplt=str2num(get(handles.strpltmin,'String'));
maxplt=str2num(get(handles.strpltmax,'String'));
Fm=str2num(get(handles.strFm,'String'));
if isempty(minplt)
    a=xlim(handles.axes3);
    minplt=a(1);
    set(handles.strpltmin,'String',num2str(minplt));
end
if isempty(maxplt)
    a=xlim(handles.axes3);
    maxplt=a(2);
    set(handles.strpltmax,'String',num2str(maxplt));
end
%get(handles.checkfft,'Value')

if(get(handles.checkfft,'Value'))
    E=abs(fft(E));
    LE=length(E);
    H=abs(fft(H)*gain);
    LH=length(H);
    hold(handles.axes3,'off');
    plot(handles.axes3,(0:LE-1)/LE*Fm,E);
    hold(handles.axes3,'on');    
    plot(handles.axes3,(0:LH-1)/LH*Fm,H);
    hold(handles.axes3,'off');    
end

if(get(handles.checkdiff,'Value'))
    hold(handles.axes3,'on');
    N=min(length(E),length(H));
    plot(handles.axes3,E(1:N)-H(1:N),'k');
    hold(handles.axes3,'off');    
end

minplt=max([1 minplt]);
maxplt=min([length(E) maxplt]);
E=E(minplt:maxplt);
H=H(minplt:maxplt);

set(handles.axes3,'xlim',[minplt maxplt]);

if(get(handles.checkfft,'Value'))
    E=180/pi*angle(fft(E));
    LE=length(E);
    H=180/pi*angle(fft(H));
    LH=length(H);
    hold(handles.axes3,'off');
    plot(handles.axes3,(0:LE-1)/LE*Fm,E);
    hold(handles.axes3,'on');    
    plot(handles.axes3,(0:LH-1)/LH*Fm,H*sign(gain));
    hold(handles.axes3,'off');    
end


% --- Executes on selection change in strsignal1.
function strsignal1_Callback(hObject, eventdata, handles)
% hObject    handle to strsignal1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns strsignal1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from strsignal1


% --- Executes during object creation, after setting all properties.
function strsignal1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strsignal1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TFplotTSN(handles);

% --- Executes on selection change in strsignal2.
function strsignal2_Callback(hObject, eventdata, handles)
% hObject    handle to strsignal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns strsignal2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from strsignal2


% --- Executes during object creation, after setting all properties.
function strsignal2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strsignal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function strpltmin_Callback(hObject, eventdata, handles)
% hObject    handle to strpltmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strpltmin as text
%        str2double(get(hObject,'String')) returns contents of strpltmin as a double
TFplotTSN(handles);


% --- Executes during object creation, after setting all properties.
function strpltmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strpltmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function strpltmax_Callback(hObject, eventdata, handles)
% hObject    handle to strpltmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strpltmax as text
%        str2double(get(hObject,'String')) returns contents of strpltmax as a double
TFplotTSN(handles);


% --- Executes during object creation, after setting all properties.
function strpltmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strpltmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uitoggletool7_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    a=xlim(handles.axes3);
    minplt=a(1);
    set(handles.strpltmin,'String',num2str(minplt));
    maxplt=a(2);
    set(handles.strpltmax,'String',num2str(maxplt));


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[E,R]=TFplotTSN(handles);
fftE=(E);
fftR=(R);

Z = dot(fftR(end-1),fftE(end-1))/dot(fftR(end-1),fftR(end-1));
Z
gain = abs(Z);
phs = angle(Z);
phs
set(handles.strgain,'String',num2str(gain));
set(handles.strphase,'String',num2str(phs));


% --- Executes on button press in checkdiff.
function checkdiff_Callback(hObject, eventdata, handles)
% hObject    handle to checkdiff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkdiff



function strphase_Callback(hObject, eventdata, handles)
% hObject    handle to strphase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of strphase as text
%        str2double(get(hObject,'String')) returns contents of strphase as a double


% --- Executes during object creation, after setting all properties.
function strphase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strphase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkfft.
function checkfft_Callback(hObject, eventdata, handles)
% hObject    handle to checkfft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkfft


% --- Executes on button press in checkfft.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkfft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkfft


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global HTSN
global ETSN
f1=0.01;
f2=0.1;
f3=30;
f4=35;
nhx=str2num(get(handles.strNHx,'String'));
nhy=str2num(get(handles.strNHy,'String'));
nex=str2num(get(handles.strNEx,'String'));
ney=str2num(get(handles.strNEy,'String'));
NN=str2num(get(handles.edit22,'String'));
fm=str2num(get(handles.strFm,'String'));
HTSNxf=pasa_bandaxx(HTSN(:,nhx),fm,f1,f2,f3,f4,0,1,1,0);
HTSNyf=pasa_bandaxx(HTSN(:,nhy),fm,f1,f2,f3,f4,0,1,1,0);
ETSNxf=pasa_bandaxx(ETSN(:,nex),fm,f1,f2,f3,f4,0,1,1,0);
ETSNyf=pasa_bandaxx(ETSN(:,ney),fm,f1,f2,f3,f4,0,1,1,0);
[Zx,Ec]=calcZ(HTSNxf(:,1),HTSNyf(:,1),ETSNxf(:,1),NN);
[Zy,Ec]=calcZ(HTSNxf(:,1),HTSNyf(:,1),ETSNyf(:,1),NN);
str=get(handles.popupmenu1,'String');
str=str{get(handles.popupmenu1,'Value')};
F=(0:(length(Zx)-1))/length(Zx)*fm;
switch str
    case 'Hxx'
        hold(handles.axes1,'off');
        loglog(handles.axes1,F,abs(Zx(:,1)));
        semilogy(handles.axes1,F,abs(Zx(:,1)));
        hold(handles.axes1,'off');
        hold(handles.axes2,'off');
        semilogx(handles.axes2,F,180/pi*angle(Zx(:,1)));
        plot(handles.axes2,F,180/pi*angle(Zx(:,1)));
        hold(handles.axes2,'off');
    case 'Hxy'
        hold(handles.axes1,'off');
        loglog(handles.axes1,F,abs(Zx(:,2)));
        semilogy(handles.axes1,F,abs(Zx(:,2)));
        hold(handles.axes1,'off');
        hold(handles.axes2,'off');
        semilogx(handles.axes2,F,180/pi*angle(Zx(:,2)));
        plot(handles.axes2,F,180/pi*angle(Zx(:,2)));
        hold(handles.axes2,'off');
    case 'Hyx'
        hold(handles.axes1,'off');
        loglog(handles.axes1,F,abs(Zy(:,1)));
        semilogy(handles.axes1,F,abs(Zy(:,1)));
        hold(handles.axes1,'off');
        hold(handles.axes2,'off');
        semilogx(handles.axes2,F,180/pi*angle(Zy(:,1)));
        plot(handles.axes2,F,180/pi*angle(Zy(:,1)));
        hold(handles.axes2,'off');
    case 'Hyy'
        hold(handles.axes1,'off');
        loglog(handles.axes1,F,abs(Zy(:,2)));
        semilogy(handles.axes1,F,abs(Zy(:,2)));        
        hold(handles.axes1,'off');
        hold(handles.axes2,'off');
        semilogx(handles.axes2,F,180/pi*angle(Zy(:,2)));
        plot(handles.axes2,F,180/pi*angle(Zy(:,2)));
        hold(handles.axes2,'off');
end
global Heditlsq
Heditlsq.fHxx=Zx(:,1);
Heditlsq.fHxy=Zx(:,2);
Heditlsq.fHyx=Zy(:,1);
Heditlsq.fHyy=Zy(:,2);
Heditlsq.fHxx(1)=0;
Heditlsq.fHxy(1)=0;
Heditlsq.fHyx(1)=0;
Heditlsq.fHyy(1)=0;
Heditlsq.frecuencia=F;
% --- Executes on button press in checklsq.
function checklsq_Callback(hObject, eventdata, handles)
% hObject    handle to checklsq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checklsq


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file1=get(handles.ETSNfile,'String');
file2=get(handles.HxTSNfile,'String');
n=strfind(file1,'\');
dir1=file1(1:n(end));
sincronizarTSN(file1,file2,dir1);

function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in butGuardar.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to butGuardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Hedit;
global gdir;
[file,path]=uiputfile([gdir '*.mat']);
file=[path file];
TF=Hedit;
TF.Hxx=fftshift(ifft(TF.fHxx));
TF.Hyx=fftshift(ifft(TF.fHyx));
TF.Hxy=fftshift(ifft(TF.fHxy));
TF.Hyy=fftshift(ifft(TF.fHyy));
save(file,'TF');


% --- Executes on button press in checkfft.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkfft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkfft


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in chk50Hz.
function chk50Hz_Callback(hObject, eventdata, handles)
% hObject    handle to chk50Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chk50Hz


% --- Executes on button press in chk60Hz.
function chk60Hz_Callback(hObject, eventdata, handles)
% hObject    handle to chk60Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chk60Hz



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EDItoMAT;