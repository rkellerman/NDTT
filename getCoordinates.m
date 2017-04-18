function result = getCoordinates(cam)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

fprintf('I am running!\n'); 

RGB = snapshot(cam);

RGB = imcomplement(RGB);

figure;
imshow(RGB);

% Threshold the image
I = rgb2gray(RGB);
bw = im2bw(I);

% Remove all object containing fewer than 30 pixels
bw = bwareaopen(bw, 30);

% % Fill in gaps
se = strel('disk', 2);
bw = imclose(bw, se);

% % Fill in any holes so that regionprops can be used to
% % estimate the area enclosed by each of the boundaries
bw = imfill(bw, 'holes');

% figure;
% imshow(bw);

% Find the boundaries
[B,L] = bwboundaries(bw, 'noholes');

% determine which objects are round
stats = regionprops(L, 'Area', 'Centroid');

result = [10000,10000];

% loop over the boundaries
for k = 1:length(B)
    
    % obtain (X,Y) boundary coordinates corresponding to label 'k'
    boundary = B{k};
    
    % compute a simple estimate of the object's perimeter
    delta_sq = diff(boundary).^2;
    perimeter = sum(sqrt(sum(delta_sq,2)));
    
    % obtain the area calculation coresponding to label k
    area = stats(k).Area;
    
    % compute the roundness metric
    metric = 4*pi*area/perimeter^2;
    
    % mark objects above the threshold with a black circle
    if metric > .75
        centroid = stats(k).Centroid;
        if (centroid(1) < result(1))
            result = centroid;
        end
    end
    
    
    
end


end

