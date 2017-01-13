% Author:Challen
% 2017-1-13
%funtion: extract the region of CCN 
clc
clear all;
close all;  %initialization
%cd 'F:\ADNI_AD\ADT1SEG\AD16\output'
% name='Zhuxiaolan';
[filename,pathname]=uigetfile({'*.*'},'choose any dcm file');
cd(pathname);
[hdr,filetype,fileprefix,machine] = load_nii_hdr(filename);
[img,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);

%PFC_L:
temp1=[3,5]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=3;

%PFC_R:
temp1=[4,6]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=4;

%ACC_L:
temp1=[61,63,65,67]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=61;

%ACC_R:
temp1=[62,64,66,68]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=62;

%THA_L
temp1=[83]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=83;

%THA_R
temp1=[84]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=84;

%SMA_L
temp1=[1]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=1;

%SMA_R
temp1=[2]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=2;



%xxxxx:
temp1=[7:60,69:82,85:286]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=0;

%从1到Lable最大值排列
Lables=unique(img);
for i=1:length(Lables)
    temp=Lables(i); %label number
    index=(img==temp); %index是图像中对应label number的体素序号
    img(index)=i-1;
end

CC_286_L=make_ana(img);     %savemat

%cd(['H:\DTI_file\',name,'\fiber']) %自行更改路径
save_untouch_nii(CC_286_L,'CNN_network_withother');%save_untouch_nii(CC_286_R,'CC_286_R');

