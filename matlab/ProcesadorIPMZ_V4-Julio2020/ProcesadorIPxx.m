function varargout = ProcesadorIPxx(varargin)
% PROCESADORIPXX M-file for ProcesadorIPxx.fig
%      PROCESADORIPXX, by itself, creates a new PROCESADORIPXX or raises the existing
%      singleton*.
%
%      H = PROCESADORIPXX returns the handle to a new PROCESADORIPXX or the handle to
%      the existing singleton*.
%
%      PROCESADORIPXX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROCESADORIPXX.M with the given input arguments.
%
%      PROCESADORIPXX('Property','Value',...) creates a new PROCESADORIPXX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProcesadorIP_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProcesadorIPxx_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProcesadorIPxx

% Last Modified by GUIDE v2.5 25-Aug-2020 10:34:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProcesadorIPxx_OpeningFcn, ...
                   'gui_OutputFcn',  @ProcesadorIPxx_OutputFcn, ...
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


% --- Executes just before ProcesadorIPxx is made visible.
function ProcesadorIPxx_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProcesadorIPxx (see VARARGIN)

% Choose default command line output for ProcesadorIPxx

handles.output = hObject;
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:Javaframe');
JF=get(hObject,'JavaFrame');%%%,'JavaFrame');
javax.swing.ImageIcon('myicon.png');
JF.setFigureIcon(javax.swing.ImageIcon('myicon.png'));
set(handles.text83,'String','Procesador IP version 3.08.18');
global pscarhnd;
if ~isempty(pscarhnd)
    pscarhnd=[];
end
global psreshnd;
if ~isempty(psreshnd)
    psreshnd=[];
end

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes ProcesadorIPxx wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ProcesadorIPxx_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txConfig_Callback(hObject, eventdata, handles)
% hObject    handle to txConfig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txConfig as text
%        str2double(get(hObject,'String')) returns contents of txConfig as a double


% --- Executes during object creation, after setting all properties.
function txConfig_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txConfig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lsTSn.
function lsTSn_Callback(~, eventdata, handles)
% hObject    handle to lsTSn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns lsTSn contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lsTSn


% --- Executes during object creation, after setting all properties.
function lsTSn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lsTSn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btConfig.
function btConfig_Callback(hObject, eventdata, handles)
% hObject    handle to btConfig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btSalir.
function btSalir_Callback(hObject, eventdata, handles)
% hObject    handle to btSalir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%pos_size = get(ProcesadorIP,'Position');
% Call modaldlg with the argument 'Position'.

user_response = closeDialog('Salir','Confirm Close');

switch user_response
case 'No'
	% take no action
case 'Yes'
	delete(handles.figure1);
end


% --- Executes on button press in btSiguiente.
function btSiguiente_Callback(hObject, eventdata, handles)
% hObject    handle to btSiguiente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btsignals.
function btsignals_Callback(hObject, eventdata, handles)
% hObject    handle to btsignals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btSignals.
function btSignals_Callback(hObject, eventdata, handles)
% hObject    handle to btSignals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btGrSignal.
function btGrSignal_Callback(hObject, eventdata, handles)
% hObject    handle to btGrSignal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function txProcesoExam_Callback(hObject, eventdata, handles)
% hObject    handle to txProcesoExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txProcesoExam as text
%        str2double(get(hObject,'String')) returns contents of txProcesoExam as a double


% --- Executes during object creation, after setting all properties.
function txProcesoExam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txProcesoExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btProcesoExam.
function btProcesoExam_Callback(hObject, eventdata, handles)
% hObject    handle to btProcesoExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
global pathGlobal;
[file,path]=uigetfile({'*.pro','Archivo de proceso IP'},'Seleccione el archivo de Proceso',pathGlobal);
if isequal(file,0)
    disp('cancel')
else
    pathGlobal = path;
    archivo = [path,file];
    objLstShot = abrirProceso(archivo);
    set(handles.txProcesoExam,'String',archivo);
    actualizarPanel(objLstShot,'proceso',handles);
end

% --- Executes on button press in btContinuar.
function btContinuar_Callback(hObject, eventdata, handles)
% hObject    handle to btContinuar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
global pathGlobal;

% pos_size = get(ProcesadorIPxx,'Position');
% % Call modaldlg with the argument 'Position'.
% user_response = saveDialog('Guardar Resultados','Confirm Close');
% switch user_response
%     case 'No'
%         %Comienza Proceso *****************************
%         h = waitbar(0,'Procesando...');
%         objLstShot = procesar(objLstShot);
%         %waitbar(80/100);
%         close(h);
        %Finaliza Proceso
%     case 'Si'
        [file,path] = uiputfile({'*.pro','Archivo de proceso IP'},'Seleccionar nuevo destino proceso',[pathGlobal,objLstShot.filename]);
        if isequal(file,0)
            disp('cancel');
        else
            disp('guardando...');
            file = agregarExtension(file,'pro');
            pathGlobal = path;
            objLstShot.filename = file;
            %Comienza Proceso *****************************
            progressbar('Procesing....'); %h = waitbar(0,'Procesando...');
            objLstShot = procesar(objLstShot,path);
            %waitbar(80/100);
            progressbar(1);%close(h);
            %Finaliza Proceso
            crearProceso(objLstShot,[path,file]);
%            objLstShot.Shots = guardarResultados(objLstShot.Shots,path);
            disp('guardado');
        end
% end
liberar;
set(handles.popShot,'String',objLstShot.listarShots);
shot = objLstShot.Shots;
actualizarListaEstaciones(shot{1}.objLstEst,handles,4);
set(handles.pnProceso,'Visible','off');
set(handles.pnEditarProceso,'Visible','on');
% set(handles.pnProceso,'Visible','off');
% set(handles.pnEditarProceso,'Visible','on');
% txt=get(hObject,'String');
% switch txt
%     case 'Continuar'
%         cargarProceso(handles)
%     case 'Crear'
%         fid=fopen(get(handles.txProcesoNuevo,'String'),'w');
%         fclose(fid);
%         set(handles.pnProceso,'Visible','off');
%         set(handles.pnMedicion,'Visible','on');
%     otherwise
%         disp('no pasa na')
% end



function txProcesoNuevo_Callback(hObject, eventdata, handles)
% hObject    handle to txProcesoNuevo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txProcesoNuevo as text
%        str2double(get(hObject,'String')) returns contents of txProcesoNuevo as a double


% --- Executes during object creation, after setting all properties.
function txProcesoNuevo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txProcesoNuevo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btNuevoExam.
function btNuevoExam_Callback(hObject, eventdata, handles)
% hObject    handle to btNuevoExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path]=uiputfile({'*.ipp','Archivo de proceso IP',},'Crear nuevo proceso','NuevoProceso.ipp');
if isequal(file,0)
    disp('cancel')
else
    set(handles.txProcesoNuevo,'String',strcat(path,file))
end

% --- Executes on button press in btMCrearProceso.
function btMCrearProceso_Callback(hObject, eventdata, handles)
% hObject    handle to btMCrearProceso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnPrincipal,'Visible','off');
set(handles.pnProceso,'Visible','on');
lista{1}='Mean 50 Hz';
lista{2}='Weak 50 Hz';
lista{3}='Hard 50 Hz';
lista{4}='Mean 60 Hz';
lista{5}='Weak 60 Hz';
lista{6}='Hard 60 Hz';

%set(handles.ls50hz,'String',lista);
set(handles.ls50hz,'String',lista);



% --- Executes on button press in rbAbrir.
function rbAbrir_Callback(hObject, eventdata, handles)
% hObject    handle to rbAbrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.txProcesoExam,'enable','on');
set(handles.btProcesoExam,'enable','on');
set(handles.txProcesoNuevo,'enable','off');
set(handles.btNuevoExam,'enable','off');
set(handles.btContinuar,'String','Continuar');
% Hint: get(hObject,'Value') returns toggle state of rbAbrir




% --- Executes on button press in rbCrear.
function rbCrear_Callback(hObject, eventdata, handles)
% hObject    handle to rbCrear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.txProcesoExam,'enable','off');
set(handles.btProcesoExam,'enable','off');
set(handles.txProcesoNuevo,'enable','on');
set(handles.btNuevoExam,'enable','on');
set(handles.btContinuar,'String','Crear');
% Hint: get(hObject,'Value') returns toggle state of rbCrear


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not creaListted until after all CreateFcns called
global objLstEst;
global objLstShot;
global pathGlobal;
global pathCal;
global pathShot;
global pathTSN;
global estRemota; %estacion Remota con todos canales
global figRes;
global figCarg;
figRes=0;
figCarg=0;
pathGlobal = 'C:\';
pathCal = 'C:\';
pathShot = 'C:\';
pathTSN = 'C:\';
objLstEst = ListEstaciones;
objLstShot = ListShot;
path(path,[pwd,'\filtros']);
path(path,[pwd,'\stacks']);
path(path,[pwd,'\exportar']);

function txSExam_Callback(hObject, eventdata, handles)
% hObject    handle to txSExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txSExam as text
%        str2double(get(hObject,'String')) returns contents of txSExam as a double


% --- Executes during object creation, after setting all properties.
function txSExam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txSExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btSExam.
function btSExam_Callback(hObject, eventdata, handles)
% hObject    handle to btSExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstEst;
global pathShot;
[file,path]=uigetfile({'*.sht','Archivos Shots'},'Seleccionar archivo Shot',pathShot);
if isequal(file,0)
    disp('cancel');
else
    pathShot = path;
    archivo=strcat(path,file);
    set(handles.txSExam,'String',archivo);
    objLstEst=abrirShot(archivo);
    actualizarListaEstaciones(objLstEst,handles,5);
    graficarSeudoSeccion(objLstEst,handles);
end

function txSTrans_Callback(hObject, eventdata, handles)
% hObject    handle to txSTrans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txSTrans as text
%        str2double(get(hObject,'String')) returns contents of txSTrans as a double
%disp(hola);

% --- Executes during object creation, after setting all properties.
function txSTrans_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txSTrans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txSRem_Callback(hObject, eventdata, handles)
% hObject    handle to txSRem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txSRem as text
%        str2double(get(hObject,'String')) returns contents of txSRem as a double


% --- Executes during object creation, after setting all properties.
function txSRem_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txSRem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lsSIP.
function lsSIP_Callback(hObject, eventdata, handles)
% hObject    handle to lsSIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns lsSIP contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lsSIP
global objLstEst;
indice = get(hObject,'Value');
set(handles.rbTIP,'Value',1);
if length(objLstEst) >= 1
    actualizarDatos(objLstEst,indice,handles);
end


% --- Executes during object creation, after setting all properties.
function lsSIP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lsSIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btSQuitar.
function btSQuitar_Callback(hObject, eventdata, handles)
% hObject    handle to btSQuitar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstEst;
indice = get(handles.lsSIP,'Value');
disp(indice);
objLstEst = Sacar(objLstEst,indice);
if indice+1 > getLargo(objLstEst)
    set(handles.lsSIP,'Value',getLargo(objLstEst)-1);
end
if getLargo(objLstEst) <= 1
    set(handles.lsSIP,'Value',1);
    set(handles.lsSIP,'String','Estaciones IP - Canal');
else    
    actualizarListaEstaciones(objLstEst,handles,3);
    graficarSeudoSeccion(objLstEst,handles);
end

% --- Executes on button press in btSGuardar.
% function btSGuardar_Callback(hObject, eventdata, handles)
% hObject    handle to btSGuardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global objLstEst;
% switch get(handles.rbSNuevo,'Value')
%     case 0
%         archivo=get(handles.txSExam,'String');
%         crearShot(objLstEst,handles,archivo);
%     case 1
%         [file,path]=uiputfile({'*.sht','Archivos Shots'},'Guardar archivo Shot');
%         if isequal(file,0)
%             disp('cancel guardar');
%         else
%             archivo=strcat(path,file);
%             set(handles.txSExam,'String',archivo);
%             crearShot(objLstEst,handles,path,archivo);
%         end
% end


function txTXr1_Callback(hObject, eventdata, handles)
% hObject    handle to txTXr1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTXr1 as text
%        str2double(get(hObject,'String')) returns contents of txTXr1 as a double


% --- Executes during object creation, after setting all properties.
function txTXr1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTXr1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txTXr2_Callback(hObject, eventdata, handles)
% hObject    handle to txTXr2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTXr2 as text
%        str2double(get(hObject,'String')) returns contents of txTXr2 as a double


% --- Executes during object creation, after setting all properties.
function txTXr2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTXr2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txTGanancia_Callback(hObject, eventdata, handles)
% hObject    handle to txTGanancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTGanancia as text
%        str2double(get(hObject,'String')) returns contents of txTGanancia as a double


% --- Executes during object creation, after setting all properties.
function txTGanancia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTGanancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txTcalibracion_Callback(hObject, eventdata, handles)
% hObject    handle to txTcalibracion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTcalibracion as text
%        str2double(get(hObject,'String')) returns contents of txTcalibracion as a double


% --- Executes during object creation, after setting all properties.
function txTcalibracion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTcalibracion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathCal;
[file,path]=uigetfile({'*.txt','Archivos de calibraciones'},'Selecciones el archivo de calibracion',pathCal);
if isequal(file,0)
    disp('cancelar get CAL');
else
    pathCal = path;
    archivo=strcat(path,file);
    set(handles.txTcalibracion,'String',archivo);
end



function txTSerie_Callback(hObject, eventdata, handles)
% hObject    handle to txTSerie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTSerie as text
%        str2double(get(hObject,'String')) returns contents of txTSerie as a double


% --- Executes during object creation, after setting all properties.
function txTSerie_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTSerie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txTExam_Callback(hObject, eventdata, handles)
% hObject    handle to txTExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTExam as text
%        str2double(get(hObject,'String')) returns contents of txTExam as a double


% --- Executes during object creation, after setting all properties.
function txTExam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btTAbrir.
function btTAbrir_Callback(hObject, eventdata, handles)
% hObject    handle to btTAbrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathTSN;
[file,path]=uigetfile({'*.TS*','Archivos de series TSn'},'Selecciones el archivo de series',pathTSN);
if isequal(file,0)
    disp('cancelar get TSN');
else
    pathTSN = path;
    archivo=strcat(path,file);
    set(handles.txTExam,'String',archivo);
    set(handles.filetmp,'String',file);
    [header,ini,fin]=leer_header(archivo);
    set(handles.txTSerie,'String',header.serie);
end


function txTFrecuencia_Callback(hObject, eventdata, handles)
% hObject    handle to txTFrecuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTFrecuencia as text
%        str2double(get(hObject,'String')) returns contents of txTFrecuencia as a double


% --- Executes during object creation, after setting all properties.
function txTFrecuencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTFrecuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txTXt1_Callback(hObject, eventdata, handles)
% hObject    handle to txTXt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTXt1 as text
%        str2double(get(hObject,'String')) returns contents of txTXt1 as a double


% --- Executes during object creation, after setting all properties.
function txTXt1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTXt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txTXt2_Callback(hObject, eventdata, handles)
% hObject    handle to txTXt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTXt2 as text
%        str2double(get(hObject,'String')) returns contents of txTXt2 as a double


% --- Executes during object creation, after setting all properties.
function txTXt2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTXt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txTcalibracionHx_Callback(hObject, eventdata, handles)
% hObject    handle to txTcalibracionHx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTcalibracionHx as text
%        str2double(get(hObject,'String')) returns contents of txTcalibracionHx as a double


% --- Executes during object creation, after setting all properties.
function txTcalibracionHx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTcalibracionHx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathCal;
[file,path]=uigetfile({'*.txt','Archivos de calibraciones'},'Selecciones el archivo de calibracion',pathCal);
if isequal(file,0)
    disp('cancelar get CAL');
else
    pathCal = path;
    archivo=strcat(path,file);
    set(handles.txTcalibracionHx,'String',archivo);
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
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
global pathCal;
[file,path]=uigetfile({'*.txt','Archivos de calibraciones'},'Selecciones el archivo de calibracion',pathCal);
if isequal(file,0)
    disp('cancelar get CAL');
else
    pathCal = path;
    archivo=strcat(path,file);
    set(handles.txTcalibracionHy,'String',archivo);
end



function txTCorriente_Callback(hObject, eventdata, handles)
% hObject    handle to txTCorriente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTCorriente as text
%        str2double(get(hObject,'String')) returns contents of txTCorriente as a double


% --- Executes during object creation, after setting all properties.
function txTCorriente_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTCorriente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txTDelta_Callback(hObject, eventdata, handles)
% hObject    handle to txTDelta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTDelta as text
%        str2double(get(hObject,'String')) returns contents of txTDelta as a double


% --- Executes during object creation, after setting all properties.
function txTDelta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTDelta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btSMostrar.
function btSMostrar_Callback(hObject, eventdata, handles)
% hObject    handle to btSMostrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btTActualizar.
function btTActualizar_Callback(hObject, eventdata, handles)
% hObject    handle to btTActualizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstEst;
objEst = crearEstacion(handles);
opcion=get(handles.rbTTransmisor,'Value')*1 + get(handles.rbTRemota,'Value')*2 + get(handles.rbTIP,'Value')*3;
switch opcion
    case 1
        objLstEst=setTransmisor(objLstEst,objEst);
    case 2
        objLstEst=setEstRemota(objLstEst,objEst);
    case 3
        indice=get(handles.lsSIP,'Value');
        objLstEst=set(objLstEst,objEst,indice);
end
actualizarListaEstaciones(objLstEst,handles,opcion);
graficarSeudoSeccion(objLstEst,handles);

% --- Executes on button press in btTAgregar.
function btTAgregar_Callback(hObject, eventdata, handles)
% hObject    handle to btTAgregar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstEst;
if verificacion('archivoTSN',handles)
    objEst = crearEstacion(handles);
    %disp(get(objEst,'file'));
    opcion=get(handles.rbTTransmisor,'Value')*1 + get(handles.rbTRemota,'Value')*2 + get(handles.rbTIP,'Value')*3;
    objLstEst = Agregar(objLstEst,objEst,opcion);
    ss = getTransmisor(objLstEst);
    actualizarListaEstaciones(objLstEst,handles,opcion);
    graficarSeudoSeccion(objLstEst,handles);
end





% --- Executes on button press in btSincronizar.
function btSincronizar_Callback(hObject, eventdata, handles)
% hObject    handle to btSincronizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)global lsFiltrosAp
global objLstEst;
global pathShot;
if verificacion('archivoShot',handles)
    path=uigetdir(pathShot,'Guardar archivo Shot');
    if isequal(path,0)
        disp('cancel guardar');
    else
        path=[path,'\'];
        pathShot = path;
        objLstEst = sincronizarShot(objLstEst,path);
    end
    btGuardarShot_Callback(hObject, eventdata, handles);
end

% --- Executes on button press in btGuardarShot.
function btGuardarShot_Callback(hObject, eventdata, handles)
% hObject    handle to btGuardarShot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstEst;
global pathShot;

if verificacion('archivoShot',handles)
    [file,path]=uiputfile({'*.sht','Archivos Shots'},'Guardar archivo Shot',pathShot);
    if isequal(file,0)
        disp('cancel guardar');
    else
        pathShot = path;
        file = agregarExtension(file,'sht');
        archivo=strcat(path,file);
        set(handles.txSExam,'String',archivo);
        objLstEst = toFile(objLstEst,archivo);
        actualizarListaEstaciones(objLstEst,handles,3);
    end
end



% --- Executes on button press in btAtras.
function btAtras_Callback(hObject, eventdata, handles)
% hObject    handle to btAtras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnProceso,'Visible','off');
set(handles.pnPrincipal,'Visible','on');





function txInicial_Callback(hObject, eventdata, handles)
% hObject    handle to txInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txInicial as text
%        str2double(get(hObject,'String')) returns contents of txInicial as a double


% --- Executes during object creation, after setting all properties.
function txInicial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txFinal_Callback(hObject, eventdata, handles)
% hObject    handle to txFinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txFinal as text
%        str2double(get(hObject,'String')) returns contents of txFinal as a double


% --- Executes during object creation, after setting all properties.
function txFinal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txFinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btExtraer.
function btExtraer_Callback(hObject, eventdata, handles)
% hObject    handle to btExtraer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path]=uigetfile({'*.ts*','Archivos TSn'},'Seleccione Archivo TSN');
if isequal(file,0)
else
        str = strcat(path,file);
        [x,inicio,final]=leer_header(str);
        set(handles.txInicial,'String',inicio);
        set(handles.txFinal,'String',final);   
end

% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function txBExam_Callback(hObject, eventdata, handles)
% hObject    handle to txBExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txBExam as text
%        str2double(get(hObject,'String')) returns contents of txBExam as a double


% --- Executes during object creation, after setting all properties.
function txBExam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txBExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btBExam.
function btBExam_Callback(hObject, eventdata, handles)
% hObject    handle to btBExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathTSN;
[file,dir]=uigetfile({'*.TS*','Archivos TSn'},'Seleccione TSN',pathTSN);
if isequal(file,0)
else
    pathTSN = dir;
    set(handles.txBExam,'String',dir);
end

