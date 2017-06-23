%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   2017-6-23
%   detect the edges of ocr.ppm by using Sobel
%  including vertical and horizontal
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


close all;
clear all;
f=imread('ocr.ppm');
figure;
subplot(131);
imshow(f); 
title('original');

h1 = [-1 0 1; -2 0  2; -1 0 1];   %horizontal
h2 =  [-1 -2  -1; 0 0 0; 1 2 1];   %vertical

h= imfilter(f, h1);
subplot(132);
imshow(h);
title('horizontal');

v= imfilter(f, h2);
subplot(133);
imshow(v);
title('vertical');


