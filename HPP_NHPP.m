
%% Algorithm HPP1 (waiting times)
%    Output, integer N, the number of Poisson events observed.

N_HPP1_sim = []
lambda = 5
t = 6
for K = 1:1000   
N = 0
T = 0

  while (T < t) 
   
    E = - log(rand(1,1))/lambda;
    T = T + E;   
     N = N + 1;
  end

  N_HPP1_sim(K) = N-1
end

N_HPP1 = mean(N_HPP1_sim)

%% Algorithm HPP2 (conditional theorem)

lambda = 5;
t = 6;
N_HPP1_sim = [];
N_HPP2_sim = [];
for K = 1:1000
U = rand; 
N = 0; 
p = exp(-lambda*t);
F = p;
while U > F, N = N+1; 
    p = p*lambda*t/N; 
    F = F+p; 
end

N_HPP2_sim(K) = N
disp(N), 
disp(sort(t*rand(1,N)))

end

N_HPP2 = mean(N_HPP2_sim)

%%  NHPP1(Thinning) employs HPP1 algo

%Example, with lambda (t) = 6/(t + 2), t = 2; so 
for K =1:1000
t = 2;
for i = 0:t;
lambda(i+1) = 6/(i + 2);
lambda_bar = max(lambda)
end
N = 0;
T_star = 0;
T=0;
E = -log(rand(1,1))/lambda_bar;
T_star = T_star + E;
while (T_star < t) ,
 
if rand < 6/(T_star+2)/lambda_bar, 
    N = N+1;
    T(N) = T_star;
end
E = -log(rand(1,1))/lambda_bar
T_star = T_star +E;
%E = E-log(rand)/3;
end
disp([N T(1:N)])
N_NHPP1_sim(K) = N
end
N_NHPP1 = mean(N_NHPP1_sim)


%%  NHPP2(Integration) employs HPP2 algo
%try other examples lambda(t)= a+b*t (linear) lambda(t)= a+b*sin(2pi*t)) (seasonal intensity) 
%Example with lambda(t) = 6/(t + 2), t = 2; so 
%F?1
%s (U) = (s + 2)[U?1=6 ? 1].
for K =1:1000
T = 0    
T = 2*(rand^(-1/6)-1);
N = 0;
while T < t,  
    N = N+1;
S(N) = T;
T = T + (2+T)*(rand^(-1/6)-1);
end
disp([N S(1:N)])
N_NHPP2_sim(K) = N
end
N_NHPP2 = mean(N_NHPP2_sim)


