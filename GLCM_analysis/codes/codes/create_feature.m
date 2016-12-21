% create_features_file

% for j = 3:5;
%     for i = 1:23;
%         load('G:\Data\codes\selectROI.mat');
%         roi_load=char(roi(i)); 
%         source =strcat('G:\Data\graymatrixdata\Bi_ave\Bi_',roi_load,'.xlsx');
%         destination=strcat('G:\Data\graymatrixdata\final_data\all_feature.xlsx');        
%         ans_final = zeros(36,10);
%         readxlRange = 'B2:W37';
%         [num,txt,raw] = xlsread(source,j,readxlRange);
%         ans_final(1:36,1)=num(1:36,10);
%         ans_final(1:36,2)=num(1:36,7);
%         ans_final(1:36,3)=num(1:36,12);
%         ans_final(1:36,4)=num(1:36,14);
%         ans_final(1:36,5)=num(1:36,16);
%         ans_final(1:36,6)=num(1:36,18);
%         ans_final(1:36,7)=num(1:36,20);
%         ans_final(1:36,8)=num(1:36,21);
%         ans_final(1:36,9)=num(1:36,8);
%         ans_final(1:36,10)=num(1:36,9);
%         reverseAns = ans_final';
%         writeRange = strcat('A',int2str(10*i-8));
%         xlswrite(destination,reverseAns,j-2,writeRange);
%     end
%     system('tskill excel');
% end
for i = 1:23;
    load('G:\Data\codes\selectROI.mat');
	roi_load=char(roi(i)); 
    source =strcat('G:\Data\graymatrixdata\Bi_ave\Bi_',roi_load,'.xlsx');
    destination=strcat('D:\feature.xlsx');        
    ans_final = zeros(36,10);
    readxlRange = 'B2:W37';
    [num,txt,raw] = xlsread(source,2,readxlRange);
    ans_final(1:36,1)=num(1:36,10);
    ans_final(1:36,2)=num(1:36,7);
    ans_final(1:36,3)=num(1:36,12);
    ans_final(1:36,4)=num(1:36,14);
    ans_final(1:36,5)=num(1:36,16);
    ans_final(1:36,6)=num(1:36,18);
    ans_final(1:36,7)=num(1:36,20);
    ans_final(1:36,8)=num(1:36,21);
    ans_final(1:36,9)=num(1:36,8);
    ans_final(1:36,10)=num(1:36,9);
    reverseAns = ans_final';
    writeRange = strcat('A',int2str(10*i-8));
    xlswrite(destination,reverseAns,1,writeRange);
end
system('tskill excel');
