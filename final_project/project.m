close all
clear all
clc
im1 = imread('D:\Matlab-Digital-Image-Processing\img_source\10.jpg');
im2 = imread('D:\Matlab-Digital-Image-Processing\img_source\11.jpg');
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
s1 = size(J1')
s2 = size(J2')
% performing dct on the image
dct_im1 = dct2(J1);
dct_im2 = dct2(J2);
%estimating noise
%selecting high frequency part
sigma1 = dct_im1(360:end,760:end).*dct_im1(360:end,760:end);
sigma2 = dct_im2(360:end,760:end).*dct_im2(360:end,760:end);
s3 = size(sigma1')
s4 = size(sigma2')
xs3 = [1:s3(1)];
ys3 = [1:s3(2)];
xs4 = [1:s4(1)];
ys4 = [1:s4(2)];
[xs3,ys3] = meshgrid(xs3,ys3);
[xs4,ys4] = meshgrid(xs4,ys4);
figure;
surface(xs3,ys3,sigma1)
view(60,45)
title('Noise sample1')
figure;
surface(xs4,ys4,sigma2)
view(60,45)
title('Noise sample2')
% estimating the noise from the selected quadrant
noise_var1 = mean(mean(sigma1));
noise_var2 = mean(mean(sigma2));
% beta is the varaible that control the noise removal
% let us assume a beta of 1; the higher beta is set to,
% the more aggresive is the noise removal
beta = 1.0
noise_var1 = beta*noise_var1; 
noise_var2 = beta*noise_var2;

signal_var1 = dct_im1.*dct_im1 + 0.001;
signal_var2 = dct_im2.*dct_im2 + 0.001;
wiener_filter1 = 1 + (noise_var1./signal_var1);
wiener_filter1 = 1./wiener_filter1;
wiener_filter2 = 1 + (noise_var2./signal_var2);
wiener_filter2 = 1./wiener_filter2;
% Apply the Wiener Filter DCT coefficients
filtered_dct1 = dct_im1.*wiener_filter1;
filtered_dct2 = dct_im2.*wiener_filter2;
% Inverse DCT transform to reconstruct image
filtered_dct_image1 = idct2(filtered_dct1)/255;
figure;
imshowpair(J1, uint8(filtered_dct_image1), 'montage');
title('Noisy Image (left), DCT filtered (right)');
filtered_dct_image2 = idct2(filtered_dct2)/255;
figure;
imshowpair(J2, uint8(filtered_dct_image2), 'montage');
title('Noisy Image (left), DCT filtered (right)');