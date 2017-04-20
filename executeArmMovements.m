function [] = executeArmMovements(coordinates, a, theta1, theta2)
%EXECUTEARMMOVEMENTS Summary of this function goes here
%   Detailed explanation goes here

%  pin 2 is directionPin1
%  pin 3 is stepPin1
%  pin 4 is enablePin1

%  pin

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





end

