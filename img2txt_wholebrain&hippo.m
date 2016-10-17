%Name:Img2txt
%Function:将img文件读取并转换为一列扫描格式的txt文件(用于unity输入)
%Author:Changle Zhang, zhangchanglehit@163.com
clc;clear all;close all;
[hdr,filetype,fileprefix,machine] = load_nii_hdr('p01_2808584_286L.hdr');
[img,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);
%pic=double(img(:,:,60));
%imshow(pic,[0 255]);
% savemat=zeros(1,216*256);
% counter=1;
%抛出XXXXX区域之外的结果
% for i=1:181
%     for j=1:217
%         for k=1:181
%             if(img(i,j,k)==0||img(i,j,k)==169||img(i,j,k)==170||(img(i,j,k)>=254&&img(i,j,k)<=260))
%                 img(i,j,k)=0;
%             else
%                 img(i,j,k)=256;
%             end
%         end
%     end
% end
%figure;
%imshow(img,[0 255]);
%选择海马区的结果
for i=1:181
    for j=1:217
        for k=1:181
            if(img(i,j,k)~=75&&img(i,j,k)~=76&&img(i,j,k)~=284&&img(i,j,k)~=282)
                img(i,j,k)=0;
            else
                img(i,j,k)=256;
            end
        end
    end
end


matsize=size(img);
numl=matsize(1)*matsize(2)*matsize(3);%length of txt;
savemat=zeros(numl,4);
line=1;
for x=1:matsize(1)
    for y=1:matsize(2)
        for z=1:matsize(3)
            savemat(line,1)=x;
            savemat(line,2)=y;
            savemat(line,3)=z;
            savemat(line,4)=img(x,y,z);
            line=line+1;
        end
    end
end
save hippo_img.txt -ascii savemat;