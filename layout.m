function varargout = layout(varargin)
% LAYOUT MATLAB code for layout.fig
%      LAYOUT, by itself, creates a new LAYOUT or raises the existing
%      singleton*.
%
%      H = LAYOUT returns the handle to a new LAYOUT or the handle to
%      the existing singleton*.
%
%      LAYOUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAYOUT.M with the given input arguments.
%
%      LAYOUT('Property','Value',...) creates a new LAYOUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before layout_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to layout_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help layout

% Last Modified by GUIDE v2.5 07-Mar-2021 10:59:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @layout_OpeningFcn, ...
                   'gui_OutputFcn',  @layout_OutputFcn, ...
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


% --- Executes just before layout is made visible.
function layout_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to layout (see VARARGIN)

% Choose default command line output for layout
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Popola il popupmenu con le immagini nella cartella in modo dinamico
array = {''};
Images = dir('img/*.jpg');
for file=1:length(Images)
    array = [array, Images(file).name];
end
% natsort serve per ordinare gli elementi
array = natsortfiles(array);
set(handles.imgpopmenu,'string',array)

% --- Outputs from this function are returned to the command line.
function varargout = layout_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in analizzabutton.
function analizzabutton_Callback(hObject, eventdata, handles)
% hObject    handle to analizzabutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
index = get(handles.imgpopmenu,'Value');
imgs = get(handles.imgpopmenu,'String');
imgName = imgs{index};
if(imgName ~= "")
    [ImageDefects] = main(imgName);
    figure; imshow(ImageDefects)

    set(gcf,'MenuBar','none')
    set(gca,'DataAspectRatioMode','auto')
    set(gca,'Position',[0 0 1 1])
    set(gcf, 'Position', get(0, 'Screensize'));

end

% --- Executes on selection change in imgpopmenu.
function imgpopmenu_Callback(hObject, eventdata, handles)
% hObject    handle to imgpopmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns imgpopmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from imgpopmenu
index = get(handles.imgpopmenu,'Value');
imgs = get(handles.imgpopmenu,'String');
imgName = imgs{index};

if(imgName ~= "")
    % Mostro l'immagine sorgente
    axes(handles.axes2);
    imageSource = strcat('img/', imgName);
    imshow(imageSource);

    % Mostro l'immagine con i difetti
    axes(handles.axes3);
    [ImageDefects] = main(imgName);
    imshow(ImageDefects);
else
    % Rimuovo le immagini precedenti
    axes(handles.axes2);
    hold off;
    cla reset;
    axes(handles.axes3);
    hold off;
    cla reset;
end

% --- Executes during object creation, after setting all properties.
function imgpopmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imgpopmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end