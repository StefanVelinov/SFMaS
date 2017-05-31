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
std_mcm = zeros(1,N);
std_mcm_err = zeros(1,N);
qmcm_h = zeros(1,N);
qmcm_h_err = zeros(1,N);
qmcm_s = zeros(1,N);
qmcm_s_err = zeros(1,N);

counter = 1;

for k = i 
    
    %[est_std, err_std] = std_mcm(f1, f2, a, b, k);
    
    [est_h, err_h] = quasi_mcm_h(f1, f2, a, b, k);
    [est_s, err_s] = quasi_mcm_s(f1, f2, a, b, k);
    
    %std_mcm(counter) = est_std;
    %std_mcm_err(counter) = err_std;
    qmcm_h(counter) = est_h;
    qmcm_h_err(counter) = err_h;
    qmcm_s(counter) = est_s;
    qmcm_s_err(counter) = err_s;
    
    counter = counter + 1;
end