% --- Executes on button press in btBuscar.
function btBuscar_Callback(hObject, eventdata, handles)
% hObject    handle to btBuscar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path_str=get(handles.txBExam,'String');
path = strcat(path_str,'\');
dir = '*.TS4';
inicio=get(handles.txInicial,'String');
final=get(handles.txFinal,'String');

file=buscar_TSN(path,dir,inicio,final);

%si es que no encontro un archivo
if length(file) == 0
   msgbox('No hay serie de tiempo para el intervalo de tiempo'); 
else
%si encotro el archivo TSN
    header = leer_header(file);
    str = num2str(header.serie);
    set(handles.txTSerie,'String',str);
    set(handles.txTExam,'String',file);
end


function txDecision_Callback(hObject, eventdata, handles)
% hObject    handle to txDecision (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txDecision as text
%        str2double(get(hObject,'String')) returns contents of txDecision as a double


% --- Executes during object creation, after setting all properties.
function txDecision_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txDecision (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txTiempo_Callback(hObject, eventdata, handles)
% hObject    handle to txTiempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTiempo as text
%        str2double(get(hObject,'String')) returns contents of txTiempo as a double


% --- Executes during object creation, after setting all properties.
function txTiempo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTiempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btTiempoExam.
function btTiempoExam_Callback(hObject, eventdata, handles)
% hObject    handle to btTiempoExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathGlobal;
[file,path]=uigetfile({'*.tpo','Archivo de Tiempos'},'Seleccione el archivo de tiempo',pathGlobal);
if isequal(file,0)
    disp('cancel');
else
    pathGlobal = path;
    archivo = [path,file];
    set(handles.txTiempo,'String',archivo);
end


function txVentana_Callback(hObject, eventdata, handles)
% hObject    handle to txVentana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txVentana as text
%        str2double(get(hObject,'String')) returns contents of txVentana as a double


% --- Executes during object creation, after setting all properties.
function txVentana_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txVentana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rbSRobusto.
function rbSRobusto_Callback(hObject, eventdata, handles)
% hObject    handle to rbSRobusto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRobusto,'Visible','on');
set(handles.pnTiempos,'Visible','off');
set(handles.pnHalvelson,'Visible','off');
set(handles.pnSFile,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbSRobusto




% --- Executes on button press in rbSTiempos.
function rbSTiempos_Callback(hObject, eventdata, handles)
% hObject    handle to rbSTiempos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRobusto,'Visible','off');
set(handles.pnTiempos,'Visible','on');
set(handles.pnHalvelson,'Visible','off');
set(handles.pnSFile,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbSTiempos




% --- Executes on button press in rbSHalvelson.
function rbSHalvelson_Callback(hObject, eventdata, handles)
% hObject    handle to rbSHalvelson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRobusto,'Visible','off');
set(handles.pnTiempos,'Visible','off');
set(handles.pnHalvelson,'Visible','on');
set(handles.pnSFile,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbSHalvelson




% --- Executes on button press in rbSNormal.
function rbSNormal_Callback(hObject, eventdata, handles)
% hObject    handle to rbSNormal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRobusto,'Visible','on');
set(handles.pnTiempos,'Visible','off');
set(handles.pnHalvelson,'Visible','off');
set(handles.pnSFile,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbSNormal





function txImpedancia_Callback(hObject, eventdata, handles)
% hObject    handle to txImpedancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txImpedancia as text
%        str2double(get(hObject,'String')) returns contents of txImpedancia as a double


% --- Executes during object creation, after setting all properties.
function txImpedancia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txImpedancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txCRemoto_Callback(hObject, eventdata, handles)
% hObject    handle to txCRemoto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txCRemoto as text
%        str2double(get(hObject,'String')) returns contents of txCRemoto as a double


% --- Executes during object creation, after setting all properties.
function txCRemoto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txCRemoto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btIExam.
function btIExam_Callback(hObject, eventdata, handles)
% hObject    handle to btIExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathGlobal;
[file,path]=uigetfile({'*.txt','Archivo de Impedancias'},'Seleccione el archivo de Impedancia',pathGlobal);
if isequal(file,0)
    disp('cancel');
else
    pathGlobal = path;
    archivo = [path,file];
    set(handles.txImpedancia,'String',archivo);
end


function txVarianza_Callback(hObject, eventdata, handles)
% hObject    handle to txVarianza (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txVarianza as text
%        str2double(get(hObject,'String')) returns contents of txVarianza as a double


% --- Executes during object creation, after setting all properties.
function txVarianza_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txVarianza (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ls50hz2.
function ls50hz2_Callback(hObject, eventdata, handles)
% hObject    handle to ls50hz2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns ls50hz2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ls50hz2


% --- Executes during object creation, after setting all properties.
function ls50hz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ls50hz2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
str = cellstr({'Promedio','Rudo','Suave'});
set(hObject,'String',str);



function txLimSuperior_Callback(hObject, eventdata, handles)
% hObject    handle to txLimSuperior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txLimSuperior as text
%        str2double(get(hObject,'String')) returns contents of txLimSuperior as a double


% --- Executes during object creation, after setting all properties.
function txLimSuperior_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txLimSuperior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txNDecision_Callback(hObject, eventdata, handles)
% hObject    handle to txNDecision (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txNDecision as text
%        str2double(get(hObject,'String')) returns contents of txNDecision as a double


% --- Executes during object creation, after setting all properties.
function txNDecision_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txNDecision (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rbFRuido.
function pbFRuido2_Callback(hObject, eventdata, handles)
% hObject    handle to pbFRuido2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRuido2,'Visible','on');
set(handles.pnWeiner,'Visible','off');
set(handles.pn50hz,'Visible','off');
set(handles.pnNivel,'Visible','off');
set(handles.pnBanda,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of pbFRuido2




% --- Executes on button press in rbFWeiner.
function rbFWeiner_Callback(hObject, eventdata, handles)
% hObject    handle to rbFWeiner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pbRuido,'Visible','off');
set(handles.pnWeiner,'Visible','on');
set(handles.pn50hz,'Visible','off');
set(handles.pnNivel,'Visible','off');
set(handles.pnBanda,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbFWeiner




% --- Executes on button press in rbF50.
function rbF50_Callback(hObject, eventdata, handles)
% hObject    handle to rbF50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRuido,'Visible','off');
set(handles.pnWeiner,'Visible','off');
set(handles.pn50hz,'Visible','on');
set(handles.pnNivel,'Visible','off');
set(handles.pnBanda,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbF50




% --- Executes on button press in rbFNivel.
function rbFNivel_Callback(hObject, eventdata, handles)
% hObject    handle to rbFNivel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRuido,'Visible','off');
set(handles.pnWeiner,'Visible','off');
set(handles.pn50hz,'Visible','off');
set(handles.pnNivel,'Visible','on');
set(handles.pnBanda,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbFNivel




% --- Executes on button press in btResultados.
function btResultados_Callback(hObject, eventdata, handles)
% hObject    handle to btResultados (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnEditarProceso,'Visible','off');
set(handles.pnResultados,'Visible','on');

% --- Executes on selection change in popShot.
function popShot_Callback(hObject, eventdata, handles)
% hObject    handle to popShot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popShot contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popShot
global objLstShot;
shot = objLstShot.Shots;
indice = get(hObject,'Value');
actualizarListaEstaciones(shot{indice}.objLstEst,handles,4);

% --- Executes during object creation, after setting all properties.
function popShot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popShot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btEPVolver.
function btEPVolver_Callback(hObject, eventdata, handles)
% hObject    handle to btEPVolver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnEditarProceso,'Visible','off');
set(handles.pnPrincipal,'Visible','on');

% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%'CUAC!!'
global objLstShot;
progressbar('Processing...');
indiceShot = get(handles.popShot,'Value');
indiceEst = get(handles.popEstacion,'Value');
shots = objLstShot.Shots;
shot = shots{indiceShot};
ests = shot.objLstEst;
largo = length(ests);
if length(ests) >= indiceEst
%    indiceEst}
%'HOLHOLA'
    est = get(ests,indiceEst);
    est = procesar(est);
    ests = set(ests,est,indiceEst);
else
    est = getEstRemota(ests);
    est = procesarRemota(est);
    ests = setEstRemota(ests,est);
end
shot.objLstEst = ests;
shots{indiceShot} = shot;
objLstShot.Shots = shots;
%xlim=get(handles.grSenales,'Xlim');
%ylim=get(handles.grSenales,'Ylim');
%'hola0'
progressbar(1);
graficarSenales(handles,est);
setad(handles,est);

%set(handles.grSenales,'Xlim',xlim);
%set(handles.grSenales,'Ylim',ylim);

%graficarSenales(handles,est);


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(~, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathGlobal;
global objLstShot;

[file,path] = uiputfile({'*.pro','Archivo de Proceso'},'Seleccionar Archivo de proceso',[pathGlobal,objLstShot.filename]);
if isequal(file,0)
    disp('cancel');
else
    disp('guardando...');
    pathGlobal = path;
    objLstShot.filename = file;
    %         crearProceso(objLstShot,[path,file]);
    indiceShot = get(handles.popShot,'Value');
    shots = objLstShot.Shots;
    shot{1} = shots{indiceShot};
    %objLstShot.Shots = guardarResultados(objLstShot.Shots,path);
    shot = guardarResultados(shot,path);
    s = shot{1};
    shots{indiceShot} = s;
    objLstShot.Shots = shots;
    crearProceso(objLstShot,[path,file]);
    disp('guardado');
end


function txTiempo2_Callback(hObject, eventdata, handles)
% hObject    handle to txTiempo2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTiempo2 as text
%        str2double(get(hObject,'String')) returns contents of txTiempo2 as a double


% --- Executes during object creation, after setting all properties.
function txTiempo2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txTiempo2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btSTiempos2.
function btSTiempos2_Callback(hObject, eventdata, handles)
% hObject    handle to btSTiempos2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function txDecision2_Callback(hObject, eventdata, handles)
% hObject    handle to txDecision2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txDecision2 as text
%        str2double(get(hObject,'String')) returns contents of txDecision2 as a double


% --- Executes during object creation, after setting all properties.
function txDecision2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txDecision2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txVentana2_Callback(hObject, eventdata, handles)
% hObject    handle to txVentana2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txVentana2 as text
%        str2double(get(hObject,'String')) returns contents of txVentana2 as a double


% --- Executes during object creation, after setting all properties.
function txVentana2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txVentana2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txImpedancia2_Callback(hObject, eventdata, handles)
% hObject    handle to txImpedancia2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txImpedancia2 as text
%        str2double(get(hObject,'String')) returns contents of txImpedancia2 as a double


% --- Executes during object creation, after setting all properties.
function txImpedancia2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txImpedancia2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txHxch_Callback(hObject, eventdata, handles)
% hObject    handle to txHxch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txHxch as text
%        str2double(get(hObject,'String')) returns contents of txHxch as a double


% --- Executes during object creation, after setting all properties.
function txHxch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txHxch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btFImpedancia2.
function btFImpedancia2_Callback(hObject, eventdata, handles)
% hObject    handle to btFImpedancia2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathGlobal;
[file,path]=uigetfile({'*.mat','Archivo de Impedancias'},'Seleccione el archivo de Impedancia',pathGlobal);
if isequal(file,0)
    disp('cancel');
else
    pathGlobal = path;
    archivo = [path,file];
    set(handles.txImpedancia2,'String',archivo);
    load(archivo);
    set(handles.ftTaper,'String',num2str(TF.Nm));
end


function txVarianza2_Callback(hObject, eventdata, handles)
% hObject    handle to txVarianza2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txVarianza2 as text
%        str2double(get(hObject,'String')) returns contents of txVarianza2 as a double


% --- Executes during object creation, after setting all properties.
function txVarianza2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txVarianza2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ls50hz2.
function listbox6_Callback(hObject, eventdata, handles)
% hObject    handle to ls50hz2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns ls50hz2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ls50hz2


% --- Executes during object creation, after setting all properties.
function listbox6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ls50hz2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txFVentana2_Callback(hObject, eventdata, handles)
% hObject    handle to txFVentana2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txFVentana2 as text
%        str2double(get(hObject,'String')) returns contents of txFVentana2 as a double


% --- Executes during object creation, after setting all properties.
function txFVentana2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txFVentana2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txFDecision2_Callback(hObject, eventdata, handles)
% hObject    handle to txFDecision2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txFDecision2 as text
%        str2double(get(hObject,'String')) returns contents of txFDecision2 as a double


% --- Executes during object creation, after setting all properties.
function txFDecision2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txFDecision2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in chCruda.
function chCruda_Callback(hObject, eventdata, handles)
% hObject    handle to chCruda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chCruda


% --- Executes on button press in chProcesada.
function chProcesada_Callback(hObject, eventdata, handles)
% hObject    handle to chProcesada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chProcesada


% --- Executes on button press in chStackeada.
function chStackeada_Callback(hObject, eventdata, handles)
% hObject    handle to chStackeada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chStackeada


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in chTelurico.
function chTelurico_Callback(hObject, eventdata, handles)
% hObject    handle to chTelurico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chTelurico


% --- Executes on button press in btRVolver.
function btRVolver_Callback(hObject, eventdata, handles)
% hObject    handle to btRVolver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnResultados,'Visible','off');
set(handles.pnEditarProceso,'Visible','on');



% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pos_size = get(ProcesadorIPxx,'Position');
% Call modaldlg with the argument 'Position'.
user_response = exitdlgx;%closeDialog('Salir','Confirm Close');
switch user_response
case 0
	% take no action
case 1
	delete(hObject);
end
% Hint: delete(hObject) closes the figure





% --- Executes on button press in chSCruda.
function chSCruda_Callback(hObject, eventdata, handles)
% hObject    handle to chSCruda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chSCruda
if get(handles.chSCruda,'Value') == 1 | get(handles.chSProcesada,'Value') == 1 | get(handles.chSRuido,'Value') == 1
    set(handles.chSStack,'Enable','off');
    set(handles.chSMiniStack,'Enable','off');
    set(handles.chSDecaimiento,'Enable','off');
else
    set(handles.chSStack,'Enable','on');
    set(handles.chSMiniStack,'Enable','on');
    set(handles.chSDecaimiento,'Enable','on');
end


% --- Executes on button press in chSProcesada.
function chSProcesada_Callback(hObject, eventdata, handles)
% hObject    handle to chSProcesada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chSProcesada
if get(handles.chSCruda,'Value') == 1 | get(handles.chSProcesada,'Value') == 1 | get(handles.chSRuido,'Value') == 1
    set(handles.chSStack,'Enable','off');
    set(handles.chSMiniStack,'Enable','off');
    set(handles.chSDecaimiento,'Enable','off');
else
    set(handles.chSStack,'Enable','on');
    set(handles.chSMiniStack,'Enable','on');
    set(handles.chSDecaimiento,'Enable','on');
end

% --- Executes on button press in chStack.
function chStack_Callback(hObject, eventdata, handles)
% hObject    handle to chStack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chStack

if get(hObject,'Value') == 1
    set(handles.chSCruda,'Enable','off');
    set(handles.chSMiniStack,'Enable','off');
    set(handles.chSProcesada,'Enable','off');
    set(handles.chSRuido,'Enable','off');
else
    set(handles.chSCruda,'Enable','on');
    set(handles.chSMiniStack,'Enable','on');
    set(handles.chSProcesada,'Enable','on');
    set(handles.chSRuido,'Enable','on');
end


% --- Executes on button press in chMiniStack.
function chMiniStack_Callback(hObject, eventdata, handles)
% hObject    handle to chMiniStack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chMiniStack
if get(hObject,'Value') == 1
    set(handles.chSCruda,'Enable','off');
    set(handles.chSStack,'Enable','off');
    set(handles.chSProcesada,'Enable','off');
    set(handles.chSRuido,'Enable','off');
else
    set(handles.chSCruda,'Enable','on');
    set(handles.chSStack,'Enable','on');
    set(handles.chSProcesada,'Enable','on');
    set(handles.chSRuido,'Enable','on');
end

% --- Executes on button press in chSRuido.
function chSRuido_Callback(hObject, eventdata, handles)
% hObject    handle to chSRuido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chSRuido
if get(handles.chSCruda,'Value') == 1 | get(handles.chSProcesada,'Value') == 1 | get(handles.chSRuido,'Value') == 1
    set(handles.chSStack,'Enable','off');
    set(handles.chSMiniStack,'Enable','off');
    set(handles.chSDecaimiento,'Enable','off');
else
    set(handles.chSStack,'Enable','on');
    set(handles.chSMiniStack,'Enable','on');
    set(handles.chSDecaimiento,'Enable','on');
end

% --- Executes on selection change in popEstacion.
function popEstacion_Callback(hObject, eventdata, handles)
% hObject    handle to popEstacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popEstacion contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popEstacion
 valor = get(hObject,'Value');
 valorShot = get(handles.popShot,'Value');
 global objLstShot;
 set(handles.lsFiltrosEst,'Value',1);
 shots = objLstShot.Shots;
 ests = shots{valorShot}.objLstEst;
 if length(ests) >= valor
     est = get(ests,valor);
     stack = get(est,'stack');
     set(handles.txStackEst,'String',stack.nombre);
     mostrarFiltroStack(get(est,'stack'),handles);
%      set(handles.chSMiniStack,'Enable','on');
%       set(handles.chSRuido,'Enable','on');
%       set(handles.chSDecaimiento,'Enable','on');
    setad(handles,est);
  else
      est = getEstRemota(ests);
%       set(handles.chSMiniStack,'Value',0);
%       set(handles.chSRuido,'Value',0);
%       set(handles.chSDecaimiento,'Value',0);
%       set(handles.chSMiniStack,'Enable','off');
%       set(handles.chSRuido,'Enable','off');
%       set(handles.chSDecaimiento,'Enable','off');
 end
 set(handles.lsFiltrosEst,'String',toString(get(est,'lstFiltros')));
 mostrarFiltroStack(getFiltro(est,1),handles);
% 'hola1'
 %xlim=get(handles.grSenales,'XLim');
 %ylim=get(handles.grSenales,'YLim');

 graficarSenales(handles,est);
 %set(handles.grSenales,'XLim',xlim); 
 %set(handles.grSenales,'YLim',ylim);

% --- Executes during object creation, after setting all properties.
function popEstacion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popEstacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btEditarShot.
function btEditarShot_Callback(hObject, eventdata, handles)
% hObject    handle to btEditarShot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.pnPrincipal,'Visible','off');
set(handles.pnMedicion,'Visible','on');

% --- Executes on button press in btEditarProceso.
function btEditarProceso_Callback(hObject, eventdata, handles)
% hObject    handle to btEditarProceso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
global pathGlobal;
[file,path]=uigetfile({'*.pro','Archivo de proceso IP'},'Seleccione el archivo de Proceso',pathGlobal);
if isequal(file,0)
    disp('cancel')
else
    pathGlobal = path;
    archivo = [path,file];
    objLstShot = abrirProceso(archivo);
%    objLstShot
%    set(handles.txProcesoExam,'String',archivo);
    actualizarPanel(objLstShot,'proceso',handles);
end
set(handles.popShot,'String',objLstShot.listarShots);
shot = objLstShot.Shots;
actualizarListaEstaciones(shot{1}.objLstEst,handles,4);
%set(handles.pnPrincipal,'Visible','off');
set(handles.pnPrincipal,'Visible','off');
set(handles.pnEditarProceso,'Visible','on');

% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnPrincipal,'Visible','off');
set(handles.pnMedicion,'Visible','on');

% --- Executes on button press in btMainResultados.
function btMainResultados_Callback(hObject, eventdata, handles)
% hObject    handle to btMainResultados (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnPrincipal,'Visible','off');
set(handles.pnResultados,'Visible','on');



% --- Executes on button press in btMVolver.
function btMVolver_Callback(hObject, eventdata, handles)
% hObject    handle to btMVolver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnPrincipal,'Visible','on');
set(handles.pnMedicion,'Visible','off');



% --- Executes on button press in pushbutton45.
function pushbutton45_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in lsPShot.
function lsPShot_Callback(hObject, eventdata, handles)
% hObject    handle to lsPShot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns lsPShot contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lsPShot
global objLstShot;
%set(handles.lbFiltro,'String',getFiltro(objLstShot,get(hObject,'Value')));
%set(handles.lbStack,'String',getStack(objLstShot,get(hObject,'Value')));
shots = objLstShot.Shots;
valorShot = get(hObject,'Value');
shot = shots{valorShot};
%mostrarFiltroStack(shot,handles);
% nuevo
set(handles.lsFiltrosAp,'Value',1);
ests = shots{valorShot}.objLstEst;
est = get(ests,1);
stack = get(est,'stack');
if length(stack.nombre) > 0
    set(handles.txStackAp,'String',stack.nombre);
    mostrarFiltroStackP(get(est,'stack'),handles);
else
    set(handles.txStackAp,'String','Sin Stack');
end

filtros = get(est,'lstFiltros');
if length(filtros.filtros) > 0
    set(handles.lsFiltrosAp,'String',toString(get(est,'lstFiltros')));
    mostrarFiltroStackP(getFiltro(est,1),handles);
else
    set(handles.lsFiltrosAp,'Value',1);
    set(handles.lsFiltrosAp,'String','Sin Filtros');
end
% fin nuevo
%actualizarPanel(objLstShot,'proceso',handles);

% --- Executes during object creation, after setting all properties.
function lsPShot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lsPShot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btAgregarShot.
function btAgregarShot_Callback(hObject, eventdata, handles)
% hObject    handle to btAgregarShot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
global pathGlobal;
[file,path] = uigetfile({'*.sht','Archivos Shot'},'Seleccione un archivo shot',pathGlobal);
if isequal(file,0)
else
    pathGlobal = path;
    %h = waitbar(0,'Cargando...');
    progressbar('Processing...'); %h = waitbar(0,'Procesando...');
    objS = crearObjShot(strcat(path,file));
    progressbar(80/100); %waitbar(80/100);
    objLstShot.agregar = objS;
    progressbar(1);%waitbar(1);
%   set(handles.lsPShot,'String',objLstShot.listarShots);
    actualizarPanel(objLstShot,'proceso',handles);
%    close(h);
end

% --- Executes on button press in btGuardarProceso.
function btGuardarProceso_Callback(hObject, eventdata, handles)
% hObject    handle to btGuardarProceso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathGlobal;
global objLstShot;
[file,path] = uiputfile({'*.pro','Archivo de Proceso'},'Guardar proceso',pathGlobal);
if isequal(file,0)
else
    pathGlobal = path;
    archivo = [path,file];
    objLstShot.filename = file;
    crearProceso(objLstShot,archivo);
end


% --- Executes on button press in rbSAbrir.
function rbSAbrir_Callback(hObject, eventdata, handles)
% hObject    handle to rbSAbrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.txSExam,'Enable','on');

% Hint: get(hObject,'Value') returns toggle state of rbSAbrir




% --- Executes on button press in rbSNuevo.
function rbSNuevo_Callback(hObject, eventdata, handles)
% hObject    handle to rbSNuevo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.txSExam,'Enable','off');

