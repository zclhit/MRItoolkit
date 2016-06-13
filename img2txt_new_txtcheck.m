%这个程序用来检查文件的正确性
clc;
clear all;
close all;
img=load('data1.txt');

length=[216*256*60:216*256*61];
counter=length(1);
opt=zeros(216,256);
for i=1:216
    for j=1:256
        opt(i,j)=img(counter);
        counter=counter+1;
    end
end
imshow(opt,[0 255])