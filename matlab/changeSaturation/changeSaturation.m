%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%   2017-6-22
%    change the saturation from zero to 2*max
%    output 10 image
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clear all;
f = imread('lenacolor.ppm');
[sx,sy,sz] = size(f);

x = rgb2hsv(f);

maxx = max(max(x(:,:,2))); %access the max number of each line

maxx = maxx * 2;
d = maxx/10;

figure; 

for i=1:10
    x = rgb2hsv(f);
    y(:,:) = x(:,:,2)*d*(i-1);
    x(:,:,2) = y(:,:);
    g = hsv2rgb(x);
    subplot(3,4,i); 
    imshow(g); 
    title( num2str(i-1) );
end;
    

