function [est, err] = quasi_mcm_s(f1, f2, a, b, n)

s = sobolset(2);
get_s = net(s,n);

r(1:n) = a(1) + (b(1) - a(1))*(get_s(1:n,1));
z(1:n) = a(3) + (b(3) - a(3))*(get_s(1:n,2));

s1 = 0;
s2 = 0;

for i = 1:n
    s1 = s1 + f1(r(1,i));
    s2 = s2 + f2(z(1,i))*4;
end

est = (s1/n)*(s2/n)*2*pi;
err = abs(16*pi/3 - est);

end