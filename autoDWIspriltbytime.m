% 2016/3/21
% author: Changle Zhang
% funtion:sort DWI files by the scanning time

clc
clear all;
close all;

% ���س������������ʾ����?
load train
% ��Ҫ�Զ�������ļ�·����ѡȡ�����ļ�?
[filename,pathname]=uigetfile({'*.dcm'},'choose any dcm file');
cd(pathname);
dirs=dir([pathname, '*.dcm']);
dircell=struct2cell(dirs)' ;
filenames=dircell(:,1);
length=numel(filenames);
if  (length==84)
    mkdir('DWI1');                                                          %depends on the number of scanning
    mkdir('DWI2');
    mkdir('DWI3');
    mkdir('DWI4');
    % ������ȡdicom�ļ��Ĳ�������
    for n=1:numel(filenames);
        dcminfo=dicominfo(char(filenames(n)));
        name1=dcminfo.AcquisitionNumber;        %��ȡtime
        
        if (name1<=21)
            
            copyfile(char(filenames(n)),'DWI1');
        elseif (21<name1)&&(name1<=42)
            copyfile(char(filenames(n)),'DWI2');
        elseif (42<name1)&&(name1<=63)
            copyfile(char(filenames(n)),'DWI3');
        else
            copyfile(char(filenames(n)),'DWI4');
        end
        
    end
elseif (length==42)
    mkdir('DWI1');                                                          %depends on the number of scanning
    mkdir('DWI2');
    for n=1:numel(filenames);
        dcminfo=dicominfo(char(filenames(n)));
        name1=dcminfo.AcquisitionNumber;        %��ȡtime
        
        if (name1<=21)
            
            copyfile(char(filenames(n)),'DWI1');
        else
            copyfile(char(filenames(n)),'DWI2');
        end
        
    end
end