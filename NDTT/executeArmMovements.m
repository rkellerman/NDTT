function [] = executeArmMovements(coordinates, a)
%EXECUTEARMMOVEMENTS Summary of this function goes here
%   Detailed explanation goes here

%  pin 2 is directionPin1
%  pin 3 is stepPin1
%  pin 4 is enablePin1

%  pin 6 is directionPin2
%  pin 7 is stepPin2
%  pin 8 is enablePin2

old_theta1 = 0;
old_theta2 = 270;

% old thetas are angles for drop off point

x = coordinates(1);
y = coordinates(2);

l1 = 10;  % inches
l2 = 10;  % inches

B = sqrt(x^2 + y^2);
q1 = atan2(y,x);
q2 = acos((l1^2 - l2^2 + B^2) / (2*l1*B));
theta1 = q1 + q2;
theta2 = acos((l1^2 + l2^2 - B^2) / (2*l1*l2));

theta1 = theta1*180/pi;
theta2 = theta2*180/pi;

fprintf("theta1 = %f, theta2 = %f\n", theta1, theta2);

% dist = x^2 + y^2;
% D1 = atan2(y,x);
% D2 = acos((dist^2 + l1^2 - l2^2) / (2*dist*l1));
% A1 = D1 + D2;
% A2 = acos((l1^2 + l2^2 - dist^2) / (2*l1*l2));
%
% A1 = A1*180/pi;
% A2 = A2*180/pi;
%
% fprintf("theta1 = %f, theta2 = %f\n", A1, A2);

writeDigitalPin(a, 'D4', 1);
writeDigitalPin(a, 'D8', 1);

baseSteps = 200;

if (theta1 > old_theta1)
    numSteps1 = (theta1 - old_theta1) * (baseSteps/360);
    writeDigitalPin(a, 'D2', 1); 
else 
    numSteps1 = (old_theta1 - theta1) * (baseSteps/360);
    writeDitialPin(a, 'D2', 0);
end

if (theta2 > old_theta2)
    numSteps2 = (theta2 - old_theta2) * (baseSteps/360);
    writeDigitalPin(a, 'D6', 1);
else 
    numSteps1 = (old_theta2 - theta2) * (baseSteps/360);
    writeDigitalPin(a, 'D6', 0);
end

pause(0.1);

% calculate number of steps to get there for both
numSteps1 = int8(numSteps1);
numSteps2 = int8(numSteps2);

if (numSteps1 > numSteps2)
    for i = 1:numSteps1
        
        writeDigitalPin(a, 'D3', 0);
        writeDigitalPin(a, 'D7', 0);
        pause(0.01);
        
        writeDigitalPin(a, 'D3', 1);
        if (numSteps2 > 0)
            writeDigitalPin(a, 'D7', 1);
            numSteps2 = numSteps2 - 1;
        end
        
        pause(0.01);
        
    end
else 
    for i = 1:numSteps2
        
        writeDigitalPin(a, 'D7', 0);
        writeDigitalPin(a, 'D3', 0);
        pause(0.01);
        
        writeDigitalPin(a, 'D7', 1);
        if (numSteps1 > 0)
            writeDigitalPin(a, 'D3', 1);
            numSteps1 = numSteps1 - 1;
        end
        
        pause(0.01);
        
    end
end

% activate vacuum

% move to get to pre determined location
old_theta1 = theta1;
old_theta2 = theta2;

theta1 = 0;
theta2 = 270;

if (theta1 > old_theta1)
    numSteps1 = (theta1 - old_theta1) * (baseSteps/360);
    writeDigitalPin(a, 'D2', 1); 
else 
    numSteps1 = (old_theta1 - theta1) * (baseSteps/360);
    writeDitialPin(a, 'D2', 0);
end

if (theta2 > old_theta2)
    numSteps2 = (theta2 - old_theta2) * (baseSteps/360);
    writeDigitalPin(a, 'D6', 1);
else 
    numSteps1 = (old_theta2 - theta2) * (baseSteps/360);
    writeDigitalPin(a, 'D6', 0);
end

pause(0.1);

% calculate number of steps to get there for both
numSteps1 = int8(numSteps1);
numSteps2 = int8(numSteps2);

if (numSteps1 > numSteps2)
    for i = 1:numSteps1
        
        writeDigitalPin(a, 'D3', 0);
        writeDigitalPin(a, 'D7', 0);
        pause(0.01);
        
        writeDigitalPin(a, 'D3', 1);
        if (numSteps2 > 0)
            writeDigitalPin(a, 'D7', 1);
            numSteps2 = numSteps2 - 1;
        end
        
        pause(0.01);
        
    end
else 
    for i = 1:numSteps2
        
        writeDigitalPin(a, 'D7', 0);
        writeDigitalPin(a, 'D3', 0);
        pause(0.01);
        
        writeDigitalPin(a, 'D7', 1);
        if (numSteps1 > 0)
            writeDigitalPin(a, 'D3', 1);
            numSteps1 = numSteps1 - 1;
        end
        
        pause(0.01);
        
    end
end




end

