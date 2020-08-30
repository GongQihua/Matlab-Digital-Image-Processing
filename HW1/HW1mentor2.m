im1 = imread('D:/data/6.jpg');
s = size(im1);
im2 = rgb2gray(im1);
s_gray = size(im2);
G=imrotate(im2,180);
figure;
subplot(1,2,1),imshow(im2); 
subplot(1,2,2),imshow(G);