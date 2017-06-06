%%%%%%%%%%%%%%%%%%
%   2017-6-6
%    test the DFT
%
%%%%%%%%%%%%%%%%%%

close all;    %first step
clear all;     %second step

I=imread('lena.ppm');

I=im2double(I);

F=fft2(I);   %DFT

F=fftshift(F);    %Shift

F=abs(F);

T=log(F+1);

imshow(T,[]);
title('DFT Shift');



