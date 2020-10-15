close all
clear all
clc
Im = imread('D:\Matlab-Digital-Image-Processing\img_source\2.jpg');
imshow(Im);
noisyIm = imnoise(Im,'gaussian',0,0.01);

imshowpair(Im,noisyIm,'montage');
title('Original Image (left) and Noisy Image (right)');
imd = dct2(noisyIm);
imdl = log10(abs(imd)+1);
s1 = size(Im');

x = [1:s1(1)];
y = [1:s1(2)];

[x,y] = meshgrid(x,y);

figure;
surface(x,y,imdl);
view(60,45);

sigma = imd(193:end,193:end).*imd(193:end,193:end);
s3 = size(sigma');

xs3 = [1:s3(1)];
ys3 = [1:s3(2)];

[xs3,ys3] = meshgrid(xs3,ys3);

figure;
surface(xs3,ys3,sigma);
view(60,45);
NoiseVariance = mean(mean(sigma));
beta = 3.0;
NoiseVariance = beta*NoiseVariance;
SignalVariance = imd.*imd + 0.001;
WienerFilter = 1 + (NoiseVariance./SignalVariance);
WienerFilter = 1./WienerFilter;
FilteredImageDCT = imd.*WienerFilter;
FilteredImage = idct2(FilteredImageDCT);
imo = uint8(FilteredImage);


figure

imshowpair(imo,noisyIm,'montage');
title('DCT Wiener(left) and Noisy Image (right)')
