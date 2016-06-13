% 2015/3/22
% author: Chenfei YE upgraded by ZCL
% m文件功能：从原始dicom文件中提取T1,T2,DWI图像

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
mkdir('T1');
% 批量获取dicom文件的病人姓名
for n=1:numel(filenames);
    dcminfo=dicominfo(char(filenames(n)));
    if (strcmp(dcminfo.ProtocolName,'t1_fl2d_tra')==true)&&(strcmp(dcminfo.ProtocolName,'t1_fl2d_tra_p2')==true)
        
        copyfile(char(filenames(n)),'T1');  
    end
    
end

%T2
dirs=dir([pathname, '*.dcm']);  
dircell=struct2cell(dirs)' ;
filenames=dircell(:,1);
mkdir('T2');
% 批量获取dicom文件的病人姓名
for n=1:numel(filenames);
    dcminfo=dicominfo(char(filenames(n)));
    if (strcmp(dcminfo.ProtocolName,'t2_tse_tra_p2')==true)&&(strcmp(dcminfo.ImageType,'ORIGINAL\PRIMARY\M\ND\NORM\FM\FIL')==true)
    %if strcmp(dcminfo.ImageType,'DERIVED\PRIMARY\DIFFUSION\FA\ND\NORM')==true
        copyfile(char(filenames(n)),'T2');
    end
    
end

%DWI
dirs=dir([pathname, '*.dcm']);
dircell=struct2cell(dirs)' ;
filenames=dircell(:,1);
mkdir('DWI');
% 批量获取dicom文件的病人姓名
for n=1:numel(filenames);
    dcminfo=dicominfo(char(filenames(n)));
    if (strcmp(dcminfo.ProtocolName,'ep2d_diff_mddw_20_p2')==true)&&(strcmp(dcminfo.ImageType,'ORIGINAL\PRIMARY\M\ND\MOSAIC')==true)
    %if strcmp(dcminfo.ImageType,'DERIVED\PRIMARY\DIFFUSION\FA\ND\NORM')==true
        copyfile(char(filenames(n)),'DWI');
    end
    
end



% 运行结束提示音

sound(y,Fs);