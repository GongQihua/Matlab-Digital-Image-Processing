close all
clear all
clc

im1 = imread('D:\Matlab-Digital-Image-Processing\img_source\5.jpg');
imshow(im1)
title('original image')
H = fspecial('gaussian',[5,5]);
M1 = imfilter(im1,H,'replicate');
M2 = imfilter(im1,H,'replicate');
I1 = M1(:,:,1);
I2 = M2(:,:,1);

ker = -ones(3,3);
ker(2,2) = 9;
Ikf = uint8(conv2(I1,ker));
X1 = imfilter(I2,H,'replicate');
M2(:,:,1) = X1

figure
imshow(M2)
title('convolved image full')

If = fft2(I1);
keri = zeros(600,900);
keri(1:3,1:3) = ker;
kerif = fft2(keri);
Iff = If.*kerif;
Iffi = uint8(ifft2(Iff));
M1(:,:,1) = Iffi
figure
imshow(M1)

title('FFT convolved image')