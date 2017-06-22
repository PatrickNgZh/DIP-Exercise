%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   2017-6-22
%    the method of otsu
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f=imread('ocr.ppm');
h=imhist(f);
[sx,sy]=size(f);
h = h/sx/sy;  %��һ��

w1(1:256)=0;
w1(1)=h(1);
for i=2:256
    w1(i) = w1(i-1) + h(i); %�ۼƹ�һ
end;

% h(1:256) �� w1(1:256) , x(i) Ϊ��һ���ۼƹ�һֱ��ͼ ,sum( (i-1)*h(i))
w2 = 1-w1;   
x(1:256)=0;
for i=2:256  
    x(i)=x(i-1)+(i-1)*h(i); 
end;
mut=x(256);  %ȫƽ��

mu1= x./w1;  %t-fun 
mu2=(mut-x) ./ w2;  %�����ƽ��

d = w1.*(mut-mu1).*(mut-mu1);
d = d+w2.*(mut-mu2).*(mut-mu2);

[mx,th]=max(d); %�������ֵ�������Ӧ�����

figure;
subplot(1,2,1);
imshow(f);
th = th -1; 
g = im2bw(f, th/255 );%��ֵ��
subplot(1,2,2); imshow(g);

level = graythresh(f);