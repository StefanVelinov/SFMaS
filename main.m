%r is radius, 0 <= r <= +infinity
%phi is angle, 0 <= phi <= 2*pi
%z is 3rd dim axis, 0 <= z <= 4

%set restrictions [r,phi,z]
a = [0, 0, 0];
b = [1, 2*pi, 4];

%set functions
f1 = @(r) sqrt(r^2)*r;
%f2 = @(phi) 1;
f2 = @(z) z;

%estimate and error for standart/normal mcm
[est_std, err_std] = std_mcm(f1, f2, a, b, 3000);
disp('Estimate of standart MCM = ');
disp(est_std);
disp('Error of standart MCM = ');
disp(err_std);

%estimate and error for quasi MCM using halton sequence
[est_h, err_h] = quasi_mcm_h(f1, f2, a, b, 3000);
disp('Estimate of quasi MCM (halton) = ');
disp(est_h);
disp('Error of quasi MCM (halton) = ');
disp(err_h);

%estimate and error for quasi MCM using sobol sequence
[est_s, err_s] = quasi_mcm_s(f1, f2, a, b, 3000);
disp('Estimate of quasi MCM (sobol) = ');
disp(est_s);
disp('Error of quasi MCM (sobol) = ');
disp(err_s);