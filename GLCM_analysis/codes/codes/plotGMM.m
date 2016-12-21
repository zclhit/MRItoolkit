function result = plotGMM(X)
% if mean(X)<1
%     X=X*1000;
% end
% X=round(X);

%%====================================================
%% STEP 2: Choose initial values for the parameters.

% Set 'm' to the number of data points.
m = size(X, 1);

% Set 'k' to the number of clusters to find.
k = 2;

% Randomly select k data points to serve as the means.
indeces = randperm(m);
mu = zeros(1, k);
for (i = 1 : k)
    mu(i) = X(indeces(i));
end

% Use the overal variance of the dataset as the initial variance for each cluster.
sigma = ones(1, k) * sqrt(var(X));

% Assign equal prior probabilities to each cluster.
phi = ones(1, k) * (1 / k);

%%===================================================
%% STEP 3: Run Expectation Maximization

% Matrix to hold the probability that each data point belongs to each cluster.
% One row per data point, one column per cluster.
W = zeros(m, k);

% Loop until convergence.
for (iter = 1:1000)
    
    fprintf('  EM Iteration %d\n', iter);

    %%===============================================
    %% STEP 3a: Expectation
    %
    % Calculate the probability for each data point for each distribution.
    
    % Matrix to hold the pdf value for each every data point for every cluster.
    % One row per data point, one column per cluster.
    pdf = zeros(m, k);
    
    % For each cluster...
    for (j = 1 : k)
        
        % Evaluate the Gaussian for all data points for cluster 'j'.
        pdf(:, j) = (1 / (sigma(j) * sqrt(2 * pi))) * exp(-(X - mu(j)).^2 ./ (2 * sigma(j)^2));
        
    end
    
    % Multiply each pdf value by the prior probability for each cluster.
    %    pdf  [m  x  k]
    %    phi  [1  x  k]   
    %  pdf_w  [m  x  k]
    pdf_w = bsxfun(@times, pdf, phi);
    
    % Divide the weighted probabilities by the sum of weighted probabilities for each cluster.
    %   sum(pdf_w, 2) -- sum over the clusters.
    W = bsxfun(@rdivide, pdf_w, sum(pdf_w, 2));
    
    %%===============================================
    %% STEP 3b: Maximization
    %%
    %% Calculate the probability for each data point for each distribution.

    % Store the previous means so we can check for convergence.
    prevMu = mu;    
    
    % For each of the clusters...
    for (j = 1 : k)
    
        % Calculate the prior probability for cluster 'j'.
        phi(j) = mean(W(:, j));
        
        % Calculate the new mean for cluster 'j' by taking the weighted
        % average of *all* data points.
        mu(j) = weightedAverage(W(:, j), X);
    
        % Calculate the variance for cluster 'j' by taking the weighted
        % average of the squared differences from the mean for all data
        % points.
        variance = weightedAverage(W(:, j), (X - mu(j)).^2);
        
        % Calculate sigma by taking the square root of the variance.
        sigma(j) = sqrt(variance);
    end
    
    % Check for convergence.
    % Comparing floating point values for equality is generally a bad idea, but
    % it seems to be working fine.
    if (mu == prevMu)
        break
    end

% End of Expectation Maximization loop.    
end

%%=====================================================
%% STEP 4: Plot the data points and their estimated pdfs.

 %x1 = [min(X):(max(X)-min(X))/100:max(X)-(max(X)-min(X))/100];
 x1=X;
 x2= [0:1/100:1-1/100];
 y1 = gaussian1D(x1, mu(1), sigma(1));
 y2 = gaussian1D(x1, mu(2), sigma(2));
  %y3 = gaussian1D(x1, mu(3), sigma(3));
  %y4 = gaussian1D(x1, mu(4), sigma(4));
% y= y1*phi(1)+y2*phi(2)+y3*phi(3)+y4*phi(4);
y= y1*phi(1)+y2*phi(2);



 % plot(X,zeros(size(X)), 'bx', 'markersize', 10);
hold on
 temp=hist(X,100);
 bar(x2,temp);
 ratio=sum(temp)/sum(y);
%  filled=area(x2,ratio*y);
%  set(filled,'FaceColor',[1 0 0])

 plot(x2, ratio*y1*phi(1), 'r-','LineWidth',4);
  plot(x2, ratio*y2*phi(2), 'r-','LineWidth',4);
  %plot(x2, ratio*y3*phi(3), 'r-','LineWidth',4);
  %plot(x2, ratio*y4*phi(4), 'r-','LineWidth',4);

result={'mu','sigma','phi'};
result.mu=mu;
result.sigma=sigma;
result.phi=phi;
end
