%%%%%%%%%%%%%%%%%%
%   2017-6-8
%    ideal Low-pass Filter
%
%%%%%%%%%%%%%%%%%%

close all;    %first step
clear all;     %second step

I=imread('pp.ppm'); %read the imagin

FFT=fftshift(fft2(I));

d=40;

[a,b]=size(I);   %read the size of imagin

a1=round(a/2);
b1=round(b/2);  %appoximate

for i=1:a
    for j=1:b
        distance=sqrt((i-a1)^2+(j-b1)^2);
        if distance<=d
            h=1;
        else
            h=0;
        end
        FFT(i,j)=h*FFT(i,j);
    end
end

result=uint8(real(ifft2(ifftshift(FFT))));

imshow(result);
title('ideal Low-pass Filter');