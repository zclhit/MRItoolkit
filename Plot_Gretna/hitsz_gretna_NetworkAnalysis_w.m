%% hitsz_gretna_NetworkAnalysis_w.m
% 脑网络矩阵批处理
% w means weighted network
% 需要用到的程序包括：
% hitsz_gretna_assortativity_w.m  hitsz_gretna_hierachy_w.m  hitsz_gretna_synchronization_w.m
% 
%%

clc
clear

network_equaldim='yes'; %yes代表每个网络的节点数相同，no代表不同
Thres_type='r'; %阈值类型。r代表correlation； s代表sparsity
Thres='0.05:0.01:0.4'; %网络阈值
Thres=str2num(Thres);
OutputDir='E:\ML\matlab\GRETNA_1.2.1_release'; %输出路径
n=100; %随机网络个数
%选择Network目录
[filename,pathname]=uigetfile({'*.txt'},'choose any txt file','C:\Users\Figo-workstation\Desktop\Network_example');

%读取该目录下的所有网络文件名
dirs=dir([pathname, '*.txt']);
dircell=struct2cell(dirs)' ;
filenames=dircell(:,1);
file_path=fullfile(pathname,filenames); %保存各网络文件的全路径
Ws={};

% 读取每个网络文件
for i=1:length(filenames)
    tempmat=load(char(file_path(i)));
    [R,C]=size(tempmat);
    Ws(i)=mat2cell(tempmat,R,C);
end

% SegMat=fullfile(OutputDir,'SegMat.mat');
% save(SegMat,'A')
Nsubs = size(Ws,2); %受试个数
deltas=Thres(2)-Thres(1); %阈值步长


