%% exponential for [0;1), pdf f(x) = beta*e^(-beta*x)
%Inverse transform methof (Ross, 2002)

%X = -ln(1 - U)/beta or X = -ln(U)/beta.

%compute 10000 X's for 
beta = 2; 
K = 10000; X = -log(rand(1,K))/beta; 
disp(mean(X))
figure
subplot(1,2,1); hist(X)
subplot(1,2,2); plot( sort(X),[1:K]/K )

%% Pareto distribution
%X=lambda (U^(-1/alpha)-1)
lambda = 0.5;
alpha = 2;
K = 10000; 
X = lambda*(rand(1,K).^(-1/alpha)-1); 
figure
subplot(1,2,1); hist(X)
subplot(1,2,2); plot( sort(X),[1:K]/K )
%% Gamma(n,b) RV X, with pdf f(x) = K(bx)n?1e?bx, x > 0:

K = 10000; n = 10; b = 5;
X = -log( prod( rand(n,K) ) )/b;

figure
subplot(1,2,1); hist(X)

subplot(1,2,2); plot( sort(X),[1:K]/K )
disp([mean(X) n/b])
