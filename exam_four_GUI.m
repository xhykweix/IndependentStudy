function varargout = exam_four_GUI(varargin)
% EXAM_FOUR_GUI MATLAB code for exam_four_GUI.fig
%      EXAM_FOUR_GUI, by itself, creates a new EXAM_FOUR_GUI or raises the existing
%      singleton*.
%
%      H = EXAM_FOUR_GUI returns the handle to a new EXAM_FOUR_GUI or the handle to
%      the existing singleton*.
%
%      EXAM_FOUR_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAM_FOUR_GUI.M with the given input arguments.
%
%      EXAM_FOUR_GUI('Property','Value',...) creates a new EXAM_FOUR_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exam_four_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exam_four_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exam_four_GUI

% Last Modified by GUIDE v2.5 27-Dec-2020 15:43:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exam_four_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @exam_four_GUI_OutputFcn, ...
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


% --- Executes just before exam_four_GUI is made visible.
function exam_four_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exam_four_GUI (see VARARGIN)

% Choose default command line output for exam_four_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes exam_four_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = exam_four_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
phone_in_hour = 30;
ans = 0;
T = 3;
lambda = phone_in_hour/60;
P = @(k) (((lambda.*T).^k)./factorial(k)).*exp(-lambda.*T);
x = 0:8;
y = zeros(1,8);
for i = 1:8+1
    y(i) = P(i-1);
end
figure
bar(x,y)
xlabel('Number of Phone call in Three Minutes')
ylabel('Probability')
set(handles.text10, 'String', "ANS = "+y(1));
function pushbutton2_Callback(hObject, eventdata, handles)
phone_in_hour = 30;
ans = 0;
T = 3;
x = 0:8;
y = zeros(1,8);
lambda = phone_in_hour/60;
N=phone_in_hour/T;
for i = 1 : 9
    C = nchoosek(N,i-1);
    delta_t = T/N;
    a = @(k) (lambda.*delta_t).^k;
    b = @(k) (1-(lambda.*delta_t)).^(N-k);
    y(i) = C * a(i-1) * b(i-1);
end
figure
bar(x,y)
xlabel('Number of Phone call in Three Minutes')
ylabel('Probability')
set(handles.text8, 'String', "Δt = 3/"+N);
set(handles.text9, 'String', "ANS = "+y(1));


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
