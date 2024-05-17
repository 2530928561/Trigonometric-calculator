function varargout = tra_cal_1(varargin)
% python版本为3.8，matlab版本2023，编码为utf-8，涉及地址问题,使用时需要修改地址,配置需要的python环境，修改pushbutton以下地址
%pyenv('Version','D:\Anaconda\envs\mcs\python.exe');
%project_path ='C:\Users\tongjiang\Desktop\gui\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\';
%insert(py.sys.path, int32(0), 'C:\Users\tongjiang\Desktop\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\function')%添加包的路径在matlab中
% TRA_CAL_1 MATLAB code for tra_cal_1.fig
%      TRA_CAL_1, by itself, creates a new TRA_CAL_1 or raises the existing
%      singleton*.
%
%      H = TRA_CAL_1 returns the handle to a new TRA_CAL_1 or the handle to
%      the existing singleton*.
%
%      TRA_CAL_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRA_CAL_1.M with the given input arguments.
%
%      TRA_CAL_1('Property','Value',...) creates a new TRA_CAL_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tra_cal_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tra_cal_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tra_cal_1

% Last Modified by GUIDE v2.5 16-May-2024 21:03:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tra_cal_1_OpeningFcn, ...
                   'gui_OutputFcn',  @tra_cal_1_OutputFcn, ...
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




% --- Executes just before tra_cal_1 is made visible.
function tra_cal_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tra_cal_1 (see VARARGIN)

% Choose default command line output for tra_cal_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tra_cal_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tra_cal_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(handles.popupmenu1,'value');
switch value
    % 计算正弦函数
    case 2
        textString = get(handles.edit1,'String');
        textint =str2double(textString);
        %fprintf("%2f",rad);
        if isempty(str2num(textString))
            textString1='输入的不是角度';
             set(handles.edit3,'String',textString1);
        % 计算正弦值
        else 
            pyenv('Version','D:\Anaconda\envs\mcs\python.exe');
            project_path ='C:\Users\tongjiang\Desktop\gui\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\';
            insert(py.sys.path, int32(0), 'C:\Users\tongjiang\Desktop\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\function')%添加包的路径在matlab中
            functions_path = fullfile(project_path, 'function');
            insert(py.sys.path, int32(0), functions_path);
            mysin= py.importlib.import_module('trigonomtric');  % 不要带py后缀,不然报错
            sin_value = mysin.my_sin(textint);
            sin_string =num2str(sin_value);
            textString1 = ['sin',textString,'=',sin_string];
            set(handles.edit3,'String',textString1);% 将计算结果写入文本框
        end
    % 计算反正弦函数
    case 3
         % 构建反正弦函数在x=0处的泰勒级数
       textString = get(handles.edit1,'String');
       textint =str2double(textString);
       if abs(textint)>1
          textString1='输入的值超出范围';
          set(handles.edit3,'String',textString1);  
       else 
           pyenv('Version','D:\Anaconda\envs\mcs\python.exe');
           project_path ='C:\Users\tongjiang\Desktop\gui\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\';
           insert(py.sys.path, int32(0), 'C:\Users\tongjiang\Desktop\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\function')%添加包的路径在matlab中
           functions_path = fullfile(project_path, 'function');
           insert(py.sys.path, int32(0), functions_path);
           py.sys.path %检查现在matlab能找到的路径都有谁
           myarcsin= py.importlib.import_module('anti_trigonomtric');  % 不要带py后缀,不然报错
           arcsin_value = myarcsin.my_arcsin(textint);
           arcsin_string = num2str(arcsin_value);
           textString1 = ['Arcsin',textString,'=',arcsin_string];
           set(handles.edit3,'String',textString1); % 将计算结果写入文本框
       end
        
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
% 获取下拉菜单的值
value = get(handles.popupmenu1,'value');
switch value
    case 1
        text_in = '请选择计算类型';
        type_cal = 1;
    case 2
        text_in = '请输入弧度';
        text_act1 = '计算正弦值';
        text_act2 = '计算余弦值';
        text_act3 = '计算正切值';
        type_cal = 2;
    case 3
        text_in = '请输入数值';
        text_act1 = '计算反正弦值';
        text_act2 = '计算反余弦值';
        text_act3 = '计算反正切值';
        type_cal = 3;
