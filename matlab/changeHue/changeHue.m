%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%   2017-6-22
%    change the hue by changing 30 angel
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clear all;
f = imread('lenacolor.ppm');
[sx,sy,sz] = size(f);

x = rgb2hsv(f);

d = 1/12;
figure;      %genernate a new window

for i=1:12
    x(:,:,1) = x(:,:,1)+d;
    
    for m=1:sx
        for n=1:sy
            if x(m,n,1) > 1
                x(m,n,1) = x(m,n,1)-1;
            end;
        end;
    end;
    
    g = hsv2rgb(x);
    subplot(3,4,i); 
    imshow(g);
    title( num2str(i-1) );
end;

    