for sub = 1:Nsubs % subjects
    
    fprintf('---------------------------------------------------------- \n')
    fprintf('Calculating network parameters of subject %d \n', sub);
    fprintf('---------------------------------------------------------- \n')
    
    for thres_j = 1:length(Thres) % threshold
        if Thres_type == 's' % 对于sparsity 阈值的处理
            fprintf ('Sparsity threshold = %.2f \n', Thres(thres_j));
            bin = gretna_R2b(Ws{sub},'s',Thres(thres_j));
            wei = bin.*abs(Ws{sub});
        else
            fprintf ('Correlation threshold = %.2f \n', Thres(thres_j));
            bin = gretna_R2b(Ws{sub},'r',Thres(thres_j));
            wei = bin.*Ws{sub};
        end
        %% 目标数据网络
        % assortativity coefficient
        net.r(thres_j,sub) = hitsz_gretna_assortativty_w(wei);
        % hierachy coefficient
        net.b(thres_j,sub) = hitsz_gretna_hierarchy_w(wei);
        % synchronization coefficient
        net.s(thres_j,sub) = hitsz_gretna_synchronization_w(wei);
        % modularity
        [M] = gretna_modularity_weight(wei, '2', 0);
        net.mod(thres_j,sub) = M.modularity_real;
        
        if strcmp(network_equaldim,'no') %当每个网络的节点数不同时，不计算node参数，只计算net参数
            
            % betweenness coefficient
            net.bw(thres_j,sub) = gretna_node_betweenness_weight(wei);
            % clustering coefficient
            net.Cp(thres_j,sub) = gretna_node_clustcoeff_weight(wei, 2);
            % shortest path length
            net.Lp(thres_j,sub) = gretna_node_shortestpathlength_weight(wei);
            % local efficiency
            net.locE(thres_j,sub) = gretna_node_local_efficiency_weight(wei);
            % global efficiency
            net.gE(thres_j,sub)   = gretna_node_global_efficiency_weight(wei);
            % nodal degree
            net.deg(thres_j,sub) = gretna_node_degree_weight(wei);
            
        else
            
            % betweenness coefficient
            [net.bw(thres_j,sub), node.bw(thres_j,sub,:)]  = gretna_node_betweenness_weight(wei);
            % clustering coefficient
            [net.Cp(thres_j,sub), node.Cp(thres_j,sub,:)] = gretna_node_clustcoeff_weight(wei, 2);
            % shortest path length
            [net.Lp(thres_j,sub), node.Lp(thres_j,sub,:)] = gretna_node_shortestpathlength_weight(wei);
            % local efficiency
            [net.locE(thres_j,sub), node.locE(thres_j,sub,:)] = gretna_node_local_efficiency_weight(wei);
            % global efficiency
            [net.gE(thres_j,sub), node.gE(thres_j,sub,:)]   = gretna_node_global_efficiency_weight(wei);
            % nodal degree
            [net.deg(thres_j,sub), node.deg(thres_j,sub,:)] = gretna_node_degree_weight(wei);
            
        end
        %% 随机网络
        if n > 0
            for nrand = 1:n % random network
                
                fprintf('.');
                
                Wrand = gretna_gen_random_network1_weight(wei);
                
                % assortativity coefficient
                net.rrand(thres_j,sub,nrand) = hitsz_gretna_assortativty_w(Wrand);
                % hierachy coefficient
                net.brand(thres_j,sub,nrand) = hitsz_gretna_hierarchy_w(Wrand);
                % synchronization coefficient
                net.srand(thres_j,sub,nrand) = hitsz_gretna_synchronization_w(Wrand);
                % modularity
                [M] = gretna_modularity_weight(Wrand, '2', 0);
                net.modrand(thres_j,sub,nrand) = M.modularity_real;
                if strcmp(network_equaldim,'no') %当每个网络的节点数不同时，不计算node参数，只计算net参数
                    % clustering coefficient
                    net.Cprand(thres_j,sub,nrand) = gretna_node_clustcoeff_weight(Wrand, 2);
                    % shortest path length
                    net.Lprand(thres_j,sub,nrand) = gretna_node_shortestpathlength_weight(Wrand);
                    % local efficiency
                    net.locErand(thres_j,sub,nrand)= gretna_node_local_efficiency_weight(Wrand);
                    % global efficiency
                    net.gErand(thres_j,sub,nrand) = gretna_node_global_efficiency_weight(Wrand);
                    % nodal degree
                    net.degrand(thres_j,sub,nrand) = gretna_node_degree_weight(Wrand);
                    
                else
                    % clustering coefficient
                    [net.Cprand(thres_j,sub,nrand), node.Cprand(thres_j,sub,:,nrand)] = gretna_node_clustcoeff_weight(Wrand, 2);
                    % shortest path length
                    [net.Lprand(thres_j,sub,nrand), node.Lprand(thres_j,sub,:,nrand)] = gretna_node_shortestpathlength_weight(Wrand);
                    % local efficiency
                    [net.locErand(thres_j,sub,nrand), node.locErand(thres_j,sub,:,nrand)] = gretna_node_local_efficiency_weight(Wrand);
                    % global efficiency
                    [net.gErand(thres_j,sub,nrand), node.gErand(thres_j,sub,:,nrand)] = gretna_node_global_efficiency_weight(Wrand);
                    % nodal degree
                    [net.degrand(thres_j,sub,nrand), node.degrand(thres_j,sub,:,nrand)] = gretna_node_degree_weight(Wrand);
                    
                end
                
                
                
            end % for random network
            fprintf('\n')
        end
        
    end % for threshold
end % for subjects

%% generate the node and net coefficients
if strcmp(network_equaldim,'no') %当每个网络的节点数不同时，不计算node参数，只计算net参数
else
    node.Gamma = node.Cp     ./ mean(node.Cprand,4);
    node.Lambda = node.Lp     ./ mean(node.Lprand,4);
    node.Sigma =  node.Gamma  ./  node.Lambda;
    node.EGamma = node.locE ./ mean(node.locErand,4);
    node.ELambda = node.gE     ./ mean(node.gErand,4);
    node.ESigma =  node.EGamma  ./  node.ELambda;
end

