function varargout = ip(varargin)
% IP MATLAB code for ip.fig
%      IP, by itself, creates a new IP or raises the existing
%      singleton*.
%
%      H = IP returns the handle to a new IP or the handle to
%      the existing singleton*.
%
%      IP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IP.M with the given input arguments.
%
%      IP('Property','Value',...) creates a new IP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ip_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ip_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ip

% Last Modified by GUIDE v2.5 02-Apr-2020 18:30:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ip_OpeningFcn, ...
                   'gui_OutputFcn',  @ip_OutputFcn, ...
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


% --- Executes just before ip is made visible.
function ip_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ip (see VARARGIN)

% Choose default command line output for ip
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ip wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ip_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
axes(hObject)
imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\background.jpg')


function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[imname,impath]=uigetfile({'*.jpg;*.png'});
im=imread([impath,'/',imname]);
%preprocessing
%resize image
im=imresize(im,[128 128]);
%remove noise;
%seperate channels
 r_channel=im(:,:,1);
 b_channel=im(:,:,2);
 g_channel=im(:,:,3);
 %denoise each channel
 r_channel=medfilt2(r_channel);
 g_channel=medfilt2(g_channel);
 b_channel=medfilt2(b_channel);
 %restore channels
 rgbim(:,:,1)=r_channel;
 rgbim(:,:,2)=g_channel;
 rgbim(:,:,3)=b_channel;
 %featureextraction
fet=totalfeature(rgbim);

load projectdb;

k=length(my_database);

for j=1:k
    D(j)=dist(fet',my_database(1,j).feature);
  
end
[value,index]=min(D);
if value<4500
   currency_name=my_database(index).unnamed;
     currency_country=my_database(index).unnamed1;
   fprintf('recognized currency is : ');
   disp(currency_name);
    switch index
        case 1
            axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\australiandollar.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\australiaf.jpg');
            case 2
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\danish krone.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\Denmarkf.jpg');
            case 3
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\dollar.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\usaf.jpg');
            case 4
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\egyptian pound.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\egypt.jpg');
            case 5
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\france euro.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\francef.jpg');
            case 6
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\Iceland_Currency_krona.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\Icelandf.jpg');
            case 7
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\indianrupee.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\indiaf.jpg');
            case 8
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\indonesia.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\indonesiaf.jpg');
            case 9
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\iran.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\iranf.jpg');
            case 10
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\korea.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\koreaf.jpg');
            case 11
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\malaysia.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\malaysiaf.jpg');
            case 12
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\yen.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\chinaf.jpg');
            case 13
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\russia rouble.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\russiaf.jpg');
            case 14
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\saud-arabia1.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\saudif.jpg');
            case 15
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\soth africa.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\africaf.jpg');
            case 16
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\Switzerland 1000 Franken.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\sf.jpg');
            case 17
                axes(handles.axes2);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\turkey.jpg');
            axes(handles.axes3);
            imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenyf\turkeyf.jpg');
    end
          
else
  currency_name='invalid currency';
  currency_country='x';
  axes(handles.axes2);
  imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\download.jpg');
  axes(handles.axes3);
   imshow('C:\Users\G Navyadharagana Sai\Desktop\IP_Project\CURRENCY-RECOGNITION-master\currenynotes\download.jpg');
    disp('no matches found');
end

set(handles.edit1,'String',currency_name);
set(handles.edit2,'String',currency_country);


% --- Executes on button press in display.
function display_Callback(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
