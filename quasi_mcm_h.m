function[est, err] = quasi_mcm_h(f1, f2, a, b, n)

h = haltonset(2); %generate 2D halton set
get_h = net(h,n); %obtain the points

r(1:n) = a(1) + (b(1) - a(1))*(get_h(1:n,1));
z(1:n) = a(3) + (b(3) - a(3))*(get_h(1:n,2));

s1 = 0;
s2 = 0;

for i = 1:n
    s1 = s1 + f1(r(1,i));
    s2 = s2 + f2(z(1,i))*4;
end

est = (s1/n)*(s2/n)*2*pi;
err = abs(16*pi/3 - est);
end