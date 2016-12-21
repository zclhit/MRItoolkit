%write the ave & std to the excel
ans_ave_AD = zeros(28,22);
ans_std_AD = ans_ave_AD;
ans_ave_NC = zeros(28,22);
ans_std_NC = ans_ave_NC;

for j = 1:4;
    for i = 1:28;
        load('D:\Data\codes\roi_name.mat');
        roi_load=char(roi_name(i));          %???ROI?????
       
        source=strcat('D:\Data\Bi_ave\Bi_',roi_load,'.xlsx');        
        destination =strcat('D:\Data\ave_std.xlsx');
        readxlRange = 'B2:W37';
        [num1,txt1,raw1] = xlsread(source,j+1,readxlRange);
 
        for k = 1:22;
            ans_ave_AD(i,k) = mean(num1(1:18,k));
            ans_std_AD(i,k) = std(num1(1:18,k));
            ans_ave_NC(i,k) = mean(num1(19:36,k));
            ans_std_NC(i,k) = std(num1(19:36,k));
        end     
    end
    xlswrite(destination,ans_ave_AD,j,'B2');
    xlswrite(destination,ans_ave_NC,j,'B32');
    xlswrite(destination,ans_std_AD,j,'B62');
    xlswrite(destination,ans_std_NC,j,'B92');
    system('tskill excel');
end