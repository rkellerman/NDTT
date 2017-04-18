function Obj = perform_COMP_measurement()
%Perform composition measurement
%
Obj = COMP_object;
% go to directory and extract raw csv file

Obj.rawData = csvread('data.csv', 0, 1);
% figure;
% plot(x(1,:), x(2,:), 'b-');

RNG = 'C3..C55';
temp = csvread('output.csv', 3, 1, RNG);
temp = temp(4:55, 2);

Obj.processedData = temp;

% n = 1:length(y(:,1));
% figure;
% plot(n, y, 'b-');

end

