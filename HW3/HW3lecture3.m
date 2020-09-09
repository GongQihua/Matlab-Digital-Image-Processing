im1 = imread('D:\Matlab-Digital-Image-Processing\img_source\5.jpg');
I = rgb2gray(im1);
J = dct2(I);
K = idct2(J,[1050,1575]);
G = idct2(J,[360,540]);
figure
imshowpair(K,G, 'montage')