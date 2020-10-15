close all
clear all
clc
im1 = imread('D:\Matlab-Digital-Image-Processing\img_source\1.png');
YCbCr= rgb2ycbcr(im1);
Y = YCbCr(:, : ,1);
Cb = YCbCr(:,:,2);
Cr= YCbCr(:,:,3);
BW1 = edge(Y,'Prewitt');
BW2 = edge(Y,'Sobel');
figure;
imshow(BW1);
title('Prewitt on Y');
figure;
imshow(BW2);
title('Sobel on Y');

BW3 = edge(Cb,'Prewitt');
BW4 = edge(Cb,'Sobel');
figure;
imshow(BW3);
title('Prewitt on Cb');
figure;
imshow(BW4);
title('Sobel on Cb');

BW5 = edge(Cr,'Prewitt');
BW6 = edge(Cr,'Sobel');
figure;
imshow(BW5);
title('Prewitt on Cr');
figure;
imshow(BW6);
title('Sobel on Cr');
