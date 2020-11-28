clc;
clear all;
I = imread('Facebook.bmp');
I=rgb2gray(I);
I1=I;
[row coln]= size(I);
pixel=load('pixel.csv');

%pixel=pixel(:,2);

I2=reshape(pixel,[row coln]);


K=mat2gray(I2);


%---------------------------------------------------------- Display of
%Results ----------------------------------------------------------
figure(1);imshow(I1);title('original image');
figure(2);imshow(K);title('restored image from dct');



