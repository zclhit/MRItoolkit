%Difference Exhimation
%Author:Changle Zhang (zhangchanglehit@163.com)
%Funtion:Figure out the difference between DIcom files
[filename,pathname]=uigetfile({'*.*'},'choose any dcm file');
cd(pathname);
dirs=dir([pathname, '*.*']);
dircell=struct2cell(dirs)' ;
filenames=dircell(:,1);
length=numel(filenames);
for n=3:numel(filenames);
        dcminfo(n)=dicominfo(char(filenames(n)));
end