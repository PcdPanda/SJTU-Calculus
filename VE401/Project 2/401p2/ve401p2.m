x=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22];
y=[2 11 12 28 38 29 37 32 23 14 10 7 8 1 5 1 0 1 1 0 0 0 0];
t=-((x-6.07)/5.4448).^2/2;
z=round(53.8/sqrt(2*pi)*exp(t));
m=0;
for i=1:22
    m=m+z(i);
end
bar(x,z);
xlabel('Number of Shootings');
ylabel('Predicted Number of Weeks');

axis([0 22 0 38]);