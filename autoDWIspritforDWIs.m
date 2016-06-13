% 2016/4/11
% author: Changle Zhang
% funtion:sort DWI files by the scanning time

clc
clear all;
close all;


%load train

%[filename,pathname]=uigetfile({'*.dcm'},'choose any dcm file');
pathname='/home/bmehitsz/PKU_PSD/PSD';            %pathname
cd(pathname);
foldernamecell=dir;
dircells=struct2cell(foldernamecell);
foldernames=dircells(1,:);
folderlength=numel(foldernames);
for i=3:folderlength
    folder=char(foldernames(i));
    cd (folder);
    cd DWI;
    dirs=dir;
    dircell=struct2cell(dirs)' ;
    filenames=dircell(:,1);
    length=numel(filenames)-2;
    if  (length==84)
        mkdir('DWI1');                                                          %depends on the number of scanning
        mkdir('DWI2');
        mkdir('DWI3');
        mkdir('DWI4');
        for n=3:numel(filenames)-2;
            dcminfo=dicominfo(char(filenames(n)));
            name1=dcminfo.AcquisitionNumber;        
            
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
        for n=3:numel(filenames)-2;
            dcminfo=dicominfo(char(filenames(n)));
            name1=dcminfo.AcquisitionNumber;        
            
            if (name1<=21)
                
                copyfile(char(filenames(n)),'DWI1');
            else
                copyfile(char(filenames(n)),'DWI2');
            end
            
        end
    end
    cd(pathname)
end
