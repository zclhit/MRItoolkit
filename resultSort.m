%function: sort the affine result
%author ;changlezhang (zhangchanglehit@163.com)
%update:2016-Dec-10th
clc;clear all;close all;

cd G:/ADNI_affine;
cd affine_result_NC;

dirs=dir;
dircell=struct2cell(dirs)';
filenames=dircell(:,1);
filenames=filenames(3:length(filenames));


%对b0图片进行归档
for i=10:16
    folder_name = num2str(i);
    mkdir(folder_name);
    num = 1;%初始化遍历
    for num=1:length(filenames)
        if (strfind(char(filenames(num)),strcat(folder_name,'_b0'))~=0)
            movefile(char(filenames(num)),folder_name);
        end
        
    end
end

for i=1:16
    folder_name = num2str(i);
    mkdir(folder_name);
    num = 1;%初始化遍历
    for num=1:length(filenames)
        if (strfind(char(filenames(num)),strcat(folder_name,'_b0'))~=0)
            movefile(char(filenames(num)),folder_name);
        end
        
    end
end
%对b0归档结束

%对其他图片进行归档
for i=10:16
    folder_name = num2str(i);
    mkdir(folder_name);
    num = 1;%初始化遍历
    for num=1:length(filenames)
        if (strfind(char(filenames(num)),strcat('00',folder_name))~=0)
            movefile(char(filenames(num)),folder_name);
        end
        
    end
end
%在此进行路径向导覆盖
dirs=dir;
dircell=struct2cell(dirs)';
filenames=dircell(:,1);
filenames=filenames(3:length(filenames));


for i=1:16
    folder_name = num2str(i);
    mkdir(folder_name);
    num = 1;%初始化遍历
    for num=1:length(filenames)
        if (strfind(char(filenames(num)),strcat('00',folder_name))~=0)
            movefile(char(filenames(num)),folder_name);
        end
        
    end
end
%对其他图片归档结束