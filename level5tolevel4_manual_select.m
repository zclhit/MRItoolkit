% Author: Chenfei Ye upgraded by ZCL, corresponding author GuoXin
% 2015-11-21    (2016 Mar, May 2017)
%funtion: 将level5下的分割结果回溯到level4,仅实现手动点击功能。
clc
clear all;
close all;  %initialization
%cd 'F:\ADNI_AD\ADT1SEG\AD16\output'
% name='Zhuxiaolan';

% 手动选择方法
 [filename,pathname]=uigetfile({'*.*'},'choose any dcm file');
 cd(pathname);
 [hdr,filetype,fileprefix,machine] = load_nii_hdr(filename);
 [img,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);
%end of 手动选择方法

% img1=double(img);
% img2=imrotate(img1,180);

%批处理使用

% path = 'G:\玄武医院数据\韩璎课题组数据\NC\NC_分割结果';
% cd(path)
% dirs_G1=dir([path, '\*.*']);
% dircell_G1=struct2cell(dirs_G1)' ;
% filenames_G1=dircell_G1(3:length(dircell_G1),1);
% for i=1:length(filenames_G1)
%     floder_name = char(filenames_G1(i));
%     cd(floder_name);
%     disp(floder_name);
%     cd('output');
%     dirs_G2=dir;
%     dircell_G2=struct2cell(dirs_G2)' ;
%     filenames_G2=dircell_G2(3:length(dircell_G2),1);
%     len = length(filenames_G2);
%     for j = 1:len
%         
%         filenamesIS = char(filenames_G2(j));
%         jamar = strfind(filenamesIS,'286Labels_MNI.img');
%         if length(jamar) ~= 0
%             
%             [hdr,filetype,fileprefix,machine] = load_nii_hdr(filenamesIS);
%             [img,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);
            %开始回溯步骤
            %AG_L:
            temp1=[31]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %AG_R:
            temp2=temp1+1; %label number
            index=(img==temp2(1)); %index是图像中对应label number的体素序号
            for t=temp2
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp2(1);
            
            %ALIC_L:
            temp1=[131]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %ALIC_R:
            temp2=temp1+1; %label number
            index=(img==temp2(1)); %index是图像中对应label number的体素序号
            for t=temp2
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp2(1);
            
            %Amyg_L:
            temp1=[73]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Amyg_R:
            temp2=temp1+1; %label number
            index=(img==temp2(1)); %index是图像中对应label number的体素序号
            for t=temp2
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp2(1);
            
            %ant_DPWM_L:
            temp1=[117,119,153]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %ant_DPWM_R:
            temp2=temp1+1; %label number
            index=(img==temp2(1)); %index是图像中对应label number的体素序号
            for t=temp2
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp2(1);
            
            %AnteriorLateralVentricle_L:
            temp1=[171,172,285,176]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %AnteriorLateralVentricle_R:
            temp1=[177,286]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %BasalForebrain_L:
            temp1=[85:2:89,157:2:165,168]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %BasalForebrain_R:
            temp1=[86:2:90,158:2:166,167]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %BCC_L:
            temp1=[125]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %BCC_R:
            temp1=[126]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Caud_L:
            temp1=[77]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Caud_R:
            temp1=[78]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Caudate_tail_L:
            temp1=[281]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Caudate_tail_R:
            temp1=[283]; %label number
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
            
            %Cerebellum_L:
            temp1=[96]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Cerebellum_R:
            temp1=[95]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %CerebellumWM_L:
            temp1=[253,258]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %CerebellumWM_R:
            temp1=[252,259]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %CGC_L:
            temp1=[139]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %CGC_R:
            temp1=[140]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %CGH_L:
            temp1=[141]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %CGH_R:
            temp1=[142]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Cingulate_L:
            temp1=[61:2:69]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Cingulate_R:
            temp1=[62:2:70]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %CinguSul_L:
            temp1=[275]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %CinguSul_R:
            temp1=[276]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Cu_L:
            temp1=[57]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Cu_R:
            temp1=[58]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
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
            
            %FuG_L:
            temp1=[49]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %FuG_R:
            temp1=[50]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Fx/ST_L:
            temp1=[143]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Fx/ST_R:
            temp1=[144]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Fx_L:
            temp1=[145]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Fx_R:
            temp1=[146]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %GCC_L:
            temp1=[123]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %GCC_R:
            temp1=[124]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %GP_L:
            temp1=[81]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %GP_R:
            temp1=[82]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Hippo_L:
            temp1=[75,282]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Hippo_R:
            temp1=[76,284]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %IFG_L:
            temp1=[11:2:15]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %IFG_R:
            temp1=[12:2:16]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %IIIandIV_Ventricle:
            temp1=[181]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %inf_DPWM_L:
            temp1=[135:2:137,147:2:151]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %inf_DPWM_R:
            temp1=[136:2:138,148:2:152]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %InferiorLateralVentricle_L:
            temp1=[175]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %InferiorLateralVentricle_R:
            temp1=[180]; %label number
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
            
            %IOG_L:
            temp1=[55]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %IOG_R:
            temp1=[56]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %ITG_L:
            temp1=[43]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %ITG_R:
            temp1=[44]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %LG_L:
            temp1=[59]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %LG_R:
            temp1=[60]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Limbic_L:
            temp1=[45:2:47]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Limbic_R:
            temp1=[46:2:48]; %label number
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
            
            %MFG_L:
            temp1=[7,9]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %MFG_R:
            temp1=[8,10]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %midbrain_L:
            temp1=[91:2:93,97:2:99]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %midbrain_R:
            temp1=[92:2:94,98:2:100]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %MOG_L:
            temp1=[53]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %MOG_R:
            temp1=[54]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %MTG_L:
            temp1=[39:2:41]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %MTG_R:
            temp1=[40:2:42]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %OcciptSul_L:
            temp1=[277]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %OcciptSul_R:
            temp1=[278]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %OG_L:
            temp1=[17,19]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %OG_R:
            temp1=[18,20]; %label number
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
            
            %ParietSul_R:
            temp1=[274]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PeripheralCingulateWM_L:
            temp1=[242:2:250]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PeripheralCingulateWM_R:
            temp1=[243:2:251]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PeripheralFrontalWM_L:
            temp1=[186:2:206,210]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PeripheralFrontalWM_R:
            temp1=[187:2:207,211]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PeripheralOccipitalWM_L:
            temp1=[232:2:240]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PeripheralOccipitalWM_R:
            temp1=[233:2:241]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PeripheralParietalWM_L:
            temp1=[155,208,212:2:218]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PeripheralParietalWM_R:
            temp1=[156,209,213:2:219]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PeripheralTemporalWM_L:
            temp1=[220:2:230]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PeripheralTemporalWM_R:
            temp1=[221:2:231]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PLIC_L:
            temp1=[133]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PLIC_R:
            temp1=[134]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PoCG_L:
            temp1=[23]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PoCG_R:
            temp1=[24]; %label number
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
            temp2=temp1+1; %label number
            index=(img==temp2(1)); %index是图像中对应label number的体素序号
            for t=temp2
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp2(1);
            
            %post_DPWM_L:
            temp1=[121]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %post_DPWM_R:
            temp1=[122]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PosteriorLateralVentricle_L:
            temp1=[173,174]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PosteriorLateralVentricle_R:
            temp1=[178,179]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PrCG_L:
            temp1=[25]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PrCG_R
            temp1=[26]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PrCu_L:
            temp1=[33]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PrCu_R:
            temp1=[34]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Put_L:
            temp1=[79]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Put_R:
            temp1=[80]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PVA_anterior_L:
            temp1=[182]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PVA_anterior_R:
            temp1=[183]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PVA_posterior_L:
            temp1=[129,184]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %PVA_posterior_R:
            temp1=[130,185]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %RG_L:
            temp1=[21]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %RG_R:
            temp1=[22]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SCC_L:
            temp1=[127]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SCC_R:
            temp1=[128]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SFG_L:
            temp1=[1:2:5]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SFG_R:
            temp1=[2:2:6]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SMG_L:
            temp1=[29]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SMG_R:
            temp1=[30]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SOG_L:
            temp1=[51]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SOG_R:
            temp1=[52]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SPG_L:
            temp1=[27]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SPG_R:
            temp1=[28]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %STG_L:
            temp1=[35,37]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %STG_R:
            temp1=[36,38]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SylFrontSul_L:
            temp1=[267]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SylFrontSul_R:
            temp1=[268]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SylParieSul_L:
            temp1=[271]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SylParieSul_L:
            temp1=[272]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SylTempSul_L:
            temp1=[269]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %SylTempSul_R:
            temp1=[270]; %label number
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
            
            %Thalamus_L:
            temp1=[83]; %label number
            index=(img==temp1(1)); %index是图像中对应label number的体素序号
            for t=temp1
                index1=(img==t);
                index=index|index1;
            end
            img(index)=temp1(1);
            
            %Thalamus_R:
            temp1=[84]; %label number
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
            
            %从1到137排列，因为总共有136个脑区
            Lables=unique(img);
            for i=1:136
                temp=Lables(i); %label number
                index=(img==temp); %index是图像中对应label number的体素序号
                img(index)=i-1;
            end
            
            CC_286_L=make_ana(img);     %savemat
           % savename = strcat(floder_name,'_M1_MNI_level4');
           savename = 'AD28_M1_MNI_level4';
            %cd(['H:\DTI_file\',name,'\fiber']) %自行更改路径
            save_untouch_nii(CC_286_L,savename);
            cd(path);     
        %end
        
    %end
    
%end
