function [x, y] = perform_COMP_measurement()
%Perform composition measurement
%

% go to directory and extract raw csv file

x = csvread('data.csv', 0, 1);
% figure;
% plot(x(1,:), x(2,:), 'b-');

RNG = 'C3..C55';
y = csvread('output.csv', 3, 1, RNG);
y = y(4:55, 2);

% n = 1:length(y(:,1));
% figure;
% plot(n, y, 'b-');

end

