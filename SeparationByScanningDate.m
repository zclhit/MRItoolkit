% 2015/3/25
% author: Changle Zhang
% function:Separate DWI file of 2 different scanning DATE

clc
clear;

% 加载程序结束运行提示声音
load train
% 所要自动分类的文件路径里选取任意文件
[filename,pathname]=uigetfile({'*.dcm'},'choose any dcm file');
cd(pathname);   
dirs=dir([pathname, '*.dcm']);
dircell=struct2cell(dirs)' ;
filenames=dircell(:,1);
mkdir('Date1');
mkdir('Date2');
% 批量获取dicom文件的病人姓名
dcminfo=dicominfo(char(filenames(1)));
a=dcminfo.AcquisitionDate;               %set comparision
for n=1:numel(filenames);
    dcminfo=dicominfo(char(filenames(n)));
    if (strcmp(dcminfo.AcquisitionDate,a)==true)
        
        copyfile(char(filenames(n)),'Date1');
    else
        copyfile(char(filenames(n)),'Date2');
    end
end