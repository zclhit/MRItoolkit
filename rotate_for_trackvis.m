% Author: Chenfei Ye upgraded by ZCL
% 2015-11-21    (2016 Mar)
%function: Selected ROI from AAL 90(ROI is 扣带回)
%FUNCTION:修改index选择自己感兴趣的区域构造模板，然后修改patient选择自己存储的文件夹名称，以及修改roi的名字
clc
clear all;
close all;  %initialization

%name='1';

% struc='TL';
% [FileName,PathName]=uigetfile('*.img','Open File','F:\Data\PKU');
% if isequal(FileName,0)
%     disp('Cancel image selection!')
% else
%     disp(['User selected ', fullfile(PathName, FileName)])
%     cd(PathName);
%     [hdr,filetype,fileprefix,machine] = load_nii_hdr([PathName,FileName]);
[hdr,filetype,fileprefix,machine] =load_nii_hdr(['E:\ADHKUSEGresult\P1\128128\final_P1_roi_128 .img']);
[img1,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);
img1=double(img1);
img1=imrotate(img1,180);


%index=(img1==31)|(img1==32)|(img1==33)|(img1==34)|(img1==35)|(img1==36);
%AAL90的扣带回，6个区域
index=(img1==75)|(img1==76);            %JHU286的海马体

img1(:)=0;
img1(index)=1;
FullROI=make_ana(img1);

% [hdr,filetype,fileprefix,machine] = load_nii_hdr(['E:\Anhuishi\00001\native_space\f00001_FA_Parcellated_AAL_Contract_90_2MM.img']);
% [img2,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);
% img2=double(img2);
% img2=imrotate(img2,180);
% img3=img2;
% img4=img2;
% img5=img2;
% 
% temp=[35:44];
% index=(img2==temp(1));
% for t=temp
%     index1=(img2==t);
%     index=index|index1;
% end
% 
% img2(:)=0;
% img2(index)=1;
% TL=make_ana(img2);
% 
% temp=[61:70];
% index=(img3==temp(1));
% for t=temp
%     index1=(img3==t);
%     index=index|index1;
% end
% img3(:)=0;
% img3(index)=1;
% CC_286=make_ana(img3);
% 
% temp=[117:122];
% index=(img4==temp(1));
% for t=temp
%     index1=(img4==t);
%     index=index|index1;
% end
% img4(:)=0;
% img4(index)=1;
% CR_286=make_ana(img4);
% 
% temp=[79:80];
% index=(img5==temp(1));
% for t=temp
%     index1=(img5==t);
%     index=index|index1;
% end
% img5(:)=0;
% img5(index)=1;
% Put_286=make_ana(img5);

cd(['E:\ROIdata'])          %Enter files save path
patient='P1128128';
mkdir(patient);          %Create a new folder
cd(patient);             %Enter into the new folder

save_untouch_nii(FullROI,'hippo');        %Save full ROI
% save_untouch_nii(CC_286,'CC_286');
% save_untouch_nii(TL,'TL');
% save_untouch_nii(CR_286,'CR_286');
% save_untouch_nii(Put_286,'Put_286');
