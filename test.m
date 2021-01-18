close all
clear all
clc

im=imread('img/test.jpg');
x = imresize(im, 1/3, 'bilinear');

figure
imagesc(x);