% Hint: get(hObject,'Value') returns toggle state of rbSNuevo




% ---------------------------------------------------------------- %
% -------------------- Rutinas de ayuda -------------------------- %
% ---------------------------------------------------------------- %

% --- Carga la configuración de un proceso guardado
function cargarProceso(handles)
% handles structure with handles and user data (see GUIDATA)
set(handles.txProcesoExam,'String','Cargado');






function txTcalibracionHy_Callback(hObject, eventdata, handles)
% hObject    handle to txTcalibracionHy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txTcalibracionHy as text
%        str2double(get(hObject,'String')) returns contents of txTcalibracionHy as a double




% --- Executes on button press in pushbutton54.
function pushbutton54_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in btMostrar1.
function btMostrar1_Callback(hObject, eventdata, handles)
% hObject    handle to btMostrar1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstEst;
set(handles.rbTTransmisor,'Value',1);
actualizarDatos(objLstEst,0,handles);

% --- Executes on button press in btMostrar2.
function btMostrar2_Callback(hObject, eventdata, handles)
% hObject    handle to btMostrar2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstEst;
set(handles.rbTRemota,'Value',1);
actualizarDatos(objLstEst,0,handles);



function txSFile_Callback(hObject, eventdata, handles)
% hObject    handle to txSFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txSFile as text
%        str2double(get(hObject,'String')) returns contents of txSFile as a double


% --- Executes during object creation, after setting all properties.
function txSFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txSFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btSFIle.
function btSFIle_Callback(hObject, eventdata, handles)
% hObject    handle to btSFIle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btSFile.
function btSFile_Callback(hObject, eventdata, handles)
% hObject    handle to btSFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathGlobal;
[file,path]=uigetfile({'*.stk','Archivo de Stacks'},'Seleccione el archivo de Stack',pathGlobal);
if isequal(file,0)
    disp('cancel');
else
    pathGlobal = path;
    archivo = [path,file];
    set(handles.txSFile,'String',archivo);
end


function txFFile_Callback(hObject, eventdata, handles)
% hObject    handle to txFFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txFFile as text
%        str2double(get(hObject,'String')) returns contents of txFFile as a double


% --- Executes during object creation, after setting all properties.
function txFFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txFFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btFFile.
function btFFile_Callback(hObject, eventdata, handles)
% hObject    handle to btFFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathGlobal;
[file,path]=uigetfile({'*.flt','Archivo de Filtros'},'Seleccione el archivo de Filtros',pathGlobal);
if isequal(file,0)
    disp('cancel');
else
    pathGlobal = path;
    archivo = [path,file];
    set(handles.txFFile,'String',archivo);
end



