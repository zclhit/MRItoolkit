clc;clear all;close all;
filename = 'G:\所有的文档\DTI神经纤维成像方法\29Male\output\29Male_M2_MNI_level3_type2.img';
[hdr,filetype,fileprefix,machine] = load_nii_hdr(filename);
[img,hdr] = load_nii_img(hdr,filetype,fileprefix,machine);
co_x = zeros(90,1);
co_y = zeros(90,1);
co_z = zeros(90,1);
count = zeros(90,1);
for roi=1:90
    for i=1:181
        for j=1:217
            for k=1:181
                if(img(i,j,k)==roi)
                    co_x(roi)=co_x(roi)+i;
                    co_y(roi)=co_y(roi)+j;
                    co_z(roi)=co_z(roi)+k;
                    count(roi)=count(roi)+1;
                end
            end
        end
    end
end
for i=1:90
    co_x(i)=co_x(i)/count(i);
    co_y(i)=co_y(i)/count(i);
    co_z(i)=co_z(i)/count(i);
end
corrdinate=zeros(90,3);
corrdinate(:,1)=co_x-91;
corrdinate(:,2)=co_y-125;
corrdinate(:,3)=co_z-72;
