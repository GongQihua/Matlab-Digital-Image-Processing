close all
clear all
clc
im1 = imread('D:\Matlab-Digital-Image-Processing\img_source\8.jpg');
im2 = imread('D:\Matlab-Digital-Image-Processing\img_source\9.jpg');
H = fspecial('gaussian',[5,5]);
M1 = imfilter(im1,H,'replicate');
M2 = imfilter(im2,H,'replicate');
YCBCR1 = rgb2ycbcr(M1);
YCBCR2 = rgb2ycbcr(M2);
X1 = imfilter(YCBCR1(:,:,1),H,'replicate');
X2 = imfilter(YCBCR2(:,:,1),H,'replicate');
YCBCR1(:,:,1) = X1;
YCBCR2(:,:,1) = X2;
J1 = imnoise(YCBCR1(:,:,1),'gaussian'); 
J2 = imnoise(YCBCR2(:,:,1),'gaussian'); 
figure;
subplot(1,2,1),imshow(J1);
subplot(1,2,2),imshow(J2);
K1 = dct2(J1);
K2 = dct2(J2);
figure;
subplot(2,2,1),imshow(K1);
subplot(2,2,2),imshow(K2);
J3 = wiener2(J1,[5 5]);
figure;
imshow(J3);