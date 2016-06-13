%Name:Img2txt
%Function:将img文件读取并转换为一列扫描格式的txt文件(用于unity输入)
%Author:Changle Zhang, zhangchanglehit@163.com
clc;clear all;close all;
[hdr,filetype,fileprefix,machine] = load_nii_hdr('E:\SAPHO\DTI\T1\ND-SAPHO\S02\20150725_192944MPRAGE26s013a1001.hdr');
[img,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);

imgsize=size(img);

counter=1;
length=sum(sum(sum(img>100)));
xsave=zeros(length,1);
ysave=zeros(length,1);
zsave=zeros(length,1);
savemat=zeros(length,1);
for i=1:imgsize(1)
    for j=1:imgsize(2)
        for k=1:imgsize(3)
            if img(i,j,k)>100
                xsave(counter)=i;
                ysave(counter)=j;
                zsave(counter)=k;
                savemat(counter)=img(i,j,k);
                counter=counter+1;
            end
        end
    end
end

save T1over100img.txt -ascii savemat
save T1over100x.txt -ascii xsave
save T1over100y.txt -ascii ysave
save T1over100z.txt -ascii zsave