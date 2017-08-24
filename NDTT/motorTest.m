%% Stepper motor testing program

clc, clear, close all

% a = arduino('/dev/cu.usbmodem1411', 'uno');

prompt1 = 'Enter theta 1:  ';
prompt2 = 'Enter theta 2:  ';


theta1 = input(prompt1); 
theta2 = input(prompt2);

coordinates = [theta1, theta2];

executeArmMovements(coordinates, a);