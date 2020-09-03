I= imread('D:/data/3.jpg');
tic;
H = fspecial('average',[9,9]);
G = imfilter(I,H,'replicate');
toc;
figure;
imshow(I);