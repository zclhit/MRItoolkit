%% hitsz_gretna_synchronization_w
% w means weighted network
%%
function s = hitsz_gretna_synchronization_w(W)
W = abs(W);
W = W - diag(diag(W));

Deg = sum(W);

D = diag(Deg,0);
G = D - W;
Eigenvalue = sort(eig(G));%Add sort by Sandy Wang

s = Eigenvalue(2)/Eigenvalue(end);
return