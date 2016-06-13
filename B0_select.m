%Name:B0_select
%Function:整理出我们需要的B0数据并拷贝到目标文件夹下
%Author:Changle Zhang zhangchanglehit@163.com
clear all;
close all;
clc;
pathname='G:\MJB\AD_HKU\6Oct2014\AD&MCI\P51\DWI';            %^^change this to change the path
cd(pathname);

dirs=dir;
dircell=struct2cell(dirs)' ;
filenames=dircell(:,1);
length=numel(filenames);

mkdir('DWIB01000');
for n=3:length
      dcminfo=dicominfo(char(filenames(n)));
      if ((dcminfo.DiffusionBValue==1000)||(dcminfo.DiffusionBValue==0))
           copyfile(char(filenames(n)),'DWIB01000');
      end
end