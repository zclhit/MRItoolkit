% Author:Challen
% 2017-1-13
%funtion: extract the region of CCN with other regions
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

%other region exclude the 8 ROIs above

%AnteriorWM_L:
temp1=[117,119,153,182,186:2:206,210]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%AnteriorWM_R:
temp2=temp1+1; %label number
index=(img==temp2(1)); %index是图像中对应label number的体素序号
for t=temp2
    index1=(img==t);
    index=index|index1;
end
img(index)=temp2(1);

%BasalForebrain_L:
temp1=[85,87,157:2:165,168]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%BasalForebrain_R:
temp1=[86,88,158:2:166,167]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%BasalGang_L:
temp1=[77:2:81,89,281]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%BasalGang_R:
temp1=[78:2:82,90,283]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%CentralSul_L:
temp1=[265]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%CentralSul_R:
temp1=[266]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%cerebellum_L:
temp1=[96,253,258]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%cerebellum_R:
temp1=[95,252,259]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%cinguSul_L:
temp1=[275]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%cinguSul_R:
temp1=[276]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%CorpusCallosum_L:
temp1=[123:2:127]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%CorpusCallosum_R:
temp1=[124:2:128]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Frontal_L:
temp1=[7:2:21,25]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=25;

%Frontal_R:
temp1=[8:2:22,26]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=26;

%FrontSul_L:
temp1=[263]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%FrontSul_R:
temp1=[264]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%III_and_IV_ventricle:
temp1=[181]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%InferiorWM_L:
temp1=[129:2:137,147:2:151,220:2:230]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%InferiorWM_R:
temp1=[130:2:138,148:2:152,221:2:231]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Insula_L:
temp1=[71]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Insula_R:
temp1=[72]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%LateralVentricle_L:
temp1=[171:175,285]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%LateralVentricle_R:
temp1=[176:180,286]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Limbic_L:
temp1=[45,47,69,73,75,282]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Limbic_R:
temp1=[46,48,70,74,76,284]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%LimbicWM_L:
temp1=[139:2:145,242:2:250]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%LimbicWM_R:
temp1=[140:2:146,243:2:251]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Medulla_L:
temp1=[109,115]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Medulla_R:
temp1=[110,116]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%midbrain_L:
temp1=[91,93,97,99]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%midbrain_R:
temp1=[92,94,98,100]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%optical_L:
temp1=[51:2:59]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%optical_R:
temp1=[52:2:60]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%occiptsul_L:
temp1=[277]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%occiptsul_R:
temp1=[278]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Parietal_L:
temp1=[23,27:2:33]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Parietal_R:
temp1=[24,28:2:34]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Parietal_L:
temp1=[23,27:2:33]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Parietal_R:
temp1=[24,28:2:34]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%ParietSul_L:
temp1=[273]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%ParietSul_L:
temp1=[274]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Pons_L:
temp1=[101:2:107,111,113,261]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Pons_R:
temp1=[102:2:108,112,114,262]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Posterior_L:
temp1=[121,155,184,208,212:2:218,232:2:240]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Posterior_R:
temp1=[122,156,185,209,213:2:219,233:2:241]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%SylvianFissureExt_L:
temp1=[267:2:271]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%SylvianFissureExt_R:
temp1=[268:2:272]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Temporal_L:
temp1=[35:2:43,49]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%Temporal_R:
temp1=[36:2:44,50]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%TempSul_L:
temp1=[279]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%TempSul_R:
temp1=[280]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=temp1(1);

%xxxxx:
temp1=[169,170,254,255,256,257,260]; %label number
index=(img==temp1(1)); %index是图像中对应label number的体素序号
for t=temp1
    index1=(img==t);
    index=index|index1;
end
img(index)=0;

%tabulate(img(:))


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
tabulate(img(:))
