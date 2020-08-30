im1 = imread('D:/data/6.jpg');
s = size(im1);
im2 = rgb2gray(im1);
s_gray = size(im2);
figure;
imshow(im2);
im3 = imadjust(im2,[50/255 150/255],[0 1],[]); 
figure;
imshow(im3);