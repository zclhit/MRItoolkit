%% hitsz_gretna_assortativty_w
% w means weighted network
%%
function r=hitsz_gretna_assortativty_w(W)
W = abs(W);
W = W - diag(diag(W));

H = sum(sum(W))/2;
Mat = W;
Mat(Mat ~= 0) = 1;
[deg] = sum(Mat);
K = sum(deg)/2;
[i,j,v] = find(triu(W,1));

for k = 1:K
    degi(k,1) = deg(i(k));
    degj(k,1) = deg(j(k));
end

% compute assortativity
r = (sum(v.*degi.*degj)/H - (sum(0.5*(v.*(degi+degj)))/H)^2)/(sum(0.5*(v.*(degi.^2+degj.^2)))/H - (sum(0.5*(v.*(degi+degj)))/H)^2); % [Leung and Chau (2007): Weighted assortative and disassortative networks model. Equation (15)].
return