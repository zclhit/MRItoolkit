% Author: Chenfei Ye upgraded by ZCL
% 2015-11-21    (2016 Mar)
%funtion: Selected ROI from AAL 90(ROI is 扣带回)
clc
clear all;
close all;  %initialization

% name='Zhuxiaolan';

[hdr,filetype,fileprefix,machine] = load_nii_hdr(['H:\T1_DTIspace\output\',name,'\M1_lfseg_2.img']);
[img,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);
img=double(img);
img=imrotate(img,180);


temp=[61:2:70]; %label number
index=(img==temp(1)); %index是图像中对应label number的体素序号
for t=temp
    index1=(img==t);
    index=index|index1;
end
img(:)=0;
img(index)=1;
CC_286_L=make_ana(img);

cd(['H:\DTI_file\',name,'\fiber']) %自行更改路径
save_untouch_nii(CC_286_L,'CC_286_L');save_untouch_nii(CC_286_R,'CC_286_R');