net.rzscore = (net.r - mean(net.rrand,3))  ./  std(net.rrand,0,3);
net.bzscore = (net.b - mean(net.brand,3))  ./  std(net.brand,0,3);
net.locEzscore = (net.locE - mean(net.locErand,3))  ./  std(net.locErand,0,3);
net.gEzscore = (net.gE - mean(net.gErand,3))  ./  std(net.gErand,0,3);
net.Cpzscore = (net.Cp - mean(net.Cprand,3))  ./  std(net.Cprand,0,3);
net.Lpzscore = (net.Lp - mean(net.Lprand,3))  ./  std(net.Lprand,0,3);
net.Gamma = net.Cp     ./ mean(net.Cprand,3);
net.Lambda = net.Lp     ./ mean(net.Lprand,3);
net.Sigma =  net.Gamma  ./  net.Lambda;
net.EGamma = net.locE ./ mean(net.locErand,3);
net.ELambda   = net.gE   ./ mean(net.gErand,3);
net.ESigma =  net.EGamma  ./  net.ELambda;
net.degzscore = (net.deg - mean(net.degrand,3))  ./  std(net.degrand,0,3);
net.szscore = (net.s - mean(net.srand,3))  ./  std(net.srand,0,3);
net.modzscore = (net.mod - mean(net.modrand,3))  ./  std(net.modrand,0,3);
%% generate the area under curve (AUC) to provide threshold insensitive measure
% allnodal
if strcmp(network_equaldim,'no') %当每个网络的节点数不同时，不计算node参数，只计算net参数
else
    node.abw   = squeeze((sum(node.bw)   -  sum(node.bw([1 end],:,:))/2)   * deltas);
    node.alocE = squeeze((sum(node.locE) -  sum(node.locE([1 end],:,:))/2) * deltas);
    node.agE   = squeeze((sum(node.gE)   -  sum(node.gE([1 end],:,:))/2)   * deltas);
    node.adeg  = squeeze((sum(node.deg)  -  sum(node.deg([1 end],:,:))/2)  * deltas);
    node.aCp   = squeeze((sum(node.Cp)   -  sum(node.Cp([1 end],:,:))/2)   * deltas);
    node.aLp   = squeeze((sum(node.Lp)   -  sum(node.Lp([1 end],:,:))/2)   * deltas);
end
% all
net.aCp   = (sum(net.Cp)   -  sum(net.Cp([1 end],:))/2)   * deltas;
net.aLp   = (sum(net.Lp)   -  sum(net.Lp([1 end],:))/2)   * deltas;
net.alocE = (sum(net.locE) -  sum(net.locE([1 end],:))/2) * deltas;
net.agE   = (sum(net.gE)   -  sum(net.gE([1 end],:))/2)   * deltas;
net.aCpzscore   = (sum(net.Cpzscore)   -  sum(net.Cpzscore([1 end],:))/2)   * deltas;
net.aLpzscore   = (sum(net.Lpzscore)   -  sum(net.Lpzscore([1 end],:))/2)   * deltas;
net.alocEzscore = (sum(net.locEzscore) -  sum(net.locEzscore([1 end],:))/2) * deltas;
net.agEzscore   = (sum(net.gEzscore)   -  sum(net.gEzscore([1 end],:))/2)   * deltas;
net.adeg  = (sum(net.deg)  -  sum(net.deg([1 end],:))/2)  * deltas;
net.abw   = (sum(net.bw)   -  sum(net.bw([1 end],:))/2)   * deltas;
%net.as   = (sum(net.s)   -  sum(net.s([1 end],:))/2)   * deltas;
%net.amod  = (sum(net.mod)  -  sum(net.mod([1 end],:))/2)  * deltas;
net.aGamma   = (sum(net.Gamma)   -  sum(net.Gamma([1 end],:))/2)   * deltas;
net.aLambda   = (sum(net.Lambda)   -  sum(net.Lambda([1 end],:))/2)   * deltas;
net.aSigma   = (sum(net.Sigma)   -  sum(net.Sigma([1 end],:))/2)   * deltas;
net.aEGamma = (sum(net.EGamma) -  sum(net.EGamma([1 end],:))/2) * deltas;
net.aELambda   = (sum(net.ELambda)   -  sum(net.ELambda([1 end],:))/2)   * deltas;
net.aESigma   = (sum(net.ESigma)   -  sum(net.ESigma([1 end],:))/2)   * deltas;
%%
cd(OutputDir);

r=net.r'; save r_All_Threshold.txt -ascii r
rzscore=net.rzscore'; save rzscore_All_Threshold.txt -ascii rzscore
aEg=net.agE'; save aEg.txt -ascii aEg
aEGamma=net.aEGamma'; save aEGamma.txt -ascii aEGamma
aELambda=net.aELambda'; save aELambda.txt -ascii aELambda
aEloc=net.alocE'; save aEloc.txt -ascii aEloc
aEloczscore=net.alocEzscore'; save aEloczscore.txt -ascii aEloczscore
aESigma=net.aESigma'; save aESigma.txt -ascii aESigma
Eg=net.gE'; save Eg_All_Threshold.txt -ascii Eg
EGamma=net.EGamma'; save EGamma_All_Threshold.txt -ascii EGamma
Egzscore=net.gEzscore'; save Egzscore_All_Threshold.txt -ascii Egzscore
ELambda=net.ELambda'; save ELambda_All_Threshold.txt -ascii ELambda
Eloc=net.locE'; save Eloc_All_Threshold.txt -ascii Eloc
Eloczscore=net.locEzscore'; save Eloczscore_All_Threshold.txt -ascii Eloczscore
ESigma=net.ESigma'; save ESigma_All_Threshold.txt -ascii ESigma
b=net.b'; save b_All_Threshold.txt -ascii b
bzscore=net.bzscore'; save bzscore_All_Threshold.txt -ascii bzscore
mod=net.mod'; save modularity_All_Threshold.txt -ascii mod
modzscore=net.modzscore'; save modularity_zscore_All_Threshold.txt -ascii modzscore
aCp=net.aCp'; save aCp.txt -ascii aCp
aCpzscore=net.aCpzscore'; save aCpzscore.txt -ascii aCpzscore
aGamma=net.aGamma'; save aGamma.txt -ascii aGamma
aLambda=net.aLambda'; save aLambda.txt -ascii aLambda
aLp=net.aLp'; save aLp.txt -ascii aLp
aLpzscore=net.aLpzscore'; save aLpzscore.txt -ascii aLpzscore
aSigma=net.aSigma'; save aSigma.txt -ascii aSigma
Cp=net.Cp'; save Cp_All_Threshold.txt -ascii Cp
Cpzscore=net.Cpzscore'; save Cpzscore_All_Threshold.txt -ascii Cpzscore
Gamma=net.Gamma'; save Gamma_All_Threshold.txt -ascii Gamma
Lambda=net.Lambda'; save Lambda_All_Threshold.txt -ascii Lambda
Lp=net.Lp'; save Lp_All_Threshold.txt -ascii Lp
Lpzscore=net.Lpzscore'; save Lpzscore_All_Threshold.txt -ascii Lpzscore
Sigma=net.Sigma'; save Sigma_All_Threshold.txt -ascii Sigma
s=net.s'; save s_All_Threshold.txt -ascii s
szscore=net.szscore'; save szscore_All_Threshold.txt -ascii szscore
aBe=net.abw'; save aBe.txt -ascii aBe
Be=net.bw'; save Be_All_Threshold.txt -ascii Be
aDeg=net.adeg'; save aDeg.txt -ascii aDeg
Deg=net.deg'; save Deg_All_Threshold.txt -ascii Deg

if strcmp(network_equaldim,'no') %当每个网络的节点数不同时，不计算node参数，只计算net参数
else
anodalDeg=node.adeg; save anodalDeg_All_Node.txt -ascii anodalDeg
anodalBe=node.abw; save anodalBe_All_Node.txt -ascii anodalBe
anodalCp=node.aCp; save anodalCp_All_Node.txt -ascii anodalCp
anodalLp=node.aLp; save anodalLp_All_Node.txt -ascii anodalLp
anodalEg=node.agE; save anodalEg_All_Node.txt -ascii anodalEg
anodalEloc=node.alocE; save anodalEloc_All_Node.txt -ascii anodalEloc
end