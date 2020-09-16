
%*********DCT Wiener Filter*****************
% Author Munib Wober, School of Engineering and ASpplied Science, Harvard
% University, Cambridge, MA

close all
clear all
clc

%**************Read Input Image*****************
Im = imread('cameraman.tif');
imshow(Im)

% Intrdouce Gausiian Noise

noisyIm = imnoise(Im,'gaussian',0,0.01);

imshowpair(Im,noisyIm,'montage');
title('Original Image (left) and Noisy Image (right)')

%Perform 2D dct on image

imd = dct2(noisyIm);
imdl = log10(abs(imd)+1);

% Create a meshgrid to visualize the DCT log magnitude progile in order to
% estimate noise

s1 = size(Im)';

x = [1:s1(1)];
y = [1:s1(2)];

[x,y] = meshgrid(x,y);

figure
surface(x,y,imdl)
view(60,45)

% Now calculate noie variance using the lower right corner of the DCT Image
% and visualize the noise, make sure there is no signal component in this
% part of the image DCT

sigma = imd(193:end,193:end).*imd(193:end,193:end);
s3 = size(sigma)'

xs3 = [1:s3(1)];
ys3 = [1:s3(2)];

[xs3,ys3] = meshgrid(xs3,ys3);

figure
surface(xs3,ys3,sigma)
view(60,45)


% now use this last quadrant to estimate the noise varianze

NoiseVariance = mean(mean(sigma));

% let beta be a fudge factor to control amnount of noise removal, The
% higher beta is the more aggressive is the noise removal. Too high a beta
% value will blur the image

beta = 3.0
NoiseVariance = beta*NoiseVariance;

% now use this value ns  for wiener filter

SignalVariance = imd.*imd + 0.001;
WienerFilter = 1 + (NoiseVariance./SignalVariance);
WienerFilter = 1./WienerFilter;

% Now apply the Wiener Filter to the signal DCT coefficients

FilteredImageDCT = imd.*WienerFilter;

% Do the inverse DCT transform to go back to Gray Value

FilteredImage = idct2(FilteredImageDCT);

% Get rid of all values below 0 and highr than 255

imo = uint8(FilteredImage);

% Display filtered Image

close all

figure

imshowpair(imo,noisyIm,'montage');
title('DCT Wiener(left) and Noisy Image (right)')