% --- Executes on button press in btFS.
function btFS_Callback(hObject, eventdata, handles)
% hObject    handle to btFS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
opcionFiltro = get(handles.pbFRuido2,'Value') + get(handles.rbFWeiner,'Value')*2 + get(handles.rbF50,'Value')*3 + get(handles.rbFNivel,'Value')*4 + get(handles.rbFBanda,'Value')*5;
opcionStack = get(handles.rbSNormal,'Value')*1 + get(handles.rbSRobusto,'Value')*2 + get(handles.rbSTiempos,'Value')*3 + get(handles.rbSHalvelson,'Value')*4 + get(handles.rbSFile2,'Value')*5
indice = get(handles.lsPShot,'Value');
if objLstShot.largo > 0
    switch opcionFiltro
        case 1
            %Acciones filtro Ruido Telurico
            params{1} = get(handles.txImpedancia,'String');
            params{2} = get(handles.txCRemoto,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setFiltro(est,'Telurico',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = setFiltro(est,'Telurico',params);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
            %objLstShot = setFiltro(objLstShot,indice,'Telurico',params);
        case 2
            %Acciones filtro de Weiner
            params = get(handles.txVarianza,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setFiltro(est,'Weiner',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = setFiltro(est,'Weiner',params);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
            %objLstShot = setFiltro(objLstShot,indice,'Weiner',params);
        case 3
            %Acciones filtro de 50 hz
            func = get(handles.ls50hz,'Value');
            params = num2str(func); %recupera el nombre del filtro a partir de un indice
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setFiltro(est,'50 hz',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = setFiltro(est,'50 hz',params);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
            %objLstShot = setFiltro(objLstShot,indice,'50 hz',params);
        case 4
            %Acciones filtro A. R.
            params{1} = get(handles.txLimSuperior,'String');
            params{2} = get(handles.txNDecision,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setFiltro(est,'AR',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = setFiltro(est,'AR',params);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
            %objLstShot = setFiltro(objLstShot,indice,'AR',params);
        case 5
            %Acciones filtro desde archivo
            params = get(handles.txFFile,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setFiltro(est,'File',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = setFiltro(est,'File',params);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
            %objLstShot = setFiltro(objLstShot,indice,'File',params);
    end
    
    est = getEstRemota(ests);
    est = setStack(est,'Normal',0);
    ests = setEstRemota(ests,est);
    shot.objLstEst = ests;
    shots{indice}=shot;
    objLstShot.Shots = shots;

    switch opcionStack
        case 1
            %Acciones stack normal
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setStack(est,'Normal',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            %objLstShot = setStack(objLstShot,indice,'Normal',0);
        case 2
            %Acciones stack robusto
            params = get(handles.txDecision,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setStack(est,'Robusto',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            %objLstShot = setStack(objLstShot,indice,'Robusto',params);
        case 3
            %Acciones stack tiempos
            params = get(handles.txTiempo,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setStack(est,'Tiempos',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            %objLstShot = setStack(objLstShot,indice,'Tiempos',params);
        case 4
            %Acciones stack halvelson
            params = get(handles.txVentana,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setStack(est,'Halvelson',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            %objLstShot = setStack(objLstShot,indice,'Halvelson',params);
        case 5
            %Acciones stack desde archivo
            params = get(handles.txSFile,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setStack(est,'File',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            %objLstShot = setStack(objLstShot,indice,'File',params);
    end
%   set(handles.lsPShot,'String',objLstShot.listarShots);
    actualizarPanel(objLstShot,'proceso',handles);
end

% --- Executes on button press in btQShot.
function btQShot_Callback(hObject, eventdata, handles)
% hObject    handle to btQShot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLABhot
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
indice = get(handles.lsPShot,'Value');
if objLstShot.largo > 0
    objLstShot = sacar(objLstShot,indice);
%   set(handles.lsPShot,'String',objLstShot.listarShots);
    if objLstShot.largo > 0
        if indice-1 == objLstShot.largo
            set(handles.lsPShot,'Value',indice-1);
        end
        actualizarPanel(objLstShot,'proceso',handles);
    else
        set(handles.lsPShot,'Value',1);
        set(handles.lsPShot,'String','Shots');
    end
end




% --- Executes on button press in rbFBanda2.
function rbFBanda_Callback(hObject, eventdata, handles)
% hObject    handle to rbFBanda2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRuido,'Visible','off');
set(handles.pnWeiner,'Visible','off');
set(handles.pn50hz,'Visible','off');
set(handles.pnNivel,'Visible','off');
set(handles.pnBanda,'Visible','on');
% Hint: get(hObject,'Value') returns toggle state of rbFBanda2




% --- Executes on button press in rbSFile2.
function rbSFile_Callback(hObject, eventdata, handles)
% hObject    handle to rbSFile2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRobusto,'Visible','off');
set(handles.pnTiempos,'Visible','off');
set(handles.pnHalvelson,'Visible','off');
set(handles.pnSFile,'Visible','on');
% Hint: get(hObject,'Value') returns toggle state of rbSFile2


function rbFRuido_Callback(hObject, eventdata, handles)
% hObject    handle to rbFBanda2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRuido,'Visible','on');
set(handles.pnWeiner,'Visible','off');
set(handles.pn50hz,'Visible','off');
set(handles.pnNivel,'Visible','off');
set(handles.pnBanda,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbFBanda2






% --- Executes during object creation, after setting all properties.
function pnMedicion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pnMedicion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% % --- Executes on selection change in lsFiltrosEst.
% function lsFiltrosEst_Callback(hObject, eventdata, handles)
% % hObject    handle to lsFiltrosEst (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: contents = get(hObject,'String') returns lsFiltrosEst contents as cell array
% %        contents{get(hObject,'Value')} returns selected item from lsFiltrosEst
% 
% 
% % --- Executes during object creation, after setting all properties.
% function lsFiltrosEst_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to lsFiltrosEst (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: listbox controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% 
% 
% % --- Executes on button press in btAgregarFiltro.
% function btAgregarFiltro_Callback(hObject, eventdata, handles)
% % hObject    handle to btAgregarFiltro (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% 
% % --- Executes on button press in btQuitarFiltro.
% function btQuitarFiltro_Callback(hObject, eventdata, handles)
% % hObject    handle to btQuitarFiltro (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% 
% 
% function txStackEst_Callback(hObject, eventdata, handles)
% % hObject    handle to txStackEst (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of txStackEst as text
% %        str2double(get(hObject,'String')) returns contents of txStackEst as a double


% --- Executes during object creation, after setting all properties.
function pnNormal2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txStackEst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% % --- Executes on button press in btAgregarStack.
% function btAgregarStack_Callback(hObject, eventdata, handles)
% % hObject    handle to btAgregarStack (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% 
% 
% function txFFile2_Callback(hObject, eventdata, handles)
% % hObject    handle to txFFile2 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of txFFile2 as text
% %        str2double(get(hObject,'String')) returns contents of txFFile2 as a double
% 

% % --- Executes during object creation, after setting all properties.
% function txFFile2_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to txFFile2 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% 
% 
% % --- Executes on button press in btFFile2.
% function btFFile2_Callback(hObject, eventdata, handles)
% % hObject    handle to btFFile2 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)



% function txSFile2_Callback(hObject, eventdata, handles)
% % hObject    handle to txSFile2 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of txSFile2 as text
% %        str2double(get(hObject,'String')) returns contents of txSFile2 as a double
% 
% 
% --- Executes during object creation, after setting all properties.
% function txSFile2_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to txSFile2 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end



% % --- Executes during object creation, after setting all properties.
% function ls50hz_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to ls50hz (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: listbox controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% str = cellstr({'Promedio','Rudo','Suave'});
% set(hObject,'String',str);
% 



% --- Executes during object creation, after setting all properties.
function ls50hz2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ls50hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
str = cellstr({'Promedio','Rudo','Suave'});
set(hObject,'String',str);




% --- Executes on button press in rbFRuido.




% --- Executes on button press in rbFWeiner.
function rbFWeiner2_Callback(hObject, eventdata, handles)
% hObject    handle to rbFWeiner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRuido2,'Visible','off');
set(handles.pnWeiner2,'Visible','on');
set(handles.pn50hz2,'Visible','off');
set(handles.pnNivel2,'Visible','off');
set(handles.pnBanda2,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbFWeiner




% --- Executes on button press in rbF50.
function rbF502_Callback(hObject, eventdata, handles)
% hObject    handle to rbF50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.pnRuido2,'Visible','off');
set(handles.pnWeiner2,'Visible','off');
set(handles.pn50hz2,'Visible','on');
set(handles.pnNivel2,'Visible','off');
set(handles.pnBanda2,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbF50




% --- Executes on button press in rbFNivel.
function rbFNivel2_Callback(hObject, eventdata, handles)
% hObject    handle to rbFNivel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRuido2,'Visible','off');
set(handles.pnWeiner2,'Visible','off');
set(handles.pn50hz2,'Visible','off');
set(handles.pnNivel2,'Visible','on');
set(handles.pnBanda2,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbFNivel




% --- Executes on button press in rbSRobusto.
function rbSRobusto2_Callback(hObject, eventdata, handles)
% hObject    handle to rbSRobusto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRobusto2,'Visible','on');
set(handles.pnTiempos2,'Visible','off');
set(handles.pnHalvelson2,'Visible','off');
set(handles.pnSFile2,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbSRobusto




% --- Executes on button press in rbSTiempos.
function rbSTiempos2_Callback(hObject, eventdata, handles)
% hObject    handle to rbSTiempos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRobusto2,'Visible','off');
set(handles.pnTiempos2,'Visible','on');
set(handles.pnHalvelson2,'Visible','off');
set(handles.pnSFile2,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbSTiempos




% --- Executes on button press in rbSHalvelson.
function rbSHalvelson2_Callback(hObject, eventdata, handles)
% hObject    handle to rbSHalvelson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRobusto2,'Visible','off');
set(handles.pnTiempos2,'Visible','off');
set(handles.pnHalvelson2,'Visible','on');
set(handles.pnSFile2,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbSHalvelson




% --- Executes on button press in rbSNormal.
function rbSNormal2_Callback(hObject, eventdata, handles)
% hObject    handle to rbSNormal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRobusto2,'Visible','on');
set(handles.pnTiempos2,'Visible','off');
set(handles.pnHalvelson2,'Visible','off');
set(handles.pnSFile2,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of rbSNormal


% --- Executes on button press in rbFBanda2.
function rbFBanda2_Callback(hObject, eventdata, handles)
% hObject    handle to rbFBanda2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRuido2,'Visible','off');
set(handles.pnWeiner2,'Visible','off');
set(handles.pn50hz2,'Visible','off');
set(handles.pnNivel2,'Visible','off');
set(handles.pnBanda2,'Visible','on');
% Hint: get(hObject,'Value') returns toggle state of rbFBanda2




% --- Executes on button press in rbSFile2.
function rbSFile2_Callback(hObject, eventdata, handles)
% hObject    handle to rbSFile2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pnRobusto2,'Visible','off');
set(handles.pnTiempos2,'Visible','off');
set(handles.pnHalvelson2,'Visible','off');
set(handles.pnSFile2,'Visible','on');
% Hint: get(hObject,'Value') returns toggle state of rbSFile2




% --- Executes during object creation, after setting all properties.
function pn50hz2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pn50hz2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




function txSFile2_Callback(hObject, eventdata, handles)
% hObject    handle to txSFile2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txSFile2 as text
%        str2double(get(hObject,'String')) returns contents of txSFile2 as a double


% --- Executes during object creation, after setting all properties.
function txSFile2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txSFile2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btSFile2.
function btSFile2_Callback(hObject, eventdata, handles)
% hObject    handle to btSFile2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function txFFile2_Callback(hObject, eventdata, handles)
% hObject    handle to txFFile2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txFFile2 as text
%        str2double(get(hObject,'String')) returns contents of txFFile2 as a double


% --- Executes during object creation, after setting all properties.
function txFFile2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txFFile2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btFFile2.
function btFFile2_Callback(hObject, eventdata, handles)
% hObject    handle to btFFile2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in lsFiltrosEst.
function lsFiltrosEst_Callback(hObject, eventdata, handles)
% hObject    handle to lsFiltrosEst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns lsFiltrosEst contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lsFiltrosEst
global objLstShot;
shots = objLstShot.Shots;
shot = shots{get(handles.popShot,'Value')};
ests = shot.objLstEst;
est = get(ests,get(handles.popEstacion,'Value'));
mostrarFiltroStack(getFiltro(est,get(handles.lsFiltrosEst,'Value')),handles);

% --- Executes during object creation, after setting all properties.
function lsFiltrosEst_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lsFiltrosEst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txStackEst_Callback(hObject, eventdata, handles)
% hObject    handle to txStackEst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txStackEst as text
%        str2double(get(hObject,'String')) returns contents of txStackEst as a double


% --- Executes during object creation, after setting all properties.
function txStackEst_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txStackEst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btAgregarFiltro.
function btAgregarFiltro_Callback(hObject, eventdata, handles)
% hObject    handle to btAgregarFiltro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
opcionFiltro = get(handles.pbFRuido2,'Value') + get(handles.rbFWeiner2,'Value')*2 + get(handles.rbF502,'Value')*3 + get(handles.rbFNivel2,'Value')*4 + get(handles.rbFBanda2,'Value')*5;
indiceShot = get(handles.popShot,'Value');
indiceEst = get(handles.popEstacion,'Value');
%handles
if(objLstShot.largo > 0)
    shots = objLstShot.Shots;
    shot = shots{indiceShot};
    ests = shot.objLstEst;
    if  length(ests) >= indiceEst;
        est = get(ests,indiceEst);
    else
        est = getEstRemota(ests);
    end
    switch opcionFiltro
        case 1
            %Acciones filtro Ruido Telurico
            params{1} = get(handles.txImpedancia2,'String');
            params{2} = get(handles.txHxch,'String');
            params{3} = get(handles.txHych,'String');
            params{4} = get(handles.txRGanancia2,'String');
            params{5} = get(handles.txRFMin2,'String');
            params{6} = get(handles.txRFmax2,'String');
            params{7} = get(handles.txRFN,'String');
            %params{8} = get(handles.chRestarRuidoP,'Value');
            params{8} = get(handles.chRestarRuidoP,'Value');
            
%            get(handles.chRestarRuidoP,'index')
            %params{8}= xxx{1};

%            params{9} = get(handles.txHxcal,'String');
%            params{10} = get(handles.txHycal,'String');
            params{9}=get(handles.rtEch,'String');
            params{10}=get(handles.rt50Hz,'Value');
            params{11}=get(handles.rt60Hz,'Value');
            params{12}=get(handles.ftTaper,'String');

            % arriba
            est = agregarFiltro(est,'Telurico',params);
           %abajo
        case 2
            %Acciones filtro de Weiner
            params = get(handles.txVarianza2,'String');
%             shots = objLstShot.Shots;
%             shot = shots{indiceShot};
%             ests = shot.objLstEst;
%             est = get(ests,indiceEst);
            est = agregarFiltro(est,'Weiner',params);
%             ests = set(ests,est,indiceEst);
%             shot.objLstEst = ests;
%             shots{indiceShot}=shot;
%             objLstShot.Shots = shots;
            %
        case 3
            %Acciones filtro de 50 hz
            func = get(handles.ls50hz2,'Value');
            params = num2str(func); %recupera el nombre del filtro a partir de un indice
%             shots = objLstShot.Shots;
%             shot = shots{indiceShot};
%             ests = shot.objLstEst;
%             est = get(ests,indiceEst);
            est = agregarFiltro(est,'50 hz',params);
%             ests = set(ests,est,indiceEst);
%             shot.objLstEst = ests;
%             shots{indiceShot}=shot;
%             objLstShot.Shots = shots;
        case 4
            % Acciones Filtro de Nivel
            params{1} = get(handles.txLimSuperior2,'String');
            params{2} = get(handles.txLimInferior2,'String');
            params{3} = get(handles.btNivelHorizontal,'Value')*1 + get(handles.btNivelVertical,'Value')*2;
            params{4} = get(handles.rbRellenarCeros,'Value')*1 + get(handles.rbCortarSenal,'Value')*2;
            est = agregarFiltro(est,'Nivel',params);
        case 5
            %Acciones filtro pasa banda
            params{1} = get(handles.txF02,'String');
            params{2} = get(handles.txF12,'String');
            params{3} = get(handles.txF22,'String');
            params{4} = get(handles.txF32,'String');
            params{5} = get(handles.txG02,'String');
            params{6} = get(handles.txG12,'String');
            params{7} = get(handles.txG22,'String');
            params{8} = get(handles.txG32,'String');
            params{9} = get(handles.chBandaRuido,'Value');
            est = agregarFiltro(est,'Banda',params);
            
%         case 6
%             %Acciones filtro A. R.
%             params{1} = get(handles.txLimSuperior2,'String');
%             params{2} = get(handles.txLimInferior2,'String');
% %             shots = objLstShot.Shots;
% %             shot = shots{indiceShot};
% %             ests = shot.objLstEst;
% %             est = get(ests,indiceEst);
%             est = agregarFiltro(est,'AR',params);
% %             ests = set(ests,est,indiceEst);
% %             shot.objLstEst = ests;
% %             shots{indiceShot}=shot;
% %             objLstShot.Shots = shots;
%         case 7
%             %Acciones filtro desde archivo
%             params = get(handles.txFFile2,'String');
% %             shots = objLstShot.Shots;
% %             shot = shots{indiceShot};
% %             ests = shot.objLstEst;
% %             est = get(ests,indiceEst);
%             est = setFiltro(est,'File',params);
% %             ests = set(ests,est,indiceEst);
% %             shot.objLstEst = ests;
% %             shots{indiceShot}=shot;
% %             objLstShot.Shots = shots;
    end
    if  length(ests) >= indiceEst;
        ests = set(ests,est,indiceEst);
    else
        ests = setEstRemota(ests,est);
    end
    shot.objLstEst = ests;
    shots{indiceShot}=shot;
    objLstShot.Shots = shots;
end
shots = objLstShot.Shots;
ests = shots{indiceShot}.objLstEst;
    if  length(ests) >= indiceEst;
        est = get(ests,indiceEst);
        set(handles.lsFiltrosEst,'String',toString(get(est,'lstFiltros')));
    else
        est = getEstRemota(ests);
        set(handles.lsFiltrosEst,'String',toString(get(est,'lstFiltros')));
    end
    


% --- Executes on button press in btAgregarStack.
function btAgregarStack_Callback(hObject, eventdata, handles)
% hObject    handle to btAgregarStack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
opcionStack = get(handles.rbSNormal2,'Value')*1 + get(handles.rbSRobusto2,'Value')*2 + get(handles.rbSTiempos2,'Value')*3 + get(handles.rbSHalvelson2,'Value')*4 + get(handles.rbSFile2,'Value')*5
indiceShot = get(handles.popShot,'Value');
indiceEst = get(handles.popEstacion,'Value');

if objLstShot.largo > 0
   switch opcionStack
        case 1
            %Acciones stack normal
            params{1} = '0';
            params{2} = get(handles.edit77,'String'); %syncro coef.

            shots = objLstShot.Shots;
            shot = shots{indiceShot};
            ests = shot.objLstEst;
            est = get(ests,indiceEst);
            est = setStack(est,'Normal',params);
            ests = set(ests,est,indiceEst);
            shot.objLstEst = ests;
            shots{indiceShot}=shot;
            objLstShot.Shots = shots;
        case 2
            %Acciones stack robusto
            params{1} = get(handles.txDecision2,'String');
            params{2} = get(handles.edit77,'String'); %syncro coef.
            
            shots = objLstShot.Shots;
            shot = shots{indiceShot};
            ests = shot.objLstEst;
            est = get(ests,indiceEst);
            est = setStack(est,'Robusto',params);
            ests = set(ests,est,indiceEst);
            shot.objLstEst = ests;
            shots{indiceShot}=shot;
            objLstShot.Shots = shots;
%         case 3
%             %Acciones stack tiempos
%             params = get(handles.txTiempo2,'String');
%             shots = objLstShot.Shots;
%             shot = shots{indiceShot};
%             ests = shot.objLstEst;
%             est = get(ests,indiceEst);
%             est = setStack(est,'Tiempos',params);
%             ests = set(ests,est,indiceEst);
%             shot.objLstEst = ests;
%             shots{indiceShot}=shot;
%             objLstShot.Shots = shots;
%         case 4
%             %Acciones stack halvelson
%             params = get(handles.txVentana2,'String');
%             shots = objLstShot.Shots;
%             shot = shots{indiceShot};
%             ests = shot.objLstEst;
%             est = get(ests,indiceEst);
%             est = setStack(est,'Halvelson',params);
%             ests = set(ests,est,indiceEst);
%             shot.objLstEst = ests;
%             shots{indiceShot}=shot;
%             objLstShot.Shots = shots;
%         case 5
%             %Acciones stack desde archivo
%             params = get(handles.txSFile2,'String');
%             shots = objLstShot.Shots;
%             shot = shots{indiceShot};
%             ests = shot.objLstEst;
%             est = get(ests,indiceEst);
%             est = setStack(est,'File',params);
%             ests = set(ests,est,indiceEst);
%             shot.objLstEst = ests;
%             shots{indiceShot}=shot;
%             objLstShot.Shots = shots;
    end
end

 shots = objLstShot.Shots;
 ests = shots{indiceShot}.objLstEst;
 est = get(ests,indiceEst);
 stack = get(est,'stack');
 set(handles.txStackEst,'String',stack.nombre);


% --- Executes on button press in btQuitarFiltro.
function btQuitarFiltro_Callback(hObject, eventdata, handles)
% hObject    handle to btQuitarFiltro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)global
% objLstShot;
global objLstShot;
indiceShot = get(handles.popShot,'Value');
indiceEst = get(handles.popEstacion,'Value');
indiceFiltro = get(handles.lsFiltrosEst,'Value');
shots = objLstShot.Shots;
shot = shots{indiceShot};
ests = shot.objLstEst;
est = get(ests,indiceEst);
lstFiltros = get(est,'lstFiltros');

if length(lstFiltros.filtros) > 0
    est = sacarFiltro(est,indiceFiltro);
    ests = set(ests,est,indiceEst);
    shot.objLstEst = ests;
    shots{indiceShot} = shot;
    objLstShot.Shots = shots;
    lstFiltros = get(est,'lstFiltros');
    if length(lstFiltros.filtros) > 0
        if indiceFiltro-1 == length(lstFiltros.filtros);
            set(handles.lsFiltrosEst,'Value',indiceFiltro-1);
            indiceFiltro = indiceFiltro-1;
        end
        set(handles.lsFiltrosEst,'String',toString(get(est,'lstFiltros')));
        mostrarFiltroStack(getFiltro(est,indiceFiltro),handles);
    else
        set(handles.lsFiltrosEst,'Value',1);
        set(handles.lsFiltrosEst,'String','Filtros');
    end
end



% --- Executes on selection change in ls50hz.
function ls50hz_Callback(hObject, eventdata, handles)
% hObject    handle to ls50hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns ls50hz contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ls50hz




% --- Executes on button press in btGraficarEst.
function btGraficarEst_Callback(hObject, ~, handles)
% hObject    handle to btGraficarEst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
shots = objLstShot.Shots;
%valor = get(handles.popShot,'Value');
%ests = shots{valor}.objLstEst;
%valor = get(handles.popEstacion,'Value');

%valor
valor = get(handles.popShot,'Value');
shot = shots{valor};
valor = get(handles.popEstacion,'Value');
ests = shot.objLstEst;

length(ests)
if length(ests) >= valor
    est = get(ests,valor);
else
%     'nose'
     est = getEstRemota(ests);
 end
 %'hola2'
graficarSenales(handles,est);


% --- Executes on button press in btCargarDatos.
function btCargarDatos_Callback(hObject, eventdata, handles)
% hObject    handle to btCargarDatos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;

%h = waitbar(0,'Cargando...');
progressbar('Loading...');
liberar;
shots = objLstShot.Shots;
valor = get(handles.popShot,'Value');
ests = shots{valor}.objLstEst;
largo = length(ests);
disp(['longitud ',num2str(largo)]);
% if largo >= get(handles.popEstacion,'Value')
    for i=1:largo
        est = get(ests,i);
        X = TSNfiles;
        est = set(est,'X',open_TSN(X,get(est,'file'),get(est,'canal')));
%        est = calibrar(est);
%        X = open_TSN(X,get(est,'file'),1);
        X = open_TSN(X,get(est,'fileFiltrada'),1);       
        est = set(est,'senalFiltrada',X);
        est = set(est,'senalFiltradaAnt',X);
        ests = set(ests,est,i);
        %disp(i);
        progressbar(i/largo);
    end
%else
    file0=get(est,'file');
    est = getEstRemota(ests);
    file1=get(est,'file');
    global estRemota;
    dN=str2num(get(handles.ftTaper,'String'));
    X=readsincroTSN(file0,file1,dN);
    estRemota=set(est,'X',X);
    
%    estRemota = cargarRemota(est);
%     X = TSNfiles;
%     est = set(est,'X',open_TSN_All(X,get(est,'file')));
%     est = set(est,'X',open_TSN(X,get(est,'file'),get(est,'canal')));
%     est = calibrar(est);
%     ests = setEstRemota(ests,est);
%end

shots{valor}.objLstEst = ests;
objLstShot.Shots = shots;
progressbar(1);
%close(h);


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in pushbutton69.
function pushbutton69_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

zoom(handles.grSenales,'on');




% --- Executes on button press in pushbutton70.
function pushbutton70_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton70 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pan(handles.grSenales,'on');


% --- Executes on button press in pushbutton71.
function pushbutton71_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
shots = objLstShot.Shots;
shot = shots{get(handles.popShot,'Value')};
ests = shot.objLstEst;
est = get(ests,get(handles.popEstacion,'Value'));
graficarSenalesOff(handles,est);
zoom(handles.grSenales,'out');
pan(handles.grSenales,'off');
zoom(handles.grSenales,'off');



% --- Executes on button press in btMostrarStack.
function btMostrarStack_Callback(hObject, eventdata, handles)
% hObject    handle to btMostrarStack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global objLstShot;
shots = objLstShot.Shots;
shot = shots{get(handles.popShot,'Value')};
ests = shot.objLstEst;
est = get(ests,get(handles.popEstacion,'Value'));
mostrarFiltroStack(get(est,'stack'),handles);


% --- Executes on button press in btModificarFiltro.
function btModificarFiltro_Callback(hObject, eventdata, handles)
% hObject    handle to btModificarFiltro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
opcionFiltro = get(handles.pbFRuido2,'Value') + get(handles.rbFWeiner2,'Value')*2 + get(handles.rbF502,'Value')*3 + get(handles.rbFNivel2,'Value')*4 + get(handles.rbFBanda2,'Value')*5;
indiceShot = get(handles.popShot,'Value');
indiceEst = get(handles.popEstacion,'Value');
indiceFiltro = get(handles.lsFiltrosEst,'Value');
if(objLstShot.largo > 0)
    shots = objLstShot.Shots;
    shot = shots{indiceShot};
    ests = shot.objLstEst;
    if  length(ests) >= indiceEst;
        est = get(ests,indiceEst);
    else
        est = getEstRemota(ests);
    end
    switch opcionFiltro
        case 1
            %Acciones filtro Ruido Telurico
            params{1} = get(handles.txImpedancia2,'String');
            params{2} = get(handles.txHxch,'String');
            params{3} = get(handles.txHych,'String');
            params{4} = get(handles.txRGanancia2,'String');
            params{5} = get(handles.txRFMin2,'String');
            params{6} = get(handles.txRFmax2,'String');
            params{7} = get(handles.txRFN,'String');
            params{8} = get(handles.chRestarRuidoP,'Value');
            %params{8}= xxx{1};
            params{9}=get(handles.rtEch,'String');
            params{10}=get(handles.rt50Hz,'Value');
            params{11}=get(handles.rt60Hz,'Value');
            params{12}=get(handles.ftTaper,'String');

            % arriba
            est = modificarFiltro(est,'Telurico',params,indiceFiltro);
           %abajo
        case 2
            %Acciones filtro de Weiner
            params = get(handles.txVarianza2,'String');
%             shots = objLstShot.Shots;
%             shot = shots{indiceShot};
%             ests = shot.objLstEst;
%             est = get(ests,indiceEst);
            est = modificarFiltro(est,'Weiner',params,indiceFiltro);
%             ests = set(ests,est,indiceEst);
%             shot.objLstEst = ests;
%             shots{indiceShot}=shot;
%             objLstShot.Shots = shots;
            %
        case 3
            %Acciones filtro de 50 hz
            func = get(handles.ls50hz2,'Value');
            params = num2str(func); %recupera el nombre del filtro a partir de un indice
%             shots = objLstShot.Shots;
%             shot = shots{indiceShot};
%             ests = shot.objLstEst;
%             est = get(ests,indiceEst);
            est = modificarFiltro(est,'50 hz',params,indiceFiltro);
%             ests = set(ests,est,indiceEst);
%             shot.objLstEst = ests;
%             shots{indiceShot}=shot;
%             objLstShot.Shots = shots;
        case 4
            % Acciones Filtro de Nivel
            params{1} = get(handles.txLimSuperior2,'String');
            params{2} = get(handles.txLimInferior2,'String');
            params{3} = get(handles.btNivelHorizontal,'Value')*1 + get(handles.btNivelVertical,'Value')*2;
            params{4} = get(handles.rbRellenarCeros,'Value')*1 + get(handles.rbCortarSenal,'Value')*2;
            est = modificarFiltro(est,'Nivel',params,indiceFiltro);
        case 5
            %Acciones filtro pasa banda
            params{1} = get(handles.txF02,'String');
            params{2} = get(handles.txF12,'String');
            params{3} = get(handles.txF22,'String');
            params{4} = get(handles.txF32,'String');
            params{5} = get(handles.txG02,'String');
            params{6} = get(handles.txG12,'String');
            params{7} = get(handles.txG22,'String');
            params{8} = get(handles.txG32,'String');
            params{9} = get(handles.chBandaRuido,'Value');
            est = modificarFiltro(est,'Banda',params,indiceFiltro);
            
%         case 6
%             %Acciones filtro A. R.
%             params{1} = get(handles.txLimSuperior2,'String');
%             params{2} = get(handles.txLimInferior2,'String');
% %             shots = objLstShot.Shots;
% %             shot = shots{indiceShot};
% %             ests = shot.objLstEst;
% %             est = get(ests,indiceEst);
%             est = agregarFiltro(est,'AR',params);
% %             ests = set(ests,est,indiceEst);
% %             shot.objLstEst = ests;
% %             shots{indiceShot}=shot;
% %             objLstShot.Shots = shots;
%         case 7
%             %Acciones filtro desde archivo
%             params = get(handles.txFFile2,'String');
% %             shots = objLstShot.Shots;
% %             shot = shots{indiceShot};
% %             ests = shot.objLstEst;
% %             est = get(ests,indiceEst);
%             est = setFiltro(est,'File',params);
% %             ests = set(ests,est,indiceEst);
% %             shot.objLstEst = ests;
% %             shots{indiceShot}=shot;
% %             objLstShot.Shots = shots;
    end
    if  length(ests) >= indiceEst;
        ests = set(ests,est,indiceEst);
    else
        ests = setEstRemota(ests,est);
    end
    shot.objLstEst = ests;
    shots{indiceShot}=shot;
    objLstShot.Shots = shots;
end
shots = objLstShot.Shots;
ests = shots{indiceShot}.objLstEst;
if  length(ests) >= indiceEst;
    est = get(ests,indiceEst);
    set(handles.lsFiltrosEst,'String',toString(get(est,'lstFiltros')));
else
    est = getEstRemota(ests);
    set(handles.lsFiltrosEst,'String',toString(get(est,'lstFiltros')));
end
    



% --- Executes during object creation, after setting all properties.
function grCargabilidad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to grCargabilidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate grCargabilidad




% --- Executes on button press in pushbutton74.
function pushbutton74_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
indiceShot = get(handles.popShot,'Value');
shots = objLstShot.Shots;
shot = shots{indiceShot};
progressbar('Processing...');
shot = procesar(shot);
shots{indiceShot} = shot;
objLstShot.Shots = shots;
progressbar(1);




% --- Executes during object creation, after setting all properties.
function pnResultados_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pnResultados (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton51.
function pushbutton51_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
global pathGlobal;
[file,path]=uiputfile({'*.dat','Archivo de datos UBC'},'Archivo UBC',pathGlobal);
if isequal(file,0)
    disp('cancel')
else
    pathGlobal = path;
    file=agregarExtension(file,'dat');
    archivo = [path,file];
    toUBC(objLstShot,archivo);
end


% --- Executes on button press in chSDecaimiento.
function chSDecaimiento_Callback(hObject, eventdata, handles)
% hObject    handle to chSDecaimiento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chSDecaimiento
if get(hObject,'Value') == 1
    set(handles.chSCruda,'Enable','off');
    set(handles.chSStack,'Enable','off');
    set(handles.chSProcesada,'Enable','off');
    set(handles.chSRuido,'Enable','off');
    set(handles.chSMiniStack,'Enable','off');
else
    set(handles.chSCruda,'Enable','on');
    set(handles.chSStack,'Enable','on');
    set(handles.chSProcesada,'Enable','on');
    set(handles.chSRuido,'Enable','on');
    set(handles.chSMiniStack,'Enable','on');
end

% --- Executes on button press in pushbutton75.
function pushbutton75_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%a = gca(handles.grSenales);
set(handles.grSenales,'Xscale','log');



% --- Executes on button press in pushbutton76.
function pushbutton76_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton76 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.grSenales,'Yscale','log');


% --- Executes on button press in pushbutton77.
function pushbutton77_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.grSenales,'Xscale','lin');
set(handles.grSenales,'Yscale','lin');




% --- Executes on button press in chSMiniStack.
function chSMiniStack_Callback(hObject, eventdata, handles)
% hObject    handle to chSMiniStack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chSMiniStack
if get(hObject,'Value') == 1
    set(handles.chSCruda,'Enable','off');
    set(handles.chSStack,'Enable','off');
    set(handles.chSProcesada,'Enable','off');
    set(handles.chSRuido,'Enable','off');
    set(handles.chSDecaimiento,'Enable','off');
else
    set(handles.chSCruda,'Enable','on');
    set(handles.chSStack,'Enable','on');
    set(handles.chSProcesada,'Enable','on');
    set(handles.chSRuido,'Enable','on');
    set(handles.chSDecaimiento,'Enable','on');
end



% --- Executes on button press in chSStack.
function chSStack_Callback(hObject, eventdata, handles)
% hObject    handle to chSStack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chSStack
if get(hObject,'Value') == 1
    set(handles.chSCruda,'Enable','off');
    set(handles.chSMiniStack,'Enable','off');
    set(handles.chSProcesada,'Enable','off');
    set(handles.chSRuido,'Enable','off');
    set(handles.chSDecaimiento,'Enable','off');
else
    set(handles.chSCruda,'Enable','on');
    set(handles.chSMiniStack,'Enable','on');
    set(handles.chSProcesada,'Enable','on');
    set(handles.chSRuido,'Enable','on');
    set(handles.chSDecaimiento,'Enable','on');
end




% --- Executes on selection change in lsFiltrosAp.
function lsFiltrosAp_Callback(hObject, eventdata, handles)
% hObject    handle to lsFiltrosAp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns lsFiltrosAp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lsFiltrosAp
global objLstShot;
shots = objLstShot.Shots;
shot = shots{get(handles.lsPShot,'Value')};
ests = shot.objLstEst;
est = get(ests,1);
filtros = get(est,'lstFiltros');
if length(filtros.filtros) > 0
    mostrarFiltroStackP(getFiltro(est,get(handles.lsFiltrosAp,'Value')),handles);
end

% --- Executes during object creation, after setting all properties.
function lsFiltrosAp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lsFiltrosAp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txStackAp_Callback(hObject, eventdata, handles)
% hObject    handle to txStackAp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txStackAp as text
%        str2double(get(hObject,'String')) returns contents of txStackAp as a double


% --- Executes during object creation, after setting all properties.
function txStackAp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txStackAp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton78.
function pushbutton78_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
indice = get(handles.lsPShot,'Value');
indiceEst = 1;
indiceFiltro = get(handles.lsFiltrosAp,'Value');
shots = objLstShot.Shots;
shot = shots{indice};
ests = shot.objLstEst;
for i=1:length(ests)
    est = get(ests,i);
    lstFiltros = get(est,'lstFiltros');
    if length(lstFiltros.filtros) > 0
        est = sacarFiltro(est,indiceFiltro);
    end
    ests = set(ests,est,i);
    shot.objLstEst = ests;
    shots{indice}=shot;
    objLstShot.Shots = shots;
end
est = getEstRemota(ests);
lstFiltros = get(est,'lstFiltros');
if length(lstFiltros.filtros) > 0
    est = sacarFiltro(est,indiceFiltro);
end
ests = setEstRemota(ests,est);
shot.objLstEst = ests;
shots{indice}=shot;
objLstShot.Shots = shots;
est = get(ests,1);
lstFiltros = get(est,'lstFiltros');
if length(lstFiltros.filtros) > 0
    if indiceFiltro-1 == length(lstFiltros.filtros);
        set(handles.lsFiltrosAp,'Value',indiceFiltro-1);
        indiceFiltro = indiceFiltro-1;
    end
    set(handles.lsFiltrosAp,'String',toString(get(est,'lstFiltros')));
    mostrarFiltroStackP(getFiltro(est,indiceFiltro),handles);
else
    set(handles.lsFiltrosAp,'Value',1);
    set(handles.lsFiltrosAp,'String','Filtros');
end


% --- Executes on button press in pushbutton79.
function pushbutton79_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
opcionFiltro = get(handles.rbFRuido,'Value') + get(handles.rbFWeiner,'Value')*2 + get(handles.rbF50,'Value')*3 + get(handles.rbFNivel,'Value')*4 + get(handles.rbFBanda,'Value')*5;
indice = get(handles.lsPShot,'Value');

if objLstShot.largo > 0
    switch opcionFiltro
        case 1
            %Acciones filtro Ruido Telurico
            reffile = get(handles.txImpedancia2x,'String');
            params{2} = get(handles.txHxchx,'String');
            params{3} = get(handles.txHychx,'String');
            params{4} = get(handles.txRGanancia2x,'String');
            params{5} = get(handles.txRFMin2x,'String');
            params{6} = get(handles.txRFmax2x,'String');
            params{7} = get(handles.txRFNx,'String');
            params{8} = get(handles.chRestarRuidoPx,'Value');
            params{9}=get(handles.rtEchx,'String');
            params{10}=get(handles.rt50Hzx,'Value');
            params{11}=get(handles.rt60Hzx,'Value');
            params{12}=get(handles.ftTaperx,'String');
            
%            params{1} = get(handles.txImpedancia,'String');
%            params{2} = get(handles.txCRemoto,'String');
%            params{3} = get(handles.txRGanancia,'String');
%            params{4} = get(handles.txRFMax,'String');
%            params{5} = get(handles.txRFMin,'String');
%            params{6} = get(handles.txImpedancia,'String');
%            params{7} = get(handles.chRestarRuidoP,'Value');
%            %fid = fopen(params{1},'rt');
        fid=fopen(reffile,'rt');
        str = fgetl(fid);
        i=1;
        while(ischar(str))
            datos = strread(str,'%s');
            dist(i)=str2num(datos{1});
            files{i}=datos{2};
            i=i+1;
            str=fgetl(fid);
        end

        %global objLstShot;
        %indice = get(handles.lsPShot,'Value');
        %indiceEst = get(handles.popEstacion,'Value');
        %shots = objLstShot.Shots;
        %shot = shots{indice};
        %ests = shot.objLstEst;
        %est = get(ests,indiceEst);
            
            
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
%                params{1}

                est = get(ests,i);
                Xr1=get(est,'Xr1');
                Xr2=get(est,'Xr2');

                d = (Xr1+Xr2)/2;
                [a,b]=min(abs(dist-d));
        %set(handles.txImpedancia2,'String',files{b});
                params{1}=files{b};
                disp([get(est,'filename') ' ' num2str(Xr1) ' ' num2str(Xr2) ' ' params{1}]);
                A=dir(files{b});
                if isempty(A)
                    dir('error!!!!')
                    return;
                end
                est = agregarFiltro(est,'Telurico',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = agregarFiltro(est,'Telurico',params);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
            %objLstShot = setFiltro(objLstShot,indice,'Telurico',params);
        case 2
            %Acciones filtro de Weiner
            params = get(handles.txVarianza,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = agregarFiltro(est,'Weiner',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = agregarFiltro(est,'Weiner',params);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
            %objLstShot = setFiltro(objLstShot,indice,'Weiner',params);
        case 3
            %Acciones filtro de 50 hz
            func = get(handles.ls50hz,'Value');
            params = num2str(func); %recupera el nombre del filtro a partir de un indice
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = agregarFiltro(est,'50 hz',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = agregarFiltro(est,'50 hz',params);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
            %objLstShot = setFiltro(objLstShot,indice,'50 hz',params);
        case 4
            % Acciones Filtro de Nivel
            params{1} = get(handles.txLimSuperior,'String');
            params{2} = get(handles.txLimInferior,'String');
            params{3} = get(handles.rbNHorizontal,'Value')*1 + get(handles.rbNVertical,'Value')*2;
            params{4} = get(handles.rbNCeros,'Value')*1 + get(handles.rbNCorte,'Value')*2;
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = agregarFiltro(est,'Nivel',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = agregarFiltro(est,'Nivel',params);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
            
        case 5
            %Acciones filtro pasa banda
            params{1} = get(handles.txF0,'String');
            params{2} = get(handles.txF1,'String');
            params{3} = get(handles.txF2,'String');
            params{4} = get(handles.txF3,'String');
            params{5} = get(handles.txG0,'String');
            params{6} = get(handles.txG1,'String');
            params{7} = get(handles.txG2,'String');
            params{8} = get(handles.txG3,'String');
            params{9} = get(handles.chRestarBandaP,'Value');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = agregarFiltro(est,'Banda',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = agregarFiltro(est,'Banda',params);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
%         case 6
%             %Acciones filtro desde archivo
%             params = get(handles.txFFile,'String');
%             shots = objLstShot.Shots;
%             shot = shots{indice};
%             ests = shot.objLstEst;
%             for i=1:length(ests)
%                 est = get(ests,i);
%                 est = agregarFiltro(est,'File',params);
%                 ests = set(ests,est,i);
%                 shot.objLstEst = ests;
%                 shots{indice}=shot;
%                 objLstShot.Shots = shots;
%             end
%             est = getEstRemota(ests);
%             est = agregarFiltro(est,'File',params);
%             ests = setEstRemota(ests,est);
%             shot.objLstEst = ests;
%             shots{indice}=shot;
%             objLstShot.Shots = shots;
%             %objLstShot = setFiltro(objLstShot,indice,'File',params);
%         case 7
%             %Acciones filtro A. R.
%             params{1} = get(handles.txLimSuperior,'String');
%             params{2} = get(handles.txNDecision,'String');
%             shots = objLstShot.Shots;
%             shot = shots{indice};
%             ests = shot.objLstEst;
%             for i=1:length(ests)
%                 est = get(ests,i);
%                 est = agregarFiltro(est,'AR',params);
%                 ests = set(ests,est,i);
%                 shot.objLstEst = ests;
%                 shots{indice}=shot;
%                 objLstShot.Shots = shots;
%             end
%             est = getEstRemota(ests);
%             est = agregarFiltro(est,'AR',params);
%             ests = setEstRemota(ests,est);
%             shot.objLstEst = ests;
%             shots{indice}=shot;
%             objLstShot.Shots = shots;
%             %objLstShot = setFiltro(objLstShot,indice,'AR',params);

    end
end
shots = objLstShot.Shots;
ests = shots{indice}.objLstEst;
est = get(ests,1);
set(handles.lsFiltrosAp,'String',toString(get(est,'lstFiltros')));



% --- Executes on button press in pushbutton80.
function pushbutton80_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton80 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
opcionStack = get(handles.rbSNormal,'Value')*1 + get(handles.rbSRobusto,'Value')*2 + get(handles.rbSTiempos,'Value')*3 + get(handles.rbSHalvelson,'Value')*4 + get(handles.rbSFile2,'Value')*5;
indice = get(handles.lsPShot,'Value');

if objLstShot.largo > 0
    shots = objLstShot.Shots;
    shot = shots{indice};
    ests = shot.objLstEst;
    est = getEstRemota(ests);
    est = setStack(est,'Normal',{'0','0'});
    ests = setEstRemota(ests,est);
    shot.objLstEst = ests;
    shots{indice}=shot;
    objLstShot.Shots = shots;
    switch opcionStack
        case 1
            %Acciones stack normal
            params{1} = '0';
            params{2} = get(handles.edit78,'String');

            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setStack(est,'Normal',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            %objLstShot = setStack(objLstShot,indice,'Normal',0);
        case 2
            %Acciones stack robusto
            params{1} = get(handles.txDecision,'String');
            params{2} = get(handles.edit78,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setStack(est,'Robusto',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            %objLstShot = setStack(objLstShot,indice,'Robusto',params);
        case 3
            %Acciones stack tiempos
            params = get(handles.txTiempo,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setStack(est,'Tiempos',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            %objLstShot = setStack(objLstShot,indice,'Tiempos',params);
        case 4
            %Acciones stack halvelson
            params = get(handles.txVentana,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setStack(est,'Halvelson',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            %objLstShot = setStack(objLstShot,indice,'Halvelson',params);
        case 5
            %Acciones stack desde archivo
            params = get(handles.txSFile,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = setStack(est,'File',params);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            %objLstShot = setStack(objLstShot,indice,'File',params);
    end
    shots = objLstShot.Shots;
    ests = shots{indice}.objLstEst;
    est = get(ests,1);
    stack = get(est,'stack');
    set(handles.txStackAp,'String',stack.nombre);
end

% --- Executes on button press in pushbutton81.
function pushbutton81_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
opcionFiltro = get(handles.rbFRuido,'Value') + get(handles.rbFWeiner,'Value')*2 + get(handles.rbF50,'Value')*3 + get(handles.rbFNivel,'Value')*4 + get(handles.rbFBanda,'Value')*5;
indice = get(handles.lsPShot,'Value');
indiceFiltro = get(handles.lsFiltrosAp,'Value');

if(objLstShot.largo > 0)
    switch opcionFiltro
        case 1
            %Acciones filtro Ruido Telurico
%            params{1} = get(handles.txImpedancia,'String');
%            params{2} = get(handles.txCRemoto,'String');
%            params{3} = get(handles.txRGanancia,'String');
%            params{4} = get(handles.txRFMax,'String');
%            params{5} = get(handles.txRFMin,'String');
%            params{6} = '';
%            params{7} = get(handles.chRestarRuidoP,'Value');
            reffile = get(handles.txImpedancia2x,'String');
            params{2} = get(handles.txHxchx,'String');
            params{3} = get(handles.txHychx,'String');
            params{4} = get(handles.txRGanancia2x,'String');
            params{5} = get(handles.txRFMin2x,'String');
            params{6} = get(handles.txRFmax2x,'String');
            params{7} = get(handles.txRFNx,'String');
            params{8} = get(handles.chRestarRuidoPx,'Value');
            params{9}=get(handles.rtEchx,'String');
            params{10}=get(handles.rt50Hzx,'Value');
            params{11}=get(handles.rt60Hzx,'Value');
            params{12}=get(handles.ftTaperx,'String');


        fid=fopen(reffile,'rt');
        str = fgetl(fid);
        i=1;
        while(ischar(str))
            datos = strread(str,'%s');
            dist(i)=str2num(datos{1});
            files{i}=(datos{2});
            i=i+1;
            str=fgetl(fid);
        end

        %global objLstShot;
        %indice = get(handles.lsPShot,'Value');
        %indiceEst = get(handles.popEstacion,'Value');
        %shots = objLstShot.Shots;
        %shot = shots{indice};
        %ests = shot.objLstEst;
        %est = get(ests,indiceEst);
            
            
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
%                params{1}

                est = get(ests,i);
                Xr1=get(est,'Xr1');
                Xr2=get(est,'Xr2');
                d = (Xr1+Xr2)/2;
                [a,b]=min(abs(dist-d));
        %set(handles.txImpedancia2,'String',files{b});
                params{1}=files{b};
                
                               
                %UKSHKJSA
                disp([get(est,'filename') ' ' num2str(Xr1) ' ' num2str(Xr2) ' ' params{1}]);
               
                %HAJSHAS
                
                A=dir(files{b});
                if isempty(A)
                    dir('error!!!!')
                    return;
                end
                est = modificarFiltro(est,'Telurico',params,indiceFiltro);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = modificarFiltro(est,'Telurico',params,indiceFiltro);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
            %objLstShot = setFiltro(objLstShot,indice,'Telurico',params);
        case 2
            %Acciones filtro de Weiner
            params = get(handles.txVarianza,'String');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = modificarFiltro(est,'Weiner',params,indiceFiltro);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = modificarFiltro(est,'Weiner',params,indiceFiltro);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
            %objLstShot = setFiltro(objLstShot,indice,'Weiner',params);
        case 3
            %Acciones filtro de 50 hz
            func = get(handles.ls50hz,'Value');
            params = num2str(func); %recupera el nombre del filtro a partir de un indice
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = modificarFiltro(est,'50 hz',params,indiceFiltro);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = modificarFiltro(est,'50 hz',params,indiceFiltro);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
            %objLstShot = setFiltro(objLstShot,indice,'50 hz',params);
        case 4
            % Acciones Filtro de Nivel
            params{1} = get(handles.txLimSuperior,'String');
            params{2} = get(handles.txLimInferior,'String');
            params{3} = get(handles.rbNHorizontal,'Value')*1 + get(handles.rbNVertical,'Value')*2;
            params{4} = get(handles.rbNCeros,'Value')*1 + get(handles.rbNCorte,'Value')*2;
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = modificarFiltro(est,'Nivel',params,indiceFiltro);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = modificarFiltro(est,'Nivel',params,indiceFiltro);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
            
        case 5
            %Acciones filtro pasa banda
            params{1} = get(handles.txF0,'String');
            params{2} = get(handles.txF1,'String');
            params{3} = get(handles.txF2,'String');
            params{4} = get(handles.txF3,'String');
            params{5} = get(handles.txG0,'String');
            params{6} = get(handles.txG1,'String');
            params{7} = get(handles.txG2,'String');
            params{8} = get(handles.txG3,'String');
            params{9} = get(handles.chRestarBandaP,'Value');
            shots = objLstShot.Shots;
            shot = shots{indice};
            ests = shot.objLstEst;
            for i=1:length(ests)
                est = get(ests,i);
                est = modificarFiltro(est,'Banda',params,indiceFiltro);
                ests = set(ests,est,i);
                shot.objLstEst = ests;
                shots{indice}=shot;
                objLstShot.Shots = shots;
            end
            est = getEstRemota(ests);
            est = modificarFiltro(est,'Banda',params,indiceFiltro);
            ests = setEstRemota(ests,est);
            shot.objLstEst = ests;
            shots{indice}=shot;
            objLstShot.Shots = shots;
%         case 6
%             %Acciones filtro desde archivo
%             params = get(handles.txFFile,'String');
%             shots = objLstShot.Shots;
%             shot = shots{indice};
%             ests = shot.objLstEst;
%             for i=1:length(ests)
%                 est = get(ests,i);
%                 est = modificarFiltro(est,'File',params,indiceFiltro);
%                 ests = set(ests,est,i);
%                 shot.objLstEst = ests;
%                 shots{indice}=shot;
%                 objLstShot.Shots = shots;
%             end
%             est = getEstRemota(ests);
%             est = modificarFiltro(est,'File',params,indiceFiltro);
%             ests = setEstRemota(ests,est);
%             shot.objLstEst = ests;
%             shots{indice}=shot;
%             objLstShot.Shots = shots;
%             %objLstShot = setFiltro(objLstShot,indice,'File',params);
%         case 7
%             %Acciones filtro A. R.
%             params{1} = get(handles.txLimSuperior,'String');
%             params{2} = get(handles.txNDecision,'String');
%             shots = objLstShot.Shots;
%             shot = shots{indice};
%             ests = shot.objLstEst;
%             for i=1:length(ests)
%                 est = get(ests,i);
%                 est = modificarFiltro(est,'AR',params,indiceFiltro);
%                 ests = set(ests,est,i);
%                 shot.objLstEst = ests;
%                 shots{indice}=shot;
%                 objLstShot.Shots = shots;
%             end
%             est = getEstRemota(ests);
%             est = modificarFiltro(est,'AR',params,indiceFiltro);
%             ests = setEstRemota(ests,est);
%             shot.objLstEst = ests;
%             shots{indice}=shot;
%             objLstShot.Shots = shots;
%             %objLstShot = setFiltro(objLstShot,indice,'AR',params);
    end
end

 shots = objLstShot.Shots;
 ests = shots{indice}.objLstEst;
 est = get(ests,1);
 set(handles.lsFiltrosAp,'String',toString(get(est,'lstFiltros')));




function txRGanancia_Callback(hObject, eventdata, handles)
% hObject    handle to txRGanancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txRGanancia as text
%        str2double(get(hObject,'String')) returns contents of txRGanancia as a double


% --- Executes during object creation, after setting all properties.
function txRGanancia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txRGanancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txRFMin_Callback(hObject, eventdata, handles)
% hObject    handle to txRFMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txRFMin as text
%        str2double(get(hObject,'String')) returns contents of txRFMin as a double


% --- Executes during object creation, after setting all properties.
function txRFMin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txRFMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txRFMax_Callback(hObject, eventdata, handles)
% hObject    handle to txRFMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txRFMax as text
%        str2double(get(hObject,'String')) returns contents of txRFMax as a double


% --- Executes during object creation, after setting all properties.
function txRFMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txRFMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function txF0_Callback(hObject, eventdata, handles)
% hObject    handle to txF0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txF0 as text
%        str2double(get(hObject,'String')) returns contents of txF0 as a double


% --- Executes during object creation, after setting all properties.
function txF0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txF0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txF1_Callback(hObject, eventdata, handles)
% hObject    handle to txF1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txF1 as text
%        str2double(get(hObject,'String')) returns contents of txF1 as a double


% --- Executes during object creation, after setting all properties.
function txF1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txF1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit54_Callback(hObject, eventdata, handles)
% hObject    handle to edit54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit54 as text
%        str2double(get(hObject,'String')) returns contents of edit54 as a double


% --- Executes during object creation, after setting all properties.
function edit54_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txF2_Callback(hObject, eventdata, handles)
% hObject    handle to txF2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txF2 as text
%        str2double(get(hObject,'String')) returns contents of txF2 as a double


% --- Executes during object creation, after setting all properties.
function txF2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txF2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txG0_Callback(hObject, eventdata, handles)
% hObject    handle to txG0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txG0 as text
%        str2double(get(hObject,'String')) returns contents of txG0 as a double


% --- Executes during object creation, after setting all properties.
function txG0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txG0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit57_Callback(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit57 as text
%        str2double(get(hObject,'String')) returns contents of edit57 as a double


% --- Executes during object creation, after setting all properties.
function edit57_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txG2_Callback(hObject, eventdata, handles)
% hObject    handle to txG2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txG2 as text
%        str2double(get(hObject,'String')) returns contents of txG2 as a double


% --- Executes during object creation, after setting all properties.
function txG2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txG2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txG3_Callback(hObject, eventdata, handles)
% hObject    handle to txG3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txG3 as text
%        str2double(get(hObject,'String')) returns contents of txG3 as a double


% --- Executes during object creation, after setting all properties.
function txG3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txG3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txF3_Callback(hObject, eventdata, handles)
% hObject    handle to txF3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txF3 as text
%        str2double(get(hObject,'String')) returns contents of txF3 as a double


% --- Executes during object creation, after setting all properties.
function txF3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txF3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txG1_Callback(hObject, eventdata, handles)
% hObject    handle to txG1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txG1 as text
%        str2double(get(hObject,'String')) returns contents of txG1 as a double


% --- Executes during object creation, after setting all properties.
function txG1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txG1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function txLimInferior_Callback(hObject, eventdata, handles)
% hObject    handle to txLimInferior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txLimInferior as text
%        str2double(get(hObject,'String')) returns contents of txLimInferior as a double


% --- Executes during object creation, after setting all properties.
function txLimInferior_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txLimInferior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function txF02_Callback(hObject, eventdata, handles)
% hObject    handle to txF02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txF02 as text
%        str2double(get(hObject,'String')) returns contents of txF02 as a double


% --- Executes during object creation, after setting all properties.
function txF02_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txF02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txF12_Callback(hObject, eventdata, handles)
% hObject    handle to txF12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txF12 as text
%        str2double(get(hObject,'String')) returns contents of txF12 as a double


% --- Executes during object creation, after setting all properties.
function txF12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txF12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txF32_Callback(hObject, eventdata, handles)
% hObject    handle to txF32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txF32 as text
%        str2double(get(hObject,'String')) returns contents of txF32 as a double


% --- Executes during object creation, after setting all properties.
function txF32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txF32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit65_Callback(hObject, eventdata, handles)
% hObject    handle to edit65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit65 as text
%        str2double(get(hObject,'String')) returns contents of edit65 as a double


% --- Executes during object creation, after setting all properties.
function edit65_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txG02_Callback(hObject, eventdata, handles)
% hObject    handle to txG02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txG02 as text
%        str2double(get(hObject,'String')) returns contents of txG02 as a double


% --- Executes during object creation, after setting all properties.
function txG02_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txG02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txG12_Callback(hObject, eventdata, handles)
% hObject    handle to txG12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txG12 as text
%        str2double(get(hObject,'String')) returns contents of txG12 as a double


% --- Executes during object creation, after setting all properties.
function txG12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txG12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txG22_Callback(hObject, eventdata, handles)
% hObject    handle to txG22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txG22 as text
%        str2double(get(hObject,'String')) returns contents of txG22 as a double


% --- Executes during object creation, after setting all properties.
function txG22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txG22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txG32_Callback(hObject, eventdata, handles)
% hObject    handle to txG32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txG32 as text
%        str2double(get(hObject,'String')) returns contents of txG32 as a double


% --- Executes during object creation, after setting all properties.
function txG32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txG32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txF22_Callback(hObject, eventdata, handles)
% hObject    handle to txF22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txF22 as text
%        str2double(get(hObject,'String')) returns contents of txF22 as a double


% --- Executes during object creation, after setting all properties.
function txF22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txF22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function edit70_Callback(hObject, eventdata, handles)
% hObject    handle to txImpedancia2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txImpedancia2 as text
%        str2double(get(hObject,'String')) returns contents of txImpedancia2 as a double


% --- Executes during object creation, after setting all properties.
function edit70_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txImpedancia2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit71_Callback(hObject, eventdata, handles)
% hObject    handle to txHxch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txHxch as text
%        str2double(get(hObject,'String')) returns contents of txHxch as a double


% --- Executes during object creation, after setting all properties.
function edit71_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txHxch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txRGanancia2_Callback(hObject, eventdata, handles)
% hObject    handle to txRGanancia2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txRGanancia2 as text
%        str2double(get(hObject,'String')) returns contents of txRGanancia2 as a double


% --- Executes during object creation, after setting all properties.
function txRGanancia2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txRGanancia2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txRFMax2_Callback(hObject, eventdata, handles)
% hObject    handle to txRFN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txRFN as text
%        str2double(get(hObject,'String')) returns contents of txRFN as a double


% --- Executes during object creation, after setting all properties.
function txRFMax2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txRFN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txRFN_Callback(hObject, eventdata, handles)
% hObject    handle to txRFN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txRFN as text
%        str2double(get(hObject,'String')) returns contents of txRFN as a double


% --- Executes during object creation, after setting all properties.
function txRFN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txRFN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function pnEditarProceso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pnEditarProceso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --- Executes on button press in pushbutton83.
function pushbutton83_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in btGuardarRemota.
function btGuardarRemota_Callback(hObject, eventdata, handles)
% hObject    handle to btGuardarRemota (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global lstRemotas;
global pathGlobal;
global objLstShot;
indiceShot = get(handles.popShot,'Value');
shots = objLstShot.Shots;
shot = shots{indiceShot};
ests = shot.objLstEst;
for i=1:length(ests)
    lstRemotas{i} = get(ests,i);
end
[file,path] = uiputfile({'Archivos TSn','*.TS*'},'Guardar archivo TSn Remota',pathGlobal);
if isequal(file,0)
else
    archivo = [path,file];
    pathGlobal = path;
    guardarRemota(lstRemotas,archivo);
end




% --- Executes on button press in btCargarRemota.
function btCargarRemota_Callback(hObject, eventdata, handles)
% hObject    handle to btCargarRemota (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in chRestarRuidoP.
function chRestarRuidoP_Callback(hObject, eventdata, handles)
% hObject    handle to chRestarRuidoP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chRestarRuidoP




% --- Executes on button press in pushbutton86.
function pushbutton86_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
global pathGlobal;
[file,path]=uiputfile({'*.dat','Archivo de datos Res2DInv'},'Archivo Res2DInv',pathGlobal);
if isequal(file,0)
    disp('cancel')
else
    pathGlobal = path;
    file=agregarExtension(file,'dat');
    archivo = [path,file];
    toRes2DInv(objLstShot,archivo);
end



% --- Executes on button press in pushbutton53.
function pushbutton53_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
global pathGlobal;
[file,path]=uiputfile({'*.dat','Archivo de datos GeoSoft'},'Archivo GeoSoft',pathGlobal);
if isequal(file,0)
    disp('cancel')
else
    pathGlobal = path;
    file=agregarExtension(file,'dat');
    archivo = [path,file];
    toGeoSoft(objLstShot,archivo);
end


% --- Executes on button press in pushbutton52.
function pushbutton52_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
global pathGlobal;
[file,path]=uiputfile({'*.dat','Archivo de datos Surfer'},'Archivo Surfer',pathGlobal);
if isequal(file,0)
    disp('cancel')
else
    pathGlobal = path;
    file=agregarExtension(file,'dat');
    archivo = [path,file];
    toSurfer(objLstShot,archivo);
end



% --- Executes on button press in pushbutton87.
function pushbutton87_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
%opcion = get(handles.chGraficarRes,'Value')*1 + get(handles.chGraficarCarg,'Value')*2;
%[res,carg] = pseudoseccion(objLstShot);
[res,carg] = getestdata(objLstShot);

if get(handles.chGraficarRes,'Value')
psres(res,handles);
end
if get(handles.chGraficarCarg,'Value')
pscarg(carg,handles);
end

% switch opcion
%     case 1
%         global figRes
%         try
%             set(figRes,'name','Grafico de Resistencias');
%         catch
%             figRes = figure;
%             plot(0,0);
%         end
% %         if length(figRes)==0
% %             figRes = figure;
% %         end
%         Color = caxis(get(figRes,'CurrentAxes') );           
%         imgRes = image(res','Parent',get(figRes,'CurrentAxes'),'CDataMapping','scaled');
%         caxis(get(figRes,'CurrentAxes'),Color);
%         set(figRes,'name','Grafico de Resistencias');
%     case 2
%         global figCarg
%         try
%             set(figCarg,'name','Grafico de Resistencias');
%         catch
%             figCarg = figure;
%             plot(0,0);
%         end
% %         if length(figCarg)==0
% %             figCarg = figure;
% %         end
%         Color = caxis(get(figCarg,'CurrentAxes') );           
%         imgCarg = image(carg','Parent',get(figCarg,'CurrentAxes'),'CDataMapping','scaled');
%         caxis(get(figCarg,'CurrentAxes'),Color);
%         set(figCarg,'name','Grafico de Cargabilidades');
%     case 3
%         global figCarg
%         try
%             set(figCarg,'name','Grafico de Resistencias');
%         catch
%             figCarg = figure;
%             plot(0,0);
%         end
% %         if length(figCarg)==0
% %             figCarg = figure;
% %         end
%         Color = caxis(get(figCarg,'CurrentAxes') )           
%         imgCarg = image(carg','Parent',get(figCarg,'CurrentAxes'),'CDataMapping','scaled');
%         caxis(get(figCarg,'CurrentAxes'),Color);
%         
%     global figRes
%         try
%             set(figRes,'name','Grafico de Resistencias');
%         catch
%             figRes = figure;
%             plot(0,0);
%         end
%         
% %         if length(figRes)==0
% %             figRes = figure;
% %         end
%         Color = caxis(get(figRes,'CurrentAxes') )           
%         imgRes = image(res','Parent',get(figRes,'CurrentAxes'),'CDataMapping','scaled');
%         caxis(get(figRes,'CurrentAxes'),Color);
%       
%         set(figRes,'name','Grafico de Resistencias');
%         set(figCarg,'name','Grafico de Cargabilidades');
% end
% 
% %colorbar('peer',handles.grResistividad); %mV/V
% %colorbar('peer',handles.grCargabilidad); %omh*m
% 
% %set(handles.grResistividad,'Visible','off','YDir','reverse','XLim',get(imgRes,'XData'),'YLim',get(imgRes,'YData'));
% %set(handles.grCargabilidad,'Visible','off','YDir','reverse','XLim',get(imgCarg,'XData'),'YLim',get(imgCarg,'YData'));



% --- Executes on button press in pushbutton88.
function pushbutton88_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
colormapeditor(gcf);


% --- Executes on button press in pushbutton89.
function pushbutton89_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton90.
function pushbutton90_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
colormapeditor(handles.pnResultados);

% --- Executes on button press in pushbutton91.
function pushbutton91_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in chGraficarRes.
function chGraficarRes_Callback(hObject, eventdata, handles)
% hObject    handle to chGraficarRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chGraficarRes


% --- Executes on button press in chGraficarCarg.
function chGraficarCarg_Callback(hObject, eventdata, handles)
% hObject    handle to chGraficarCarg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chGraficarCarg




% --- Executes on button press in chRestarRuidoP.
function checkbox17_Callback(hObject, eventdata, handles)
% hObject    handle to chRestarRuidoP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chRestarRuidoP




% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in pushbutton92.
function pushbutton92_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in chRestarRuido.
function chRestarRuido_Callback(hObject, eventdata, handles)
% hObject    handle to chRestarRuido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chRestarRuido






% --- Executes on button press in chBandaRuido.
function chBandaRuido_Callback(hObject, eventdata, handles)
% hObject    handle to chBandaRuido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chBandaRuido




% --- Executes during object creation, after setting all properties.
function btEditarProceso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btEditarProceso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --- Executes on button press in chRestarBandaP.
function chRestarBandaP_Callback(hObject, eventdata, handles)
% hObject    handle to chRestarBandaP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chRestarBandaP





function edit75_Callback(hObject, eventdata, handles)
% hObject    handle to txLimSuperior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txLimSuperior as text
%        str2double(get(hObject,'String')) returns contents of txLimSuperior as a double


% --- Executes during object creation, after setting all properties.
function edit75_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txLimSuperior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in pushbutton93.
function pushbutton93_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
autoShot



% --- Executes on button press in btERutas.
function btERutas_Callback(hObject, eventdata, handles)
% hObject    handle to btERutas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
processmix;

% --- Executes on button press in btERemotas.
function btERemotas_Callback(hObject, eventdata, handles)
% hObject    handle to btERemotas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

dir = Remotas;
no = 'no';
if (length(dir) ~= length(no))
    if crearShotRemota(dir);
        msgbox('Archivos TSN guardados');
    else
        msgbox('Un error a ocurrido cuando se creaba el archivo');
    end
end

% --- Executes on button press in btUBC2GEO.
function btUBC2GEO_Callback(hObject, eventdata, handles)
% hObject    handle to btUBC2GEO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if ubcToGeosoft
    msgbox('Archivo creado!');
else
    msgbox('El archivo no pudo ser arreglado');
end






function edit77_Callback(hObject, eventdata, handles)
% hObject    handle to edit77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit77 as text
%        str2double(get(hObject,'String')) returns contents of edit77 as a double


% --- Executes during object creation, after setting all properties.
function edit77_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function edit78_Callback(hObject, eventdata, handles)
% hObject    handle to edit78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit78 as text
%        str2double(get(hObject,'String')) returns contents of edit78 as a double


% --- Executes during object creation, after setting all properties.
function edit78_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%% Hint: edit controls usually have a white background on Windows.
%%       See ISPC and COMPUTER.
%if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%    set(hObject,'BackgroundColor','white');
%end




% --- Executes on button press in pushbutton97.
function pushbutton97_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[X,Y]=ginput(2);
%Y = Y
f=2^23/2.45;

get(handles.btNivelVertical)
if(get(handles.btNivelVertical,'Value'))
    set(handles.txLimInferior2,'String',num2str(min([Y(1) Y(2)])*f));
    set(handles.txLimSuperior2,'String',num2str(max([Y(1) Y(2)])*f));
    hold on;
    [x0]=xlim(handles.grSenales);
    hold on
    plot([x0],[Y(1) Y(1)],'r');
    
    plot([x0],[Y(2) Y(2)],'r');
    
end

if(get(handles.btNivelHorizontal,'Value'))
    set(handles.txLimInferior2,'String',num2str(round(min([X(1) X(2)]))));
    set(handles.txLimSuperior2,'String',num2str(round(max([X(1) X(2)]))));
    hold on;
    [y0]=ylim(handles.grSenales);
    hold on
    plot([X(1) X(1)],y0,'r');
    
    plot([X(2) X(2)],y0,'r');


end

% --- Executes on button press in pushbutton98.
function pushbutton98_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





function txHych_Callback(hObject, eventdata, handles)
% hObject    handle to txHych (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txHych as text
%        str2double(get(hObject,'String')) returns contents of txHych as a double


% --- Executes during object creation, after setting all properties.
function txHych_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txHych (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txRFmax2_Callback(hObject, eventdata, handles)
% hObject    handle to txRFmax2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txRFmax2 as text
%        str2double(get(hObject,'String')) returns contents of txRFmax2 as a double

function txRFMin2_Callback(hObject, eventdata, handles)
% hObject    handle to txRFmax2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txRFmax2 as text
%        str2double(get(hObject,'String')) returns contents of txRFmax2 as a double


% --- Executes during object creation, after setting all properties.
function txRFmax2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txRFmax2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txRFMin2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txRFmax2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in chRestarRuidoP.
function checkbox21_Callback(hObject, eventdata, handles)
% hObject    handle to chRestarRuidoP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chRestarRuidoP


% --- Executes on button press in pushbutton99.
function pushbutton99_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globaldir
[file,path]=uigetfile([globaldir '\*.dir']);
file=[path file];
set(handles.txListaTel,'String',file);
fid=fopen(file,'rt');
str = fgetl(fid);
i=1;
while(ischar(str))
    datos = strread(str,'%s');
    dist(i)=str2num(datos{1});
    files{i}=str2num(datos{2});
    i=i+1;
    str=fgetl(fid);
end

global objLstShot;
indice = get(handles.lsPShot,'Value');
indiceEst = get(handles.popEstacion,'Value');
shots = objLstShot.Shots;
shot = shots{indice};
ests = shot.objLstEst;
est = get(ests,indiceEst);
Xr1=get(est,'Xr1');
Xr2=get(est,'Xr2');
d = (Xr1+Xr2)/2
[a,b]=min(abs(dist-d));
set(handles.txImpedancia2,'String',files{b});

function txListaTel_Callback(hObject, eventdata, handles)
% hObject    handle to txListaTel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txListaTel as text
%        str2double(get(hObject,'String')) returns contents of txListaTel as a double


% --- Executes during object creation, after setting all properties.
function txListaTel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txListaTel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton100.
function pushbutton100_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton100 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

TFedit

% --- Executes on button press in pushbutton101.
function pushbutton101_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton101 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
global pathGlobal;
global estRemota
[file,path]=uigetfile([pathGlobal '*.TS4']);
file=[path file];

indiceShot = get(handles.popShot,'Value');
shots = objLstShot.Shots;
shot = shots{indiceShot};
ests = shot.objLstEst;
rem = getEstRemota(ests);
rem=set(rem,'file',file);
est = get(ests,get(handles.popEstacion,'Value'));
file0=get(est,'file');
%get.est,header

%X=get(rem,'X');
%X=open_TSN_All_page(X,file);c
%X=open_TSN_All_page(X,file);
dN=str2num(get(handles.ftTaper,'String'));
X=readsincroTSN(file0,file,dN);
rem=set(rem,'X',X);
ests = setEstRemota(ests,rem);
shot.objLstEst=ests;
shots{indiceShot}=shot;
objLstShot.Shots=shots;
estRemota=getEstRemota(ests);

% --- Executes on button press in pushbutton104.
function pushbutton104_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttn104 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton105.
function pushbutton105_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton105 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function txHycal_Callback(hObject, eventdata, handles)
% hObject    handle to txHycal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txHycal as text
%        str2double(get(hObject,'String')) returns contents of txHycal as a double


% --- Executes during object creation, after setting all properties.
function txHycal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txHycal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txHxcal_Callback(hObject, eventdata, handles)
% hObject    handle to txHxcal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txHxcal as text
%        str2double(get(hObject,'String')) returns contents of txHxcal as a double


% --- Executes during object creation, after setting all properties.
function txHxcal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txHxcal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit87_Callback(hObject, eventdata, handles)
% hObject    handle to edit87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit87 as text
%        str2double(get(hObject,'String')) returns contents of edit87 as a double


% --- Executes during object creation, after setting all properties.
function edit87_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton106.
function pushbutton106_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton106 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton107.
function pushbutton107_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton107 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton108.
function pushbutton108_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton108 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton109.
function pushbutton109_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton109 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton110.
function pushbutton110_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton110 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton111.
function pushbutton111_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton111 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton112.
function pushbutton112_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton112 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton113.
function pushbutton113_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton113 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit88_Callback(hObject, eventdata, handles)
% hObject    handle to edit88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit88 as text
%        str2double(get(hObject,'String')) returns contents of edit88 as a double


% --- Executes during object creation, after setting all properties.
function edit88_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox13.
function listbox13_Callback(hObject, eventdata, handles)
% hObject    handle to listbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox13 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox13


% --- Executes during object creation, after setting all properties.
function listbox13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton114.
function pushbutton114_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton114 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox14.
function listbox14_Callback(hObject, eventdata, handles)
% hObject    handle to listbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox14 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox14


% --- Executes during object creation, after setting all properties.
function listbox14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton115.
function pushbutton115_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton115 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit89_Callback(hObject, eventdata, handles)
% hObject    handle to edit89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit89 as text
%        str2double(get(hObject,'String')) returns contents of edit89 as a double


% --- Executes during object creation, after setting all properties.
function edit89_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit90_Callback(hObject, eventdata, handles)
% hObject    handle to edit90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit90 as text
%        str2double(get(hObject,'String')) returns contents of edit90 as a double


% --- Executes during object creation, after setting all properties.
function edit90_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit91_Callback(hObject, eventdata, handles)
% hObject    handle to edit91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit91 as text
%        str2double(get(hObject,'String')) returns contents of edit91 as a double


% --- Executes during object creation, after setting all properties.
function edit91_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit92_Callback(hObject, eventdata, handles)
% hObject    handle to edit92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit92 as text
%        str2double(get(hObject,'String')) returns contents of edit92 as a double


% --- Executes during object creation, after setting all properties.
function edit92_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton116.
function pushbutton116_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton116 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit93_Callback(hObject, eventdata, handles)
% hObject    handle to edit93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit93 as text
%        str2double(get(hObject,'String')) returns contents of edit93 as a double


% --- Executes during object creation, after setting all properties.
function edit93_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton117.
function pushbutton117_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton117 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit94_Callback(hObject, eventdata, handles)
% hObject    handle to edit94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit94 as text
%        str2double(get(hObject,'String')) returns contents of edit94 as a double


% --- Executes during object creation, after setting all properties.
function edit94_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit95_Callback(hObject, eventdata, handles)
% hObject    handle to edit95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit95 as text
%        str2double(get(hObject,'String')) returns contents of edit95 as a double


% --- Executes during object creation, after setting all properties.
function edit95_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton118.
function pushbutton118_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton118 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit96_Callback(hObject, eventdata, handles)
% hObject    handle to edit96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit96 as text
%        str2double(get(hObject,'String')) returns contents of edit96 as a double


% --- Executes during object creation, after setting all properties.
function edit96_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit97_Callback(hObject, eventdata, handles)
% hObject    handle to edit97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit97 as text
%        str2double(get(hObject,'String')) returns contents of edit97 as a double


% --- Executes during object creation, after setting all properties.
function edit97_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit98_Callback(hObject, eventdata, handles)
% hObject    handle to edit98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit98 as text
%        str2double(get(hObject,'String')) returns contents of edit98 as a double


% --- Executes during object creation, after setting all properties.
function edit98_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox22.
function checkbox22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox22


% --- Executes on selection change in listbox15.
function listbox15_Callback(hObject, eventdata, handles)
% hObject    handle to listbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox15 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox15


% --- Executes during object creation, after setting all properties.
function listbox15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit99_Callback(hObject, eventdata, handles)
% hObject    handle to edit99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit99 as text
%        str2double(get(hObject,'String')) returns contents of edit99 as a double


% --- Executes during object creation, after setting all properties.
function edit99_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit100_Callback(hObject, eventdata, handles)
% hObject    handle to edit100 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit100 as text
%        str2double(get(hObject,'String')) returns contents of edit100 as a double


% --- Executes during object creation, after setting all properties.
function edit100_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit100 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit101_Callback(hObject, eventdata, handles)
% hObject    handle to edit101 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit101 as text
%        str2double(get(hObject,'String')) returns contents of edit101 as a double


% --- Executes during object creation, after setting all properties.
function edit101_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit101 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit102_Callback(hObject, eventdata, handles)
% hObject    handle to edit102 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit102 as text
%        str2double(get(hObject,'String')) returns contents of edit102 as a double


% --- Executes during object creation, after setting all properties.
function edit102_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit102 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit103_Callback(hObject, eventdata, handles)
% hObject    handle to edit103 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit103 as text
%        str2double(get(hObject,'String')) returns contents of edit103 as a double


% --- Executes during object creation, after setting all properties.
function edit103_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit103 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit104_Callback(hObject, eventdata, handles)
% hObject    handle to edit104 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit104 as text
%        str2double(get(hObject,'String')) returns contents of edit104 as a double


% --- Executes during object creation, after setting all properties.
function edit104_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit104 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit105_Callback(hObject, eventdata, handles)
% hObject    handle to edit105 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit105 as text
%        str2double(get(hObject,'String')) returns contents of edit105 as a double


% --- Executes during object creation, after setting all properties.
function edit105_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit105 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit106_Callback(hObject, eventdata, handles)
% hObject    handle to edit106 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit106 as text
%        str2double(get(hObject,'String')) returns contents of edit106 as a double


% --- Executes during object creation, after setting all properties.
function edit106_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit106 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit107_Callback(hObject, eventdata, handles)
% hObject    handle to edit107 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit107 as text
%        str2double(get(hObject,'String')) returns contents of edit107 as a double


% --- Executes during object creation, after setting all properties.
function edit107_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit107 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit108_Callback(hObject, eventdata, handles)
% hObject    handle to edit108 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit108 as text
%        str2double(get(hObject,'String')) returns contents of edit108 as a double


% --- Executes during object creation, after setting all properties.
function edit108_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit108 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit109_Callback(hObject, eventdata, handles)
% hObject    handle to edit109 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit109 as text
%        str2double(get(hObject,'String')) returns contents of edit109 as a double


% --- Executes during object creation, after setting all properties.
function edit109_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit109 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox23.
function checkbox23_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox23


% --- Executes on button press in pushbutton119.
function pushbutton119_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton119 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton120.
function pushbutton120_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton120 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton121.
function pushbutton121_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton121 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton122.
function pushbutton122_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton122 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton123.
function pushbutton123_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton123 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton124.
function pushbutton124_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton124 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton185.
function pushbutton185_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton185 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton186.
function pushbutton186_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton186 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton187.
function pushbutton187_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton187 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton188.
function pushbutton188_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton188 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton189.
function pushbutton189_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton189 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit160_Callback(hObject, eventdata, handles)
% hObject    handle to edit160 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit160 as text
%        str2double(get(hObject,'String')) returns contents of edit160 as a double


% --- Executes during object creation, after setting all properties.
function edit160_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit160 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton190.
function pushbutton190_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton190 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton191.
function pushbutton191_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton191 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton192.
function pushbutton192_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton192 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton193.
function pushbutton193_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton193 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton194.
function pushbutton194_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton194 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton195.
function pushbutton195_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton195 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton196.
function pushbutton196_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton196 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton197.
function pushbutton197_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton197 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit161_Callback(hObject, eventdata, handles)
% hObject    handle to edit161 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit161 as text
%        str2double(get(hObject,'String')) returns contents of edit161 as a double


% --- Executes during object creation, after setting all properties.
function edit161_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit161 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit162_Callback(hObject, eventdata, handles)
% hObject    handle to edit162 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit162 as text
%        str2double(get(hObject,'String')) returns contents of edit162 as a double


% --- Executes during object creation, after setting all properties.
function edit162_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit162 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit163_Callback(hObject, eventdata, handles)
% hObject    handle to edit163 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit163 as text
%        str2double(get(hObject,'String')) returns contents of edit163 as a double


% --- Executes during object creation, after setting all properties.
function edit163_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit163 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit164_Callback(hObject, eventdata, handles)
% hObject    handle to edit164 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit164 as text
%        str2double(get(hObject,'String')) returns contents of edit164 as a double


% --- Executes during object creation, after setting all properties.
function edit164_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit164 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit165_Callback(hObject, eventdata, handles)
% hObject    handle to edit165 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit165 as text
%        str2double(get(hObject,'String')) returns contents of edit165 as a double


% --- Executes during object creation, after setting all properties.
function edit165_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit165 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton198.
function pushbutton198_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton198 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit166_Callback(hObject, eventdata, handles)
% hObject    handle to edit166 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit166 as text
%        str2double(get(hObject,'String')) returns contents of edit166 as a double


% --- Executes during object creation, after setting all properties.
function edit166_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit166 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit167_Callback(hObject, eventdata, handles)
% hObject    handle to edit167 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit167 as text
%        str2double(get(hObject,'String')) returns contents of edit167 as a double


% --- Executes during object creation, after setting all properties.
function edit167_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit167 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton199.
function pushbutton199_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton199 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit168_Callback(hObject, eventdata, handles)
% hObject    handle to edit168 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit168 as text
%        str2double(get(hObject,'String')) returns contents of edit168 as a double


% --- Executes during object creation, after setting all properties.
function edit168_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit168 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit169_Callback(hObject, eventdata, handles)
% hObject    handle to edit169 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit169 as text
%        str2double(get(hObject,'String')) returns contents of edit169 as a double


% --- Executes during object creation, after setting all properties.
function edit169_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit169 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit170_Callback(hObject, eventdata, handles)
% hObject    handle to edit170 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit170 as text
%        str2double(get(hObject,'String')) returns contents of edit170 as a double


% --- Executes during object creation, after setting all properties.
function edit170_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit170 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit171_Callback(hObject, eventdata, handles)
% hObject    handle to edit171 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit171 as text
%        str2double(get(hObject,'String')) returns contents of edit171 as a double


% --- Executes during object creation, after setting all properties.
function edit171_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit171 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton200.
function pushbutton200_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton200 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit172_Callback(hObject, eventdata, handles)
% hObject    handle to edit172 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit172 as text
%        str2double(get(hObject,'String')) returns contents of edit172 as a double


% --- Executes during object creation, after setting all properties.
function edit172_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit172 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton201.
function pushbutton201_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton201 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit173_Callback(hObject, eventdata, handles)
% hObject    handle to edit173 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit173 as text
%        str2double(get(hObject,'String')) returns contents of edit173 as a double


% --- Executes during object creation, after setting all properties.
function edit173_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit173 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit174_Callback(hObject, eventdata, handles)
% hObject    handle to edit174 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit174 as text
%        str2double(get(hObject,'String')) returns contents of edit174 as a double


% --- Executes during object creation, after setting all properties.
function edit174_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit174 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton202.
function pushbutton202_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton202 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton203.
function pushbutton203_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton203 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit175_Callback(hObject, eventdata, handles)
% hObject    handle to edit175 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit175 as text
%        str2double(get(hObject,'String')) returns contents of edit175 as a double


% --- Executes during object creation, after setting all properties.
function edit175_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit175 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit176_Callback(hObject, eventdata, handles)
% hObject    handle to edit176 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit176 as text
%        str2double(get(hObject,'String')) returns contents of edit176 as a double


% --- Executes during object creation, after setting all properties.
function edit176_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit176 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit177_Callback(hObject, eventdata, handles)
% hObject    handle to edit177 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit177 as text
%        str2double(get(hObject,'String')) returns contents of edit177 as a double


% --- Executes during object creation, after setting all properties.
function edit177_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit177 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox21.
function listbox21_Callback(hObject, eventdata, handles)
% hObject    handle to listbox21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox21 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox21


% --- Executes during object creation, after setting all properties.
function listbox21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton204.
function pushbutton204_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton204 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton205.
function pushbutton205_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton205 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton206.
function pushbutton206_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton206 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton207.
function pushbutton207_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton207 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit178_Callback(hObject, eventdata, handles)
% hObject    handle to edit178 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit178 as text
%        str2double(get(hObject,'String')) returns contents of edit178 as a double


% --- Executes during object creation, after setting all properties.
function edit178_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit178 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit179_Callback(hObject, eventdata, handles)
% hObject    handle to edit179 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit179 as text
%        str2double(get(hObject,'String')) returns contents of edit179 as a double


% --- Executes during object creation, after setting all properties.
function edit179_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit179 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton208.
function pushbutton208_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton208 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit180_Callback(hObject, eventdata, handles)
% hObject    handle to edit180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit180 as text
%        str2double(get(hObject,'String')) returns contents of edit180 as a double


% --- Executes during object creation, after setting all properties.
function edit180_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton209.
function pushbutton209_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton209 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton210.
function pushbutton210_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton210 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton211.
function pushbutton211_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton211 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton212.
function pushbutton212_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton212 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton213.
function pushbutton213_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton213 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton214.
function pushbutton214_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton214 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton215.
function pushbutton215_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton215 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton216.
function pushbutton216_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton216 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton217.
function pushbutton217_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton217 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton218.
function pushbutton218_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton218 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton219.
function pushbutton219_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton219 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton220.
function pushbutton220_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton220 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton221.
function pushbutton221_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton221 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton222.
function pushbutton222_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton222 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit181_Callback(hObject, eventdata, handles)
% hObject    handle to edit181 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit181 as text
%        str2double(get(hObject,'String')) returns contents of edit181 as a double


% --- Executes during object creation, after setting all properties.
function edit181_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit181 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton223.
function pushbutton223_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton223 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton224.
function pushbutton224_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton224 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton225.
function pushbutton225_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton225 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton226.
function pushbutton226_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton226 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton227.
function pushbutton227_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton227 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton228.
function pushbutton228_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton228 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton229.
function pushbutton229_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton229 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton230.
function pushbutton230_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton230 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton231.
function pushbutton231_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton231 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton232.
function pushbutton232_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton232 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton233.
function pushbutton233_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton233 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton234.
function pushbutton234_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton234 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton235.
function pushbutton235_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton235 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton236.
function pushbutton236_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton236 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton237.
function pushbutton237_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton237 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton238.
function pushbutton238_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton238 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton239.
function pushbutton239_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton239 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton240.
function pushbutton240_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton240 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit182_Callback(hObject, eventdata, handles)
% hObject    handle to edit182 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit182 as text
%        str2double(get(hObject,'String')) returns contents of edit182 as a double


% --- Executes during object creation, after setting all properties.
function edit182_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit182 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox22.
function listbox22_Callback(hObject, eventdata, handles)
% hObject    handle to listbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox22 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox22


% --- Executes during object creation, after setting all properties.
function listbox22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton241.
function pushbutton241_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton241 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox23.
function listbox23_Callback(hObject, eventdata, handles)
% hObject    handle to listbox23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox23 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox23


% --- Executes during object creation, after setting all properties.
function listbox23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton242.
function pushbutton242_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton242 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit110_Callback(hObject, eventdata, handles)
% hObject    handle to edit110 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit110 as text
%        str2double(get(hObject,'String')) returns contents of edit110 as a double


% --- Executes during object creation, after setting all properties.
function edit110_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit110 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton131.
function pushbutton131_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton131 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton132.
function pushbutton132_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton132 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton133.
function pushbutton133_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton133 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton134.
function pushbutton134_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton134 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton135.
function pushbutton135_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton135 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton136.
function pushbutton136_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton136 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton137.
function pushbutton137_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton137 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton138.
function pushbutton138_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton138 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton139.
function pushbutton139_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton139 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton140.
function pushbutton140_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton140 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton141.
function pushbutton141_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton141 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton142.
function pushbutton142_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton142 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton143.
function pushbutton143_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton143 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton144.
function pushbutton144_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton144 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton145.
function pushbutton145_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton145 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton146.
function pushbutton146_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton146 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton147.
function pushbutton147_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton147 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton148.
function pushbutton148_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton148 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton149.
function pushbutton149_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton149 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton150.
function pushbutton150_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton150 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit111_Callback(hObject, eventdata, handles)
% hObject    handle to edit111 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit111 as text
%        str2double(get(hObject,'String')) returns contents of edit111 as a double


% --- Executes during object creation, after setting all properties.
function edit111_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit111 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton151.
function pushbutton151_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton151 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton152.
function pushbutton152_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton152 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton153.
function pushbutton153_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton153 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton154.
function pushbutton154_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton154 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton155.
function pushbutton155_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton155 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton156.
function pushbutton156_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton156 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton157.
function pushbutton157_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton157 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton158.
function pushbutton158_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton158 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton159.
function pushbutton159_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton159 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton160.
function pushbutton160_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton160 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton161.
function pushbutton161_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton161 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton162.
function pushbutton162_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton162 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton163.
function pushbutton163_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton163 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton164.
function pushbutton164_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton164 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton165.
function pushbutton165_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton165 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton166.
function pushbutton166_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton166 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton167.
function pushbutton167_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton167 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton168.
function pushbutton168_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton168 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit112_Callback(hObject, eventdata, handles)
% hObject    handle to edit112 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit112 as text
%        str2double(get(hObject,'String')) returns contents of edit112 as a double


% --- Executes during object creation, after setting all properties.
function edit112_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit112 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox16.
function listbox16_Callback(hObject, eventdata, handles)
% hObject    handle to listbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox16 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox16


% --- Executes during object creation, after setting all properties.
function listbox16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton169.
function pushbutton169_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton169 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox17.
function listbox17_Callback(hObject, eventdata, handles)
% hObject    handle to listbox17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox17 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox17


% --- Executes during object creation, after setting all properties.
function listbox17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton170.
function pushbutton170_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton170 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit183_Callback(hObject, eventdata, handles)
% hObject    handle to edit183 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit183 as text
%        str2double(get(hObject,'String')) returns contents of edit183 as a double


% --- Executes during object creation, after setting all properties.
function edit183_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit183 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit184_Callback(hObject, eventdata, handles)
% hObject    handle to edit184 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit184 as text
%        str2double(get(hObject,'String')) returns contents of edit184 as a double


% --- Executes during object creation, after setting all properties.
function edit184_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit184 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton243.
function pushbutton243_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton243 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit185_Callback(hObject, eventdata, handles)
% hObject    handle to edit185 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit185 as text
%        str2double(get(hObject,'String')) returns contents of edit185 as a double


% --- Executes during object creation, after setting all properties.
function edit185_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit185 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton244.
function pushbutton244_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton244 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit186_Callback(hObject, eventdata, handles)
% hObject    handle to edit186 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit186 as text
%        str2double(get(hObject,'String')) returns contents of edit186 as a double


% --- Executes during object creation, after setting all properties.
function edit186_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit186 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit187_Callback(hObject, eventdata, handles)
% hObject    handle to edit187 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit187 as text
%        str2double(get(hObject,'String')) returns contents of edit187 as a double


% --- Executes during object creation, after setting all properties.
function edit187_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit187 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton245.
function pushbutton245_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton245 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit188_Callback(hObject, eventdata, handles)
% hObject    handle to edit188 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit188 as text
%        str2double(get(hObject,'String')) returns contents of edit188 as a double


% --- Executes during object creation, after setting all properties.
function edit188_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit188 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit189_Callback(hObject, eventdata, handles)
% hObject    handle to edit189 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit189 as text
%        str2double(get(hObject,'String')) returns contents of edit189 as a double


% --- Executes during object creation, after setting all properties.
function edit189_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit189 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit190_Callback(hObject, eventdata, handles)
% hObject    handle to edit190 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit190 as text
%        str2double(get(hObject,'String')) returns contents of edit190 as a double


% --- Executes during object creation, after setting all properties.
function edit190_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit190 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox36.
function checkbox36_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox36


% --- Executes on selection change in listbox24.
function listbox24_Callback(hObject, eventdata, handles)
% hObject    handle to listbox24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox24 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox24


% --- Executes during object creation, after setting all properties.
function listbox24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit191_Callback(hObject, eventdata, handles)
% hObject    handle to edit191 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit191 as text
%        str2double(get(hObject,'String')) returns contents of edit191 as a double


% --- Executes during object creation, after setting all properties.
function edit191_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit191 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit192_Callback(hObject, eventdata, handles)
% hObject    handle to edit192 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit192 as text
%        str2double(get(hObject,'String')) returns contents of edit192 as a double


% --- Executes during object creation, after setting all properties.
function edit192_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit192 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit193_Callback(hObject, eventdata, handles)
% hObject    handle to edit193 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit193 as text
%        str2double(get(hObject,'String')) returns contents of edit193 as a double


% --- Executes during object creation, after setting all properties.
function edit193_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit193 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit194_Callback(hObject, eventdata, handles)
% hObject    handle to edit194 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit194 as text
%        str2double(get(hObject,'String')) returns contents of edit194 as a double


% --- Executes during object creation, after setting all properties.
function edit194_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit194 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit195_Callback(hObject, eventdata, handles)
% hObject    handle to edit195 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit195 as text
%        str2double(get(hObject,'String')) returns contents of edit195 as a double


% --- Executes during object creation, after setting all properties.
function edit195_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit195 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit196_Callback(hObject, eventdata, handles)
% hObject    handle to edit196 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit196 as text
%        str2double(get(hObject,'String')) returns contents of edit196 as a double


% --- Executes during object creation, after setting all properties.
function edit196_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit196 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit197_Callback(hObject, eventdata, handles)
% hObject    handle to edit197 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit197 as text
%        str2double(get(hObject,'String')) returns contents of edit197 as a double


% --- Executes during object creation, after setting all properties.
function edit197_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit197 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit198_Callback(hObject, eventdata, handles)
% hObject    handle to edit198 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit198 as text
%        str2double(get(hObject,'String')) returns contents of edit198 as a double


% --- Executes during object creation, after setting all properties.
function edit198_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit198 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit199_Callback(hObject, eventdata, handles)
% hObject    handle to edit199 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit199 as text
%        str2double(get(hObject,'String')) returns contents of edit199 as a double


% --- Executes during object creation, after setting all properties.
function edit199_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit199 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit200_Callback(hObject, eventdata, handles)
% hObject    handle to edit200 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit200 as text
%        str2double(get(hObject,'String')) returns contents of edit200 as a double


% --- Executes during object creation, after setting all properties.
function edit200_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit200 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit201_Callback(hObject, eventdata, handles)
% hObject    handle to edit201 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit201 as text
%        str2double(get(hObject,'String')) returns contents of edit201 as a double


% --- Executes during object creation, after setting all properties.
function edit201_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit201 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox37.
function checkbox37_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox37


% --- Executes on selection change in listbox25.
function listbox25_Callback(hObject, eventdata, handles)
% hObject    handle to listbox25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox25 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox25


% --- Executes during object creation, after setting all properties.
function listbox25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton246.
function pushbutton246_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton246 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox38.
function checkbox38_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox38


% --- Executes on button press in checkbox39.
function checkbox39_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox39


% --- Executes on button press in checkbox40.
function checkbox40_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox40


% --- Executes on button press in checkbox41.
function checkbox41_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox41


% --- Executes on button press in checkbox42.
function checkbox42_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox42


% --- Executes on button press in pushbutton247.
function pushbutton247_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton247 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox43.
function checkbox43_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox43


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
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


% --- Executes on button press in checkbox44.
function checkbox44_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox44


% --- Executes on button press in checkbox45.
function checkbox45_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox45



function edit202_Callback(hObject, eventdata, handles)
% hObject    handle to edit202 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit202 as text
%        str2double(get(hObject,'String')) returns contents of edit202 as a double


% --- Executes during object creation, after setting all properties.
function edit202_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit202 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit203_Callback(hObject, eventdata, handles)
% hObject    handle to edit203 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit203 as text
%        str2double(get(hObject,'String')) returns contents of edit203 as a double


% --- Executes during object creation, after setting all properties.
function edit203_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit203 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit204_Callback(hObject, eventdata, handles)
% hObject    handle to edit204 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit204 as text
%        str2double(get(hObject,'String')) returns contents of edit204 as a double


% --- Executes during object creation, after setting all properties.
function edit204_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit204 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton248.
function pushbutton248_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton248 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit205_Callback(hObject, eventdata, handles)
% hObject    handle to edit205 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit205 as text
%        str2double(get(hObject,'String')) returns contents of edit205 as a double


% --- Executes during object creation, after setting all properties.
function edit205_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit205 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton249.
function pushbutton249_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton249 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit206_Callback(hObject, eventdata, handles)
% hObject    handle to edit206 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit206 as text
%        str2double(get(hObject,'String')) returns contents of edit206 as a double


% --- Executes during object creation, after setting all properties.
function edit206_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit206 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton250.
function pushbutton250_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton250 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit207_Callback(hObject, eventdata, handles)
% hObject    handle to edit207 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit207 as text
%        str2double(get(hObject,'String')) returns contents of edit207 as a double


% --- Executes during object creation, after setting all properties.
function edit207_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit207 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit208_Callback(hObject, eventdata, handles)
% hObject    handle to edit208 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit208 as text
%        str2double(get(hObject,'String')) returns contents of edit208 as a double


% --- Executes during object creation, after setting all properties.
function edit208_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit208 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit209_Callback(hObject, eventdata, handles)
% hObject    handle to edit209 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit209 as text
%        str2double(get(hObject,'String')) returns contents of edit209 as a double


% --- Executes during object creation, after setting all properties.
function edit209_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit209 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit210_Callback(hObject, eventdata, handles)
% hObject    handle to edit210 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit210 as text
%        str2double(get(hObject,'String')) returns contents of edit210 as a double


% --- Executes during object creation, after setting all properties.
function edit210_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit210 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit211_Callback(hObject, eventdata, handles)
% hObject    handle to edit211 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit211 as text
%        str2double(get(hObject,'String')) returns contents of edit211 as a double


% --- Executes during object creation, after setting all properties.
function edit211_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit211 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit212_Callback(hObject, eventdata, handles)
% hObject    handle to edit212 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit212 as text
%        str2double(get(hObject,'String')) returns contents of edit212 as a double


% --- Executes during object creation, after setting all properties.
function edit212_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit212 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit213_Callback(hObject, eventdata, handles)
% hObject    handle to edit213 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit213 as text
%        str2double(get(hObject,'String')) returns contents of edit213 as a double


% --- Executes during object creation, after setting all properties.
function edit213_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit213 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox46.
function checkbox46_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox46


% --- Executes on button press in pushbutton251.
function pushbutton251_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton251 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit214_Callback(hObject, eventdata, handles)
% hObject    handle to edit214 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit214 as text
%        str2double(get(hObject,'String')) returns contents of edit214 as a double


% --- Executes during object creation, after setting all properties.
function edit214_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit214 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton252.
function pushbutton252_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton252 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton253.
function pushbutton253_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton253 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton254.
function pushbutton254_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton254 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton255.
function pushbutton255_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton255 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit215_Callback(hObject, eventdata, handles)
% hObject    handle to edit215 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit215 as text
%        str2double(get(hObject,'String')) returns contents of edit215 as a double


% --- Executes during object creation, after setting all properties.
function edit215_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit215 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit216_Callback(hObject, eventdata, handles)
% hObject    handle to edit216 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit216 as text
%        str2double(get(hObject,'String')) returns contents of edit216 as a double


% --- Executes during object creation, after setting all properties.
function edit216_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit216 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit217_Callback(hObject, eventdata, handles)
% hObject    handle to edit217 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit217 as text
%        str2double(get(hObject,'String')) returns contents of edit217 as a double


% --- Executes during object creation, after setting all properties.
function edit217_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit217 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit218_Callback(hObject, eventdata, handles)
% hObject    handle to edit218 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit218 as text
%        str2double(get(hObject,'String')) returns contents of edit218 as a double


% --- Executes during object creation, after setting all properties.
function edit218_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit218 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit219_Callback(hObject, eventdata, handles)
% hObject    handle to edit219 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit219 as text
%        str2double(get(hObject,'String')) returns contents of edit219 as a double


% --- Executes during object creation, after setting all properties.
function edit219_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit219 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit220_Callback(hObject, eventdata, handles)
% hObject    handle to edit220 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit220 as text
%        str2double(get(hObject,'String')) returns contents of edit220 as a double


% --- Executes during object creation, after setting all properties.
function edit220_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit220 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit221_Callback(hObject, eventdata, handles)
% hObject    handle to edit221 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit221 as text
%        str2double(get(hObject,'String')) returns contents of edit221 as a double


% --- Executes during object creation, after setting all properties.
function edit221_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit221 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit222_Callback(hObject, eventdata, handles)
% hObject    handle to edit222 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit222 as text
%        str2double(get(hObject,'String')) returns contents of edit222 as a double


% --- Executes during object creation, after setting all properties.
function edit222_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit222 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit223_Callback(hObject, eventdata, handles)
% hObject    handle to edit223 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit223 as text
%        str2double(get(hObject,'String')) returns contents of edit223 as a double


% --- Executes during object creation, after setting all properties.
function edit223_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit223 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit224_Callback(hObject, eventdata, handles)
% hObject    handle to edit224 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit224 as text
%        str2double(get(hObject,'String')) returns contents of edit224 as a double


% --- Executes during object creation, after setting all properties.
function edit224_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit224 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox47.
function checkbox47_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox47



function edit225_Callback(hObject, eventdata, handles)
% hObject    handle to edit225 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit225 as text
%        str2double(get(hObject,'String')) returns contents of edit225 as a double


% --- Executes during object creation, after setting all properties.
function edit225_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit225 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit226_Callback(hObject, eventdata, handles)
% hObject    handle to edit226 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit226 as text
%        str2double(get(hObject,'String')) returns contents of edit226 as a double


% --- Executes during object creation, after setting all properties.
function edit226_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit226 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton256.
function pushbutton256_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton256 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox26.
function listbox26_Callback(hObject, eventdata, handles)
% hObject    handle to listbox26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox26 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox26


% --- Executes during object creation, after setting all properties.
function listbox26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit227_Callback(hObject, eventdata, handles)
% hObject    handle to edit227 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit227 as text
%        str2double(get(hObject,'String')) returns contents of edit227 as a double


% --- Executes during object creation, after setting all properties.
function edit227_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit227 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit228_Callback(hObject, eventdata, handles)
% hObject    handle to edit228 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit228 as text
%        str2double(get(hObject,'String')) returns contents of edit228 as a double


% --- Executes during object creation, after setting all properties.
function edit228_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit228 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit229_Callback(hObject, ~, handles)
% hObject    handle to edit229 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit229 as text
%        str2double(get(hObject,'String')) returns contents of edit229 as a double


% --- Executes during object creation, after setting all properties.
function edit229_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit229 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit113_Callback(hObject, eventdata, handles)
% hObject    handle to edit113 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit113 as text
%        str2double(get(hObject,'String')) returns contents of edit113 as a double


% --- Executes during object creation, after setting all properties.
function edit113_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit113 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit114_Callback(hObject, eventdata, handles)
% hObject    handle to edit114 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit114 as text
%        str2double(get(hObject,'String')) returns contents of edit114 as a double


% --- Executes during object creation, after setting all properties.
function edit114_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit114 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton171.
function pushbutton171_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton171 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit115_Callback(hObject, eventdata, handles)
% hObject    handle to edit115 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit115 as text
%        str2double(get(hObject,'String')) returns contents of edit115 as a double


% --- Executes during object creation, after setting all properties.
function edit115_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit115 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton172.
function pushbutton172_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton172 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit116_Callback(hObject, eventdata, handles)
% hObject    handle to edit116 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit116 as text
%        str2double(get(hObject,'String')) returns contents of edit116 as a double


% --- Executes during object creation, after setting all properties.
function edit116_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit116 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit117_Callback(hObject, eventdata, handles)
% hObject    handle to edit117 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit117 as text
%        str2double(get(hObject,'String')) returns contents of edit117 as a double


% --- Executes during object creation, after setting all properties.
function edit117_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit117 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton173.
function pushbutton173_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton173 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit118_Callback(hObject, eventdata, handles)
% hObject    handle to edit118 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit118 as text
%        str2double(get(hObject,'String')) returns contents of edit118 as a double


% --- Executes during object creation, after setting all properties.
function edit118_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit118 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit119_Callback(hObject, eventdata, handles)
% hObject    handle to edit119 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit119 as text
%        str2double(get(hObject,'String')) returns contents of edit119 as a double


% --- Executes during object creation, after setting all properties.
function edit119_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit119 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit120_Callback(hObject, eventdata, handles)
% hObject    handle to edit120 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit120 as text
%        str2double(get(hObject,'String')) returns contents of edit120 as a double


% --- Executes during object creation, after setting all properties.
function edit120_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit120 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox24.
function checkbox24_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox24


% --- Executes on selection change in listbox18.
function listbox18_Callback(hObject, eventdata, handles)
% hObject    handle to listbox18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox18 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox18


% --- Executes during object creation, after setting all properties.
function listbox18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit121_Callback(hObject, eventdata, handles)
% hObject    handle to edit121 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit121 as text
%        str2double(get(hObject,'String')) returns contents of edit121 as a double


% --- Executes during object creation, after setting all properties.
function edit121_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit121 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit122_Callback(hObject, eventdata, handles)
% hObject    handle to edit122 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit122 as text
%        str2double(get(hObject,'String')) returns contents of edit122 as a double


% --- Executes during object creation, after setting all properties.
function edit122_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit122 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit123_Callback(hObject, eventdata, handles)
% hObject    handle to edit123 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit123 as text
%        str2double(get(hObject,'String')) returns contents of edit123 as a double


% --- Executes during object creation, after setting all properties.
function edit123_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit123 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit124_Callback(hObject, eventdata, handles)
% hObject    handle to edit124 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit124 as text
%        str2double(get(hObject,'String')) returns contents of edit124 as a double


% --- Executes during object creation, after setting all properties.
function edit124_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit124 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit125_Callback(hObject, eventdata, handles)
% hObject    handle to edit125 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit125 as text
%        str2double(get(hObject,'String')) returns contents of edit125 as a double


% --- Executes during object creation, after setting all properties.
function edit125_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit125 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit126_Callback(hObject, eventdata, handles)
% hObject    handle to edit126 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit126 as text
%        str2double(get(hObject,'String')) returns contents of edit126 as a double


% --- Executes during object creation, after setting all properties.
function edit126_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit126 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit127_Callback(hObject, eventdata, handles)
% hObject    handle to edit127 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit127 as text
%        str2double(get(hObject,'String')) returns contents of edit127 as a double


% --- Executes during object creation, after setting all properties.
function edit127_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit127 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit128_Callback(hObject, eventdata, handles)
% hObject    handle to edit128 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit128 as text
%        str2double(get(hObject,'String')) returns contents of edit128 as a double


% --- Executes during object creation, after setting all properties.
function edit128_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit128 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit129_Callback(hObject, eventdata, handles)
% hObject    handle to edit129 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit129 as text
%        str2double(get(hObject,'String')) returns contents of edit129 as a double


% --- Executes during object creation, after setting all properties.
function edit129_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit129 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit130_Callback(hObject, eventdata, handles)
% hObject    handle to edit130 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit130 as text
%        str2double(get(hObject,'String')) returns contents of edit130 as a double


% --- Executes during object creation, after setting all properties.
function edit130_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit130 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit131_Callback(hObject, eventdata, handles)
% hObject    handle to edit131 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit131 as text
%        str2double(get(hObject,'String')) returns contents of edit131 as a double


% --- Executes during object creation, after setting all properties.
function edit131_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit131 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox25.
function checkbox25_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox25


% --- Executes on selection change in listbox19.
function listbox19_Callback(hObject, eventdata, handles)
% hObject    handle to listbox19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox19 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox19


% --- Executes during object creation, after setting all properties.
function listbox19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton174.
function pushbutton174_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton174 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox26.
function checkbox26_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox26


% --- Executes on button press in checkbox27.
function checkbox27_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox27


% --- Executes on button press in checkbox28.
function checkbox28_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox28


% --- Executes on button press in checkbox29.
function checkbox29_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox29


% --- Executes on button press in checkbox30.
function checkbox30_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox30


% --- Executes on button press in pushbutton175.
function pushbutton175_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton175 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox31.
function checkbox31_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox31


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


% --- Executes on button press in checkbox32.
function checkbox32_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox32


% --- Executes on button press in checkbox33.
function checkbox33_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox33



function edit132_Callback(hObject, eventdata, handles)
% hObject    handle to edit132 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit132 as text
%        str2double(get(hObject,'String')) returns contents of edit132 as a double


% --- Executes during object creation, after setting all properties.
function edit132_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit132 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit133_Callback(hObject, eventdata, handles)
% hObject    handle to edit133 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit133 as text
%        str2double(get(hObject,'String')) returns contents of edit133 as a double


% --- Executes during object creation, after setting all properties.
function edit133_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit133 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit134_Callback(hObject, eventdata, handles)
% hObject    handle to edit134 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit134 as text
%        str2double(get(hObject,'String')) returns contents of edit134 as a double


% --- Executes during object creation, after setting all properties.
function edit134_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit134 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton176.
function pushbutton176_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton176 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit135_Callback(hObject, eventdata, handles)
% hObject    handle to edit135 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit135 as text
%        str2double(get(hObject,'String')) returns contents of edit135 as a double


% --- Executes during object creation, after setting all properties.
function edit135_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit135 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton177.
function pushbutton177_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton177 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit136_Callback(hObject, eventdata, handles)
% hObject    handle to edit136 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit136 as text
%        str2double(get(hObject,'String')) returns contents of edit136 as a double


% --- Executes during object creation, after setting all properties.
function edit136_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit136 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton178.
function pushbutton178_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton178 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit137_Callback(hObject, eventdata, handles)
% hObject    handle to edit137 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit137 as text
%        str2double(get(hObject,'String')) returns contents of edit137 as a double


% --- Executes during object creation, after setting all properties.
function edit137_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit137 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit138_Callback(hObject, eventdata, handles)
% hObject    handle to edit138 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit138 as text
%        str2double(get(hObject,'String')) returns contents of edit138 as a double


% --- Executes during object creation, after setting all properties.
function edit138_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit138 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit139_Callback(hObject, eventdata, handles)
% hObject    handle to edit139 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit139 as text
%        str2double(get(hObject,'String')) returns contents of edit139 as a double


% --- Executes during object creation, after setting all properties.
function edit139_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit139 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit140_Callback(hObject, eventdata, handles)
% hObject    handle to edit140 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit140 as text
%        str2double(get(hObject,'String')) returns contents of edit140 as a double


% --- Executes during object creation, after setting all properties.
function edit140_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit140 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit141_Callback(hObject, eventdata, handles)
% hObject    handle to edit141 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit141 as text
%        str2double(get(hObject,'String')) returns contents of edit141 as a double


% --- Executes during object creation, after setting all properties.
function edit141_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit141 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit142_Callback(hObject, eventdata, handles)
% hObject    handle to edit142 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit142 as text
%        str2double(get(hObject,'String')) returns contents of edit142 as a double


% --- Executes during object creation, after setting all properties.
function edit142_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit142 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit143_Callback(hObject, eventdata, handles)
% hObject    handle to edit143 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit143 as text
%        str2double(get(hObject,'String')) returns contents of edit143 as a double


% --- Executes during object creation, after setting all properties.
function edit143_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit143 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox34.
function checkbox34_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox34


% --- Executes on button press in pushbutton179.
function pushbutton179_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton179 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit144_Callback(hObject, eventdata, handles)
% hObject    handle to edit144 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit144 as text
%        str2double(get(hObject,'String')) returns contents of edit144 as a double


% --- Executes during object creation, after setting all properties.
function edit144_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit144 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton180.
function pushbutton180_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton181.
function pushbutton181_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton181 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton182.
function pushbutton182_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton182 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton183.
function pushbutton183_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton183 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit145_Callback(hObject, eventdata, handles)
% hObject    handle to edit145 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit145 as text
%        str2double(get(hObject,'String')) returns contents of edit145 as a double


% --- Executes during object creation, after setting all properties.
function edit145_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit145 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit146_Callback(hObject, eventdata, handles)
% hObject    handle to edit146 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit146 as text
%        str2double(get(hObject,'String')) returns contents of edit146 as a double


% --- Executes during object creation, after setting all properties.
function edit146_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit146 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit147_Callback(hObject, eventdata, handles)
% hObject    handle to edit147 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit147 as text
%        str2double(get(hObject,'String')) returns contents of edit147 as a double


% --- Executes during object creation, after setting all properties.
function edit147_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit147 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit148_Callback(hObject, eventdata, handles)
% hObject    handle to edit148 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit148 as text
%        str2double(get(hObject,'String')) returns contents of edit148 as a double


% --- Executes during object creation, after setting all properties.
function edit148_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit148 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit149_Callback(hObject, eventdata, handles)
% hObject    handle to edit149 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit149 as text
%        str2double(get(hObject,'String')) returns contents of edit149 as a double


% --- Executes during object creation, after setting all properties.
function edit149_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit149 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit150_Callback(hObject, ~, handles)
% hObject    handle to edit150 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit150 as text
%        str2double(get(hObject,'String')) returns contents of edit150 as a double


% --- Executes during object creation, after setting all properties.
function edit150_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit150 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit151_Callback(hObject, eventdata, handles)
% hObject    handle to edit151 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit151 as text
%        str2double(get(hObject,'String')) returns contents of edit151 as a double


% --- Executes during object creation, after setting all properties.
function edit151_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit151 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit152_Callback(hObject, eventdata, handles)
% hObject    handle to edit152 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit152 as text
%        str2double(get(hObject,'String')) returns contents of edit152 as a double


% --- Executes during object creation, after setting all properties.
function edit152_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit152 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit153_Callback(hObject, eventdata, handles)
% hObject    handle to edit153 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit153 as text
%        str2double(get(hObject,'String')) returns contents of edit153 as a double


% --- Executes during object creation, after setting all properties.
function edit153_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit153 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit154_Callback(hObject, eventdata, handles)
% hObject    handle to edit154 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit154 as text
%        str2double(get(hObject,'String')) returns contents of edit154 as a double


% --- Executes during object creation, after setting all properties.
function edit154_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit154 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox35.
function checkbox35_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox35



function edit155_Callback(hObject, eventdata, handles)
% hObject    handle to edit155 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit155 as text
%        str2double(get(hObject,'String')) returns contents of edit155 as a double


% --- Executes during object creation, after setting all properties.
function edit155_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit155 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit156_Callback(hObject, eventdata, handles)
% hObject    handle to edit156 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit156 as text
%        str2double(get(hObject,'String')) returns contents of edit156 as a double


% --- Executes during object creation, after setting all properties.
function edit156_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit156 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton184.
function pushbutton184_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton184 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox20.
function listbox20_Callback(hObject, eventdata, handles)
% hObject    handle to listbox20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox20 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox20


% --- Executes during object creation, after setting all properties.
function listbox20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit157_Callback(hObject, eventdata, handles)
% hObject    handle to edit157 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit157 as text
%        str2double(get(hObject,'String')) returns contents of edit157 as a double


% --- Executes during object creation, after setting all properties.
function edit157_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit157 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit158_Callback(hObject, eventdata, handles)
% hObject    handle to edit158 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit158 as text
%        str2double(get(hObject,'String')) returns contents of edit158 as a double


% --- Executes during object creation, after setting all properties.
function edit158_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit158 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit159_Callback(~, eventdata, handles)
% hObject    handle to edit159 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit159 as text
%        str2double(get(hObject,'String')) returns contents of edit159 as a double


% --- Executes during object creation, after setting all properties.
function edit159_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit159 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rtEch_Callback(hObject, eventdata, handles)
% hObject    handle to rtEch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rtEch as text
%        str2double(get(hObject,'String')) returns contents of rtEch as a double


% --- Executes during object creation, after setting all properties.
function rtEch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rtEch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rt50Hz.
function rt50Hz_Callback(hObject, eventdata, handles)
% hObject    handle to rt50Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rt50Hz


% --- Executes on button press in rt60Hz.
function rt60Hz_Callback(hObject, eventdata, handles)
% hObject    handle to rt60Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rt60Hz


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over lsFiltrosEst.
function lsFiltrosEst_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to lsFiltrosEst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton257.
function pushbutton257_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton257 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global globaldir
%[file,path]=uigetfile([globaldir '\*.dir']);
file=get(handles.txListaTel,'String');%[path file];
fid=fopen(file,'rt');
str = fgetl(fid);
i=1;
while(ischar(str))
    datos = strread(str,'%s');%,'delimiter',',');
    datos{1}
    dist(i)=str2num(datos{1});
    files{i}=datos{2};
    i=i+1;
    str=fgetl(fid);
end

global objLstShot;
indice = get(handles.lsPShot,'Value');
indiceEst = get(handles.popEstacion,'Value');
shots = objLstShot.Shots;
shot = shots{indice};
ests = shot.objLstEst;
est = get(ests,indiceEst);
Xr1=get(est,'Xr1');
Xr2=get(est,'Xr2');
d = (Xr1+Xr2)/2;
[a,b]=min(abs(dist-d));
files{b};
set(handles.txImpedancia2,'String',files{b});




% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over btEPVolver.
function btEPVolver_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to btEPVolver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function ftTaper_Callback(hObject, eventdata, handles)
% hObject    handle to ftTaper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ftTaper as text
%        str2double(get(hObject,'String')) returns contents of ftTaper as a double


% --- Executes during object creation, after setting all properties.
function ftTaper_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ftTaper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function pushbutton87_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton260.
function pushbutton260_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton260 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.pushbutton260,'Value')
set(handles.pushbutton260,'BackgroundColor',[0 1 0]);
set(handles.pushbutton260,'String','OK :D');
else
set(handles.pushbutton260,'BackgroundColor',[1 0 0]);
set(handles.pushbutton260,'String','KILL :C');
end

global objLstShot;
shots = objLstShot.Shots;
ests = shots{get(handles.popShot,'Value')}.objLstEst;
est = get(ests,get(handles.popEstacion,'Value'));
est=set(est,'QC',get(handles.pushbutton260,'Value'));
ests=set(ests,est,get(handles.popEstacion,'Value'));
shots{get(handles.popShot,'Value')}.objLstEst=ests;
objLstShot.Shots=shots;


%
% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton260.
function pushbutton260_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton260 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton261.
function pushbutton261_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton261 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objLstShot;
%opcion = get(handles.chGraficarRes,'Value')*1 + get(handles.chGraficarCarg,'Value')*2;
%[res,carg] = pseudoseccion(objLstShot);
[res,carg] = getestdata(objLstShot);
res
if get(handles.checkbox50,'Value')
psres(res,handles);
end
if get(handles.checkbox49,'Value')
pscarg(carg,handles);
end


% --- Executes on button press in checkbox49.
function checkbox49_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox49


% --- Executes on button press in checkbox50.
function checkbox50_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox50

function ShotEdit(hObject, eventdata, handles)



function txHxchx_Callback(hObject, eventdata, handles)
% hObject    handle to txHxchx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txHxchx as text
%        str2double(get(hObject,'String')) returns contents of txHxchx as a double


% --- Executes during object creation, after setting all properties.
function txHxchx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txHxchx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txRGanancia2x_Callback(hObject, eventdata, handles)
% hObject    handle to txRGanancia2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txRGanancia2x as text
%        str2double(get(hObject,'String')) returns contents of txRGanancia2x as a double


% --- Executes during object creation, after setting all properties.
function txRGanancia2x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txRGanancia2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txRFMin2x_Callback(hObject, eventdata, handles)
% hObject    handle to txRFMin2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txRFMin2x as text
%        str2double(get(hObject,'String')) returns contents of txRFMin2x as a double


% --- Executes during object creation, after setting all properties.
function txRFMin2x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txRFMin2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txRFNx_Callback(hObject, eventdata, handles)
% hObject    handle to txRFNx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txRFNx as text
%        str2double(get(hObject,'String')) returns contents of txRFNx as a double


% --- Executes during object creation, after setting all properties.
function txRFNx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txRFNx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txHychx_Callback(hObject, eventdata, handles)
% hObject    handle to txHychx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txHychx as text
%        str2double(get(hObject,'String')) returns contents of txHychx as a double


% --- Executes during object creation, after setting all properties.
function txHychx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txHychx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txRFmax2x_Callback(hObject, eventdata, handles)
% hObject    handle to txRFmax2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txRFmax2x as text
%        str2double(get(hObject,'String')) returns contents of txRFmax2x as a double


% --- Executes during object creation, after setting all properties.
function txRFmax2x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txRFmax2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in chRestarRuidoPx.
function chRestarRuidoPx_Callback(hObject, eventdata, handles)
% hObject    handle to chRestarRuidoPx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chRestarRuidoPx


% --- Executes on button press in pushbutton263.
function pushbutton263_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton263 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globaldir
[file,path]=uigetfile([globaldir '\*.dir']);
file=[path file];
if ~isempty(file)
    set(handles.txImpedancia2x,'String',file);
end




function txImpedancia2x_Callback(hObject, eventdata, handles)
% hObject    handle to txImpedancia2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txImpedancia2x as text
%        str2double(get(hObject,'String')) returns contents of txImpedancia2x as a double


% --- Executes during object creation, after setting all properties.
function txImpedancia2x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txImpedancia2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton264.
function pushbutton264_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton264 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TFedit;


function rtEchx_Callback(hObject, eventdata, handles)
% hObject    handle to rtEchx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rtEchx as text
%        str2double(get(hObject,'String')) returns contents of rtEchx as a double


% --- Executes during object creation, after setting all properties.
function rtEchx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rtEchx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rt50Hzx.
function rt50Hzx_Callback(hObject, eventdata, handles)
% hObject    handle to rt50Hzx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rt50Hzx


% --- Executes on button press in rt60Hzx.
function rt60Hzx_Callback(hObject, eventdata, handles)
% hObject    handle to rt60Hzx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rt60Hzx



function ftTaperx_Callback(hObject, eventdata, handles)
% hObject    handle to ftTaperx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ftTaperx as text
%        str2double(get(hObject,'String')) returns contents of ftTaperx as a double


% --- Executes during object creation, after setting all properties.
function ftTaperx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ftTaperx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function pnProceso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pnProceso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
