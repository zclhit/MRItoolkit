clc;
clear;


addpath('D:\JHU_AD\codes\functions');
s01='800070';
s02='061114';
s1=['D:\JHU_AD\AD\',s01,'_',s02,'\T1_T2_DTI_ResampledImage_InSameSpace'];
path0=strcat('D:\JHU_AD\AD\',s01,'_',s02,'\Result',s01,'\output\MNI_Shifted_Rotated_Axial_',s01,'_',s02,'_T1_brainmask_286Labels.hdr');
path1=strcat(s1,'\affine_MD.hdr');
path2=strcat(s1,'\affine_B0.hdr');
path3=strcat(s1,'\affine_FA.hdr');
path4=strcat(s1,'\affine_TRACE.hdr');


source=('D:\JHU_AD\codes\ventricle2');
destination=strcat('D:\JHU_AD\analysis\',s01,'AD\');


[hdr,filetype,fileprefix,machine] = load_nii_hdr(path0);
[seg,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);
[hdr,filetype,fileprefix,machine] = load_nii_hdr(path1);
[MD,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);
[hdr,filetype,fileprefix,machine] = load_nii_hdr(path2);
[B0,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);
[hdr,filetype,fileprefix,machine] = load_nii_hdr(path3);
[FA,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);
[hdr,filetype,fileprefix,machine] = load_nii_hdr(path4);
[TRACE,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);
seg=double(seg);
MD=double(MD);
B0=double(B0);
FA=double(FA);
TRACE=double(TRACE);
[a,b,c]=size(seg);
slice=34;

loc=find(seg>=171 & seg<=181|seg==285|seg==286);

mkdir('D:\JHU_AD\codes\ventricle2');
cd('D:\JHU_AD\codes\ventricle2');

volume=numel(loc);
save volume volume;
mask=zeros(a,b,c);
mask(loc)=1;


M_target1=mask.*B0;
B0_data=nonzeros(M_target1);
save B0_data B0_data;

M_target2=mask.*FA;
FA_data=nonzeros(M_target2);
save FA_data FA_data;

M_target3=mask.*TRACE;
TRACE_data=nonzeros(M_target3);
save TRACE_data TRACE_data;

M_target4=mask.*MD;
MD_data=nonzeros(M_target4);
save MD_data MD_data;

figure(1);
f_B0=plotGMM(B0_data);
title('B0');
print(1, '-dpng', 'B0'); 
save f_B0 f_B0;


figure(2);
f_FA=plotGMM(FA_data);
title('FA');
print(2, '-dpng', 'FA'); 
save f_FA f_FA;

figure(3);
f_TRACE=plotGMM(TRACE_data);
title('TRACE');
print(3 ,'-dpng', 'TRACE'); 
save f_TRACE f_TRACE;

figure(4);
f_MD=plotGMM(MD_data);
title('MD');
print(4 ,'-dpng', 'MD'); 
save f_MD f_MD;

movefile(source,destination);

% MEAN=mean(DATA);
% VAR=var(DATA);

% result=plotGMM(DATA);

% DATA_DWI=zeros(volume,slice);
% for i=2:slice
% DATA_DWI(:,i)=nonzeros(mask.*DWI_4D(:,:,:,i));
% 
% M_DWI(i-1)=mean(mean(DATA_DWI(:,i)));
% 
% end
% M_DWI=(M_DWI-min(M_DWI))/(max(M_DWI)-min(M_DWI));
% figure;plot(M_DWI);
% FP=zeros(slice,6);
% for i=2:slice
% DATA_DWI(:,i)=nonzeros(mask.*DWI_4D(:,:,:,i));
% result=plotGMM(DATA_DWI(:,i));
% FP(i,:)=[result.mu,result.sigma,result.phi];
% end
% FP1=FP(2:slice,:);
% FP2=FP1(:);