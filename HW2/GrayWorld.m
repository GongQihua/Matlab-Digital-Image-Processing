function [output]=GrayWorld(Image)  
%RGB图像为n*m*3的数组，表示尺寸为n*m个像素，其中每个像素由RGB三个分量构成。(:,:,1)表示遍历xy，提取红色分量
r=Image(:,:,1);
g=Image(:,:,2);  
b=Image(:,:,3);  
%取平均值，因为是二维的，故用两次mean函数
avgR = mean(mean(r));
avgG = mean(mean(g));  
avgB = mean(mean(b));  
avgRGB = [avgR avgG avgB];  
grayValue = (avgR + avgG + avgB)/3  
scaleValue = grayValue./avgRGB;  
  
newI(:,:,1) = scaleValue(1) * r;  
newI(:,:,2) = scaleValue(2) * g;  
newI(:,:,3) = scaleValue(3) * b;  
  
[output]=uint8(newI);  