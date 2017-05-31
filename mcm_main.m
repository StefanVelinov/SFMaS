%run main.m

%set restrictions [r,phi,z]
a = [0, 0, 0];
b = [1, 2*pi, 4];

%set functions
f1 = @(r) sqrt(r^2)*r;
%f2 = @(phi) 1;
f2 = @(z) z;

%i contains number of points for each iteration
i = [500 1000 2000 5000 10000 50000 100000];
N = length(i);

%contains errors and estimations for different i;
std_mcm_est = zeros(1,N);
std_mcm_err = zeros(1,N);
qmcm_h = zeros(1,N);
qmcm_h_err = zeros(1,N);
qmcm_s = zeros(1,N);
qmcm_s_err = zeros(1,N);

counter = 1;

for k = i 
    
    [est_std, err_std] = std_mcm(f1, f2, a, b, k);
    [est_h, err_h] = quasi_mcm_h(f1, f2, a, b, k);
    [est_s, err_s] = quasi_mcm_s(f1, f2, a, b, k);
    
    std_mcm_est(counter) = est_std;
    std_mcm_err(counter) = err_std;
    qmcm_h(counter) = est_h;
    qmcm_h_err(counter) = err_h;
    qmcm_s(counter) = est_s;
    qmcm_s_err(counter) = err_s;
    
    counter = counter + 1;
end

%actual solution
actual(1:N) = 16*pi/3;

%plot estimations
subplot(2,2,1);
semilogx(i,actual,'-k',i,std_mcm_est,'green',i,qmcm_h,'red',i,qmcm_s,'blue','LineWidth',2);
legend('Exact solution',' Standart MCM','QMCM Halton','QMCM Sobol');
xlabel('Number of points'),ylabel('Estimation');
title('Estimation comparison for QMCM Halton, QMCM Sobol and Standart MCM');
grid on;

%plot errors
subplot(2,2,2);
semilogx(i,std_mcm_err,'green',i,qmcm_h_err,'red',i,qmcm_s_err,'blue','LineWidth',2);
legend('Standart MCM','QMCM Halton','QMCM Sobol');
xlabel('Number of points'),ylabel('Error');
title('Error comparison for Standart MCM, QMCM Sobol and QMCM Halton');
grid on;

subplot(2,2,3);
semilogx(i,actual,'-k',i,qmcm_h,'red',i,qmcm_s,'blue','LineWidth',2);
legend('Exact solution','QMCM Sobol','QMCM Halton');
xlabel('Number of points'),ylabel('Estimation');
title('Estimation comparison for QMCM using Halton and Sobol');
grid on;

subplot(2,2,4);
semilogx(i,qmcm_h_err,'red',i,qmcm_s_err,'blue','LineWidth',2);
legend('QMCM Halton','QMCM Sobol');
xlabel('Number of points'),ylabel('Error');
title('Error comparison for QMCM using Halton and Sobol');
grid on;