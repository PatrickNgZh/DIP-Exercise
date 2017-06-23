%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   2017-6-23
%   equalize the histogram
%  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


f=imread('lena1.ppm');  

[sx,sy]=size(f);

figure; 
subplot(221);
imshow(f);
title('original');

subplot(222); 
h = imhist(f);
plot(h);  
title('histogram');

%     equal to histogram
% h(1:256)=0;
% for k1=1:sx
%     for k2=1:sy
%         k= f(k1, k2) +1 ;      k is the index
%         h(k) = h(k) + 1;
%     end;
% end;

h = h/sx/sy;    %��һ��ֱ��ͼ

H1=h;        %firstly declear
H1(1) = h(1);   %�ۼƹ�һֱ��ͼ��H1(256) = 1.0
for k=2:256
    H1(k) = H1(k-1) + h(k);
end;

lut = H1; %ӳ���ϵ

g = lut(f+1);  

% because the pixel set 0 to beginning 
% but the lut set 1 to beginning

% ֱ��ͼ���⻯��ӳ�䣬��һ���������ѭ����ȫ�ȼ�
% for k1=1:sx
%     for k2=1:sy
%         g(k1,k2)= lut( f(k1, k2) +1 );
%     end;
% end;

% ��ʾ��������
subplot(223); 
imshow(g);  
title('result');

subplot(224);
h = imhist(g); 
plot(h);  
title('result histogram');
