for i = 1:27;
    for j = 1:4;
        clc;
        clearvars -except i j;

        load('K:\Data\JHU_AD\codes\roi_name');
        txt=load('D:\Documents\MatlabCode\dtireference\txt');
        rawname = txt.txt;
        roi_load=char(roi_name(i));          %当前ROI的名称
       
        source1=strcat('K:\Data\JHU_AD\graymatrixdata\analysis2\AD\Ans_',roi_load,'.xlsx');
        source2=strcat('K:\Data\JHU_AD\graymatrixdata\analysis2\NC\NCAns_',roi_load,'.xlsx');
        destination =strcat('K:\Data\JHU_AD\graymatrixdata\analysis2\Bi_less\Bi_',roi_load,'.xlsx');
        
        ans = zeros(36,22);
        readxlRange = 'B2:W19';
        [num1,txt1,raw1] = xlsread(source1,j+1,readxlRange);
        [num2,txt2,raw2] = xlsread(source2,j+1,readxlRange);
        
        for k = 1:22;
            ans(1:18,k)= num1(:,2*k-1);
            ans(19:36,k) = num2(:,2*k-1);
        end
            xlswrite(destination,rawname,j+1,'A2');
            xlswrite(destination,ans,j+1,'B2');
        
    end
    system('tskill excel');
end