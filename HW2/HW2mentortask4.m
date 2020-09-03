I= imread('D:/data/3.jpg');
for i = 1;1000
    k= imnoise(I,'gaussian',0,0.1);
    I = k + I;
end
figure;
subplot(2,2,1);imshow(I);
k = I/1000;
subplot(2,2,2);imshow(k);