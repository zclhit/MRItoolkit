%analyze the GLCM
 for i=1:8;
%i=15;
        for j=1:28;
         %j=10;
            clc;
            clearvars -except i j;

            addpath('D:\ZCL\课题-纹理特征\codes\codes\functions');
            load('D:\ZCL\课题-纹理特征\codes\codes\roi_name.mat');   
            filespath='D:\ZCL\深圳人民医院\SZ_gray';
            filenames=dir(filespath);
            filenames=struct2cell(filenames);
            filenames=filenames(1,3:10)';
           
            roi_cur=char(roi_name(j));          %current roi name
            
            destination=cell(27,1);
            destination2=cell(27,1);
            destination3=cell(27,1);
            destination4=cell(27,1);

            destination{j,1}=strcat('D:\ZCL\深圳人民医院\excel_files\B0\',roi_cur,'.xlsx');
            destination2{j,1}=strcat('D:\ZCL\深圳人民医院\excel_files\Trace\',roi_cur,'.xlsx');
            destination3{j,1}=strcat('D:\ZCL\深圳人民医院\excel_files\MD\',roi_cur,'.xlsx');
            destination4{j,1}=strcat('D:\ZCL\深圳人民医院\excel_files\FA\',roi_cur,'.xlsx');
            
            file_cur=char(filenames(i,1));
            display(file_cur);
            s01=file_cur;
            s1=['D:\ZCL\深圳人民医院\SZ_gray\',s01,'\',roi_cur,'\Data',roi_cur];
            path1=strcat(s1,'\stats_B0');
            path2=strcat(s1,'\stats_Trace');
            path3=strcat(s1,'\stats_MD');
            path4=strcat(s1,'\stats_FA');
            
            stats_B0=load(path1);
            stats_Trace=load(path2);
            stats_MD=load(path3);
            stats_FA=load(path4);

            B0_Array = cell2mat(struct2cell(stats_B0.stats_B0));
            Trace_Array = cell2mat(struct2cell(stats_Trace.stats_Trace));
            MD_Array = cell2mat(struct2cell(stats_MD.stats_MD));
            FA_Array = cell2mat(struct2cell(stats_FA.stats_FA));


           [m,n]=size(B0_Array);
           xlRange = strcat('B',num2str(i+1));
           aveRange = strcat('A',num2str(i+20));
            
           B0_output=zeros(m,n);
           for k = 1:m;
               temp = B0_Array(k,:);
               
               if isnan(temp(1)) == 1
                   temp(isnan(temp)) = [];
               else
                   minvalue = temp(1);
                   temp(find(temp==minvalue))=[];
               end
               
               B0_output(k,1:length(temp)) = temp;
               sheet_num = k+1;
               xlswrite(destination{j,1},B0_output(k,:),sheet_num,xlRange);
               ave_std=zeros(1,2);
               ave_std(1) = mean2(temp);
               ave_std(2) = std2(temp);
               xlswrite(destination{j,1},ave_std,sheet_num,aveRange);
           end
          
           Trace_output=zeros(m,n);
           for k = 1:m;
               temp = Trace_Array(k,:);
               
               if isnan(temp(1)) == 1
                   temp(isnan(temp)) = [];
               else
                   minvalue = temp(1);
                   temp(find(temp==minvalue))=[];
               end
               
               Trace_output(k,1:length(temp)) = temp;
               sheet_num = k+1;
               xlswrite(destination2{j,1},Trace_output(k,:),sheet_num,xlRange);
               ave_std=zeros(1,2);
               ave_std(1) = mean2(temp);
               ave_std(2) = std2(temp);
               xlswrite(destination2{j,1},ave_std,sheet_num,aveRange);
           end

           
           MD_output=zeros(m,n);
           for k = 1:m;
               temp = MD_Array(k,:);
               
               if isnan(temp(1)) == 1
                   temp(isnan(temp)) = [];
               else
                   minvalue = temp(1);
                   temp(find(temp==minvalue))=[];
               end
               
               MD_output(k,1:length(temp)) = temp;
               sheet_num = k+1;
               xlswrite(destination3{j,1},MD_output(k,:),sheet_num,xlRange);
               ave_std=zeros(1,2);
               ave_std(1) = mean2(temp);
               ave_std(2) = std2(temp);
               xlswrite(destination3{j,1},ave_std,sheet_num,aveRange);
           end
          
           FA_output=zeros(m,n);
           for k = 1:m;
               temp = FA_Array(k,:);
               
               
               if isnan(temp(1)) == 1
                   temp(isnan(temp)) = [];
               else
                   minvalue = temp(1);
                   temp(find(temp==minvalue))=[];
               end
               
               FA_output(k,1:length(temp)) = temp;
               sheet_num = k+1;
               xlswrite(destination4{j,1},FA_output(k,:),sheet_num,xlRange);
               ave_std=zeros(1,2);
               ave_std(1) = mean2(temp);
               ave_std(2) = std2(temp);
               xlswrite(destination4{j,1},ave_std,sheet_num,aveRange);
           end
           
%            for sheet_num = 2:23;
%                 xlswrite(destination4{j,1},FA_output(k,:),sheet_num,xlRange);
%            end
    
        end
        system('tskill excel');
end