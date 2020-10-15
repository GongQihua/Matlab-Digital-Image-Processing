close all
clear all
clc
im1 = imread('D:\Matlab-Digital-Image-Processing\img_source\10.jpg');
im2 = imread('D:\Matlab-Digital-Image-Processing\img_source\11.jpg');
J1 = rgb2gray(im1);
BW1 = edge(J1,'Canny');
BW2 = edge(J1,'Prewitt');
BW3 = edge(J1,'Sobel');
BW4= edge(J1,'Roberts');
figure;
imshow(BW1);
title('Canny');
figure;
imshow(BW2);
title('Prewitt');
figure;
imshow(BW3);
title('Sobel');
figure;
imshow(BW4);
title('Roberts');
