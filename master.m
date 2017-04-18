%% master.m

%{
    Ryan Kellerman
    Rutgers University - B.S. Computer Engineering 2018
    The following code is the master program to operate the Non-Destructive
    Tablet Testing Robotic Arm and RTR Toolbox System
%}

%% Initialize components

clc, clear, close all

% initalize camera (NOTE: Be sure to have MATLAB Support Package for USB
% Webcams installed)

cam = webcam;

% initialize arm

% a = arduino('/dev/cu.usbmodem1411', 'uno','Libraries', 'Servo');
% ... %

% initialize RTR toolbox

% .. %

% create thread pool

delete(gcp('nocreate'))
POOL = parpool(5);


% initalize data array

for i = 1:4
    dataArray(i) = TabletDataObject;
end

% open storage file

%% MASTER LOOP

CURRENT_ID = 1;

% while (1)  % loop indefinitely, or until system detects an error

% clear first item by creating new object over it
dataArray(1) = TabletDataObject;

parfor i = 1:5
    
    if (i == 1)
        
        dataArray(i).COMP_data = perform_COMP_measurement();
        
    elseif (i == 2)
        
        dataArray(i).THICKNESS_data = perform_THICKNESS_measurement();
        
    elseif (i == 3)
        
        dataArray(i).MASS_data = perform_MASS_measurement();
        
    elseif (i == 4)
        
        dataArray(i).TOF_data = perform_TOF_measurement();
        
    elseif (i == 5)
        
        % Read data from camera
        
        coordinates = getCoordinates(cam);
        fprintf('Coordinates are [%.f, %.f]\n', coordinates(1), coordinates(2));
        
        % Execute arm procedure based on location
        
        % execureArmMovements(coordinates);
        
    end
    
end

fprintf('dataArray(1).COMP_data = %d\n', dataArray(1).COMP_data);
fprintf('dataArray(2).THICKNESS_data = %d\n', dataArray(2).THICKNESS_data);

fprintf('COMPLETED ITERATION\n');

% store dataArray(4) to preserve results, and shift all others along
dataArray(4).BATCH_ID = CURRENT_ID;
CURRENT_ID = CURRENT_ID + 1;

for i = 1:3
    dataArray(5 - i) = dataArray(5 - (i + 1));
end

% end




