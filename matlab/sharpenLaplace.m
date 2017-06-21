%%%%%%%%%%%%%%%%%%%%%%%
%
%   2017-6-21
%    sharpen the picture by Laplace
%
%
%%%%%%%%%%%%%%%%%%%%%%%

close all;    %first step
clear all;     %second step

I=imread('ocr.ppm');

[sx,sy]=size(I);

I=im2double(I); %out of bounds

g=I;

h=[1,1,1,1,-8,1,1,1,1];  %Laplace

for i=2:sx-1
	for j=2:sy-1 
    		kk=1;
            g(i,j)=0;    % firstly set zero,because accumulation
		for ii=i-1:i+1	
		  for jj=j-1:j+1 
                g(i,j) = g(i,j) + I(ii,jj)*h(kk);
                kk = kk+1;
		  end;
		end;
	end;
end;

subplot(121);
imshow(I);
title('Original');

subplot(122);
imshow(g);
title('sharpenLaplace');



