
clc;
close all;

NC=0;
SC=0;
EC=0;
WC=0;

%% 
north 
 %% 
 south
 %% 
 east
 %% 
 west
 %% 
C = [NC,EC,WC,SC];
[mc,mi]=max(C);
if mi==1
    NorthSignal = 1;
    disp('Green for North')
    disp('Green for North going Pedestrians')
end
if mi==2
    EastSignal = 1;
    disp('Green for East')
    disp('Green for East going Pedestrians')
end
if mi==3
    WestSignal = 1;
    disp('Green for West')
    disp('Green for West going Pedestrians')
end
if mi==4
    SouthSignal = 1;
    disp('Green for South')
    disp('Green for South going pedestrians')
end
%% 
function north
    disp('North Signal')
    instrreset % reset all serial ports
    s = serial('COM4'); % change this to desired Arduino board port
    set(s,'BaudRate',9600); % baud rate for communication

    s.BytesAvailableFcnMode = 'terminator';
    s.BytesAvailableFcn={@callbackSerial};
    
    fopen(s);
    %{
    for i=1:20  % open the comm between Arduino and MATLAB
	    val =fscanf(s);
	    %time = datetime('now','TimeZone', 'local','Format','HH:mm:ss');
	    North(i)= val;
    end
    %}
    function callbackSerial(ser,~)
        global NC;
        NC = NC +1;
        disp(NC);
        val =fscanf(ser);
        numval = str2double(val);
        time = datetime('now','TimeZone', 'local','Format','HH:mm:ss');
        sv = string(val);
        disp(sv);
        disp(time);
        if ( sv == '5C 69 2A A9')
            disp('Emergency');
        end
    end
end

function south
    disp('South Signal')
    instrreset % reset all serial ports
    s = serial('COM4'); % change this to desired Arduino board port
    set(s,'BaudRate',9600); % baud rate for communication

    s.BytesAvailableFcnMode = 'terminator';
    s.BytesAvailableFcn={@callbackSerial};
    
    fopen(s);
    %{
    for i=1:20  % open the comm between Arduino and MATLAB
	    val =fscanf(s);
	    %time = datetime('now','TimeZone', 'local','Format','HH:mm:ss');
	    North(i)= val;
    end
    %}
    function callbackSerial(ser,~)
        SC=0;
        SC = SC +1;
        disp(SC);
        val =fscanf(ser);
        numval = str2double(val);
        time = datetime('now','TimeZone', 'local','Format','HH:mm:ss');
        disp(val);
        disp(time);
    end
end

function west
    disp('West Signal')
    instrreset % reset all serial ports
    s = serial('COM4'); % change this to desired Arduino board port
    set(s,'BaudRate',9600); % baud rate for communication

    s.BytesAvailableFcnMode = 'terminator';
    s.BytesAvailableFcn={@callbackSerial};
    
    fopen(s);
    %{
    for i=1:20  % open the comm between Arduino and MATLAB
	    val =fscanf(s);
	    %time = datetime('now','TimeZone', 'local','Format','HH:mm:ss');
	    North(i)= val;
    end
    %}
    function callbackSerial(ser,~)
        WC =0;
        WC = WC +1;
        disp(WC);
        val =fscanf(ser);
        numval = str2double(val);
        time = datetime('now','TimeZone', 'local','Format','HH:mm:ss');
        disp(val);
        disp(time);
    end
end

function east
    disp('East Signal')
    instrreset % reset all serial ports
    s = serial('COM4'); % change this to desired Arduino board port
    set(s,'BaudRate',9600); % baud rate for communication

    s.BytesAvailableFcnMode = 'terminator';
    s.BytesAvailableFcn={@callbackSerial};
    
    fopen(s);
    %{
    for i=1:20  % open the comm between Arduino and MATLAB
	    val =fscanf(s);
	    %time = datetime('now','TimeZone', 'local','Format','HH:mm:ss');
	    North(i)= val;
    end
    %}
    function callbackSerial(ser,~)
        global EC;
        EC = EC +1;
        disp(EC);
        val =fscanf(ser);
        numval = str2double(val);
        time = datetime('now','TimeZone', 'local','Format','HH:mm:ss');
        disp(val);
        disp(time);
    end
end


