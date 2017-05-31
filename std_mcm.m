function [est, err] = std_mcm(f1, f2, a, b, n)

%using rand for uniformly distributed in [0,1]
r = a(1) + (b(1) - a(1))*rand(1,n); 
%phi = a(2) + (b(2) - a(2))*rand(1,n);
z = a(3) + (b(3) - a(3))*rand(1,n);

s1 = 0;
%s2 = 0;
s3 = 0;

for i=1:n
   s1 = s1 + f1(r(i));   
   s3 = s3 + f2(z(i))*4;
end

est = (s1/n)*(s3/n)*2*pi;
err = abs((16*pi/3) - est);
end