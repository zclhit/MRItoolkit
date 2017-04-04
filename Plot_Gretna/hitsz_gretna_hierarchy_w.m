%% hitsz_gretna_hierarchy_w
% w means weighted network
%%
function beta = hitsz_gretna_hierarchy_w(W)
[~, ki] = gretna_node_degree_weight(W);
[~, cci] = gretna_node_clustcoeff_weight(W, 2);

if all(cci == 0) || all(ki == 0)
    beta = nan;
else
    index1 = find(ki == 0);
    index2 = find(cci == 0);
    ki([index1 index2]) = [];
    cci ([index1 index2]) = [];
    
    % compute fitted beta
    stats = regstats(log(cci),log(ki),'linear','beta');
    beta = -stats.beta(2);
end
return