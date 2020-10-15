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
[H,theta,rho] = hough(BW1);
imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
axis on, axis normal;
xlabel('\theta'),ylabel('\rho');
NumPeaks = 5;
peaks = houghpeaks(H,NumPeaks);
hold on
plot(theta(peaks(:,2)),rho(peaks(:,1)));
lines = houghlines(BW1,theta,rho,peaks);
figure, imshow(BW1),hold on
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color',[.1 .8 .8]);
end