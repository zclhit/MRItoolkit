clc;
clear;

load roi_name;
filepath='F:\JHU_AD\analysis\AD';
filenames=dir(filepath);
filenames=struct2cell(filenames);
filenames=filenames(1,3:19)';

for i=1:17;
    for j=1:27;
        file_cur=filenames(i);
        roi_cur=roi_name(j);
        path0=strcat('F:\JHU_AD\analysis\AD\',file_cur,'\',roi_cur,'\');
        cd(char(path0));

            load volume;
            volume_AD(i,j)=volume;
%         load f_B0;
%         load f_FA;
%         load f_MD;
%         load f_TRACE;
% 
%         mu1=f_B0.mu;
%         mu2=f_FA.mu;
%         mu3=f_MD.mu;
%         mu4=f_TRACE.mu;
%         mu=[mu1,mu2,mu3,mu4];
% 
%         sigma1=f_B0.sigma;
%         sigma2=f_FA.sigma;
%         sigma3=f_MD.sigma;
%         sigma4=f_TRACE.sigma;
%         sigma=[sigma1,sigma2,sigma3,sigma4];
% 
%         phi1=f_B0.phi;
%         phi2=f_FA.phi;
%         phi3=f_MD.phi;
%         phi4=f_TRACE.phi;
%         phi=[phi1,phi2,phi3,phi4];
% 
%         mu_all_NC(i,:,j)=mu;
%         sigma_all_NC(i,:,j)=sigma;
%         phi_all_NC(i,:,j)=phi;
    end
    display(i,'done');
end
