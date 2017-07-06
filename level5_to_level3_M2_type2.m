%This programme trace back ROI information based on M2 segmention via a
%lookuptable.this programme can also generate a new lookuptable.
%Author: Challen zhangchanglehit@163.com
%Date: Jun-14th-2017
clc;
clear all;
close all;

load('M2lookuptable.mat'); %para named 'a'

b = a(:,9);
hashset = unique(b);

res = a;
row_num = zeros(53,1);
cnt = 1;
for z =1:283
%     flag = 0;
    dim = size(hashset);
    if(dim(2)~=0)
        for j = 1:dim(1)
            if isequal(res(z,9),hashset(j))
%                 flag = 1;
                row_num(cnt)=z;
                hashset(j)=[];
                cnt=cnt+1;
                break;
            end
        end
    end
%     if(flag==0)
%         res(i,:)=[];
%     end
end
%after that we got important row num in array row_num

cnt = 53;
for z=283:-1:1
    if(z~=row_num(cnt))
        res(z,:)=[];
    else
        cnt=cnt-1;
    end
end
%开始进行回溯
path = 'G:\深圳人民医院\朱进医生\分割结果_M2';
cd(path)
dirs_G1=dir([path, '\*.*']);
dircell_G1=struct2cell(dirs_G1)' ;
filenames_G1=dircell_G1(3:length(dircell_G1),1);
for m=1:length(filenames_G1)
    floder_name = char(filenames_G1(m));
    cd(floder_name);
    disp(floder_name);
    cd('output');
    dirs_G2=dir;
    dircell_G2=struct2cell(dirs_G2)' ;
    filenames_G2=dircell_G2(3:length(dircell_G2),1);
    len = length(filenames_G2);
    for j = 1:len
        
        filenamesIS = char(filenames_G2(j));
        jamar = strfind(filenamesIS,'283Labels_M2_MNI.img');
        if length(jamar) ~= 0
            
            [hdr,filetype,fileprefix,machine] = load_nii_hdr(filenamesIS);
            [img,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);
            %开始回溯步骤
            for indexer=1:53
                for img_index = 1:283
                    if isequal(res(indexer,9),a(img_index,9))
                         if indexer~= 37
                            index=(img==img_index); %index是图像中对应label number的体素序号
                            for t=img_index
                                index1=(img==t);
                                index=index|index1;
                            end
                            img(index)=indexer;
                         else
                             index=(img==img_index); %index是图像中对应label number的体素序号
                            for t=img_index
                                index1=(img==t);
                                index=index|index1;
                            end
                            img(index)=0;
                         end
                    end
                end
            end
            %从1到137排列，因为总共有136个脑区
            Lables=unique(img);
            for z=1:53
                temp=Lables(z); %label number
                index=(img==temp); %index是图像中对应label number的体素序号
                img(index)=z-1;
            end
            
            CC_286_L=make_ana(img);     %savemat
            savename = strcat(floder_name,'_M2_MNI_level3_type2');
            save_untouch_nii(CC_286_L,savename);
            cd(path);    
        end
    end
end
            