end
% 设置到静态文本框中
set(handles.text4,'String',text_in);
set(handles.pushbutton1,'String',text_act1);
set(handles.pushbutton3,'String',text_act2);
set(handles.pushbutton5,'String',text_act3);

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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(handles.popupmenu1,'value');
switch value
    case 2
       textString = get(handles.edit1,'String');
       textint =str2double(textString);
       if isempty(str2num(textString))
           textString1='输入的不是角度';
           set(handles.edit3,'String',textString1);
       else
           pyenv('Version','D:\Anaconda\envs\mcs\python.exe');
           project_path ='C:\Users\tongjiang\Desktop\gui\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\';
           insert(py.sys.path, int32(0), 'C:\Users\tongjiang\Desktop\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\function')%添加包的路径在matlab中
           functions_path = fullfile(project_path, 'function');
           insert(py.sys.path, int32(0), functions_path);
           mycos= py.importlib.import_module('trigonomtric');  % 不要带py后缀,不然报错
           cos_value = mycos.my_cos(textint);
           cos_string =num2str(cos_value);
           textString1 = ['cos',textString,'=',cos_string];
           set(handles.edit3,'String',textString1); % 将计算结果写入文本框
       end
    case 3
         % 构建反正弦函数在x=0处的泰勒级数
       textString = get(handles.edit1,'String');
       textint =str2double(textString);
       n_terms = 50;
       unit = 100;
       if abs(textint)>1
          textString1='输入的值超出范围';
          set(handles.edit3,'String',textString1);  
       else 
           pyenv('Version','D:\Anaconda\envs\mcs\python.exe');
           project_path ='C:\Users\tongjiang\Desktop\gui\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\';
           insert(py.sys.path, int32(0), 'C:\Users\tongjiang\Desktop\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\function')%添加包的路径在matlab中
           functions_path = fullfile(project_path, 'function');
           insert(py.sys.path, int32(0), functions_path);
           py.sys.path %检查现在matlab能找到的路径都有谁
           myarcsin= py.importlib.import_module('anti_trigonomtric');  % 不要带py后缀,不然报错
           arccos_value = myarcsin.my_arccos(textint);
           arccos_string = num2str(arccos_value);
           textString1 = ['Arccos',textString,'=',arccos_string];
           set(handles.edit3,'String',textString1); % 将计算结果写入文本框
      end
      
 end



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(handles.popupmenu1,'value');
switch value
    % 计算正弦函数
    case 2
        textString = get(handles.edit1,'String');
        textint =str2double(textString);
        %fprintf("%2f",rad);
        if isempty(str2num(textString))
            textString1='输入的不是弧度';
             set(handles.edit3,'String',textString1);
        % 计算正弦值
        else 
            pyenv('Version','D:\Anaconda\envs\mcs\python.exe');
            project_path ='C:\Users\tongjiang\Desktop\gui\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\';
            insert(py.sys.path, int32(0), 'C:\Users\tongjiang\Desktop\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\function')%添加包的路径在matlab中
            functions_path = fullfile(project_path, 'function');
            insert(py.sys.path, int32(0), functions_path);
            mytan= py.importlib.import_module('trigonomtric');  % 不要带py后缀,不然报错
            tan_value = mytan.my_tan(textint);
            tan_string =num2str(tan_value);
            textString1 = ['tan',textString,'=',tan_string];
            set(handles.edit3,'String',textString1);% 将计算结果写入文本框
        end
    % 计算反正弦函数
    case 3
         % 构建反正弦函数在x=0处的泰勒级数
       textString = get(handles.edit1,'String');
       textint =str2double(textString);
       if abs(textint)>1
          textString1='输入的值超出范围';
          set(handles.edit3,'String',textString1);  
       else 
           pyenv('Version','D:\Anaconda\envs\mcs\python.exe');
           project_path ='C:\Users\tongjiang\Desktop\gui\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\';
           insert(py.sys.path, int32(0), 'C:\Users\tongjiang\Desktop\Trigonometric-calculator-main\Trigonometric-calculator-main\final_version\function')%添加包的路径在matlab中
           functions_path = fullfile(project_path, 'function');
           insert(py.sys.path, int32(0), functions_path);
           py.sys.path %检查现在matlab能找到的路径都有谁
           myarctan= py.importlib.import_module('anti_trigonomtric');  % 不要带py后缀,不然报错
           arctan_value = myarctan.my_arctan(textint);
           arctan_string = num2str(arctan_value);
           textString1 = ['Arcsin',textString,'=',arctan_string];
           set(handles.edit3,'String',textString1); % 将计算结果写入文本框
       end
        
end
