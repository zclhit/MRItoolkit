
%for i=1:17;
     i=5;
        for j=1:27;
        %  j=1;
            clc;
            clearvars -except i j;

            addpath('K:\Data\JHU_AD\codes\functions');
            load('K:\Data\JHU_AD\codes\num.mat');
            load('K:\Data\JHU_AD\codes\roi_name');
            filespath='K:\Data\JHU_AD\data\AD';
            filenames=dir(filespath);
            filenames=struct2cell(filenames);
            filenames=filenames(1,3:18)';

         
            roi_cur=char(roi_name(j));          %当前ROI的名称
            roi_num=num(j,:)                    %当前ROI所对应的区域
            roi_num(find(roi_num==0))=287;
           
            file_cur=char(filenames(i,1));
            display(file_cur);
            s01=file_cur(1:6);
            s02=file_cur(8:13);
            s1=['K:\Data\JHU_AD\data\AD\',s01,'_',s02,'\T1_T2_DTI_ResampledImage_InSameSpace'];
            path0=strcat('K:\Data\JHU_AD\data\AD\',s01,'_',s02,'\',s01,'\output\MNI_Shifted_Rotated_Axial_',s01,'_',s02,'_T1_brainmask_286Labels.hdr');
            path1=strcat(s1,'\affine_MD.hdr');
            path2=strcat(s1,'\affine_B0.hdr');
            path3=strcat(s1,'\affine_FA.hdr');
            path4=strcat(s1,'\affine_TRACE.hdr');


            source=strcat('K:\Data\JHU_AD\codes\',roi_cur);
            destination=strcat('K:\Data\JHU_AD\analysis\',s01,'NC\');


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
            TRACE=double(TRACE);
            FA=double(FA);
            [a,b,c]=size(seg);

            %找到指定的ROI区域
            loc=find(seg==roi_num(1)|seg==roi_num(2)|seg==roi_num(3)|seg==roi_num(4)|seg==roi_num(5)|seg==roi_num(6)|seg==roi_num(7)|seg==roi_num(8)|seg==roi_num(9)|seg==roi_num(10)|seg==roi_num(11)|seg==roi_num(12)|seg==roi_num(13));


            mkdir(source);%创建新目录
            cd(source);%进入新目录路径

            volume=numel(loc);      %确定ROI区域的像素数
            save volume volume;
            mask=zeros(a,b,c);
            mask(loc)=1;


            M_target1=mask.*B0;
            B0_data=nonzeros(M_target1);        %将掩膜叠加后把不为零的位置提取出来
            save B0_data B0_data;

            M_target3=mask.*TRACE;
            TRACE_data=nonzeros(M_target3);
            save TRACE_data TRACE_data;

            M_target4=mask.*MD;
            MD_data=nonzeros(M_target4);
            save MD_data MD_data;
             
            M_target2=mask.*FA;
            FA_data=nonzeros(M_target2);
            save FA_data FA_data;

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
            
            close Figure 1;
            close Figure 2;
            close Figure 3;
            close Figure 4;

            movefile(source,destination);
    
        end
 %   end