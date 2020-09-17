clear all;
close all;
clc;

img=double(imread('Lena2.jpg'));
[m n]=size(img);

[LL LH HL HH]=haar_dwt2D(img);
img=[LL LH;HL HH];

imgn=zeros(m,n);
for i=0:m/2:m/2
    for j=0:n/2:n/2
        [LL LH HL HH]=haar_dwt2D(img(i+1:i+m/2,j+1:j+n/2));
        imgn(i+1:i+m/2,j+1:j+n/2)=[LL LH;HL HH];  
    end
end
imshow(imgn)