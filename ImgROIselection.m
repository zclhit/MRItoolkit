%Name:ImgROIselection
%Function:将img文件读取并转换为一列扫描格式的txt文件(用于unity输入)
%Author:Changle Zhang, zhangchanglehit@163.com
clc;clear all;close all;
cd ('D:\temp_store');
[hdr,filetype,fileprefix,machine] = load_nii_hdr('co20120918_15434810277192s002a1001_7Labels_MNI.hdr');
[img,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);

%pic=double(img(:,:,60));
%imshow(pic,[0 255]);
%savemat=zeros(1,216*256);
%counter=1;
for label=1:7
    sizex=length(find(img==label));
    savemat=zeros(sizex,3);         %存储信息用的表
    flag=1;
    for i=1:181
        for j=1:217
            for k=1:181
                if img(i,j,k)==label
                    savemat(flag,1)=i;
                    savemat(flag,2)=j;
                    savemat(flag,3)=k;
                    flag=flag+1;
                end
            end
        end
    end
%     savenamex=[int2str(label) 'x.txt'];             %保存使用的文件名
%     savenamey=[int2str(label) 'y.txt'];             %保存使用的文件名
%     savenamez=[int2str(label) 'z.txt'];             %保存使用的文件名
%     savematx=savemat(:,1);
%     savematy=savemat(:,2);
%     savematz=savemat(:,3);
%     save (savenamex,'savematx','-ascii');
%     save (savenamey,'savematy','-ascii');
%     save (savenamez,'savematz','-ascii');
%     clear savematx;
%     clear savematy;
%     clear savematz;
    savename=[int2str(label) '.txt'];
    save (savename,'savemat','-ascii');
    clear savemat;
end