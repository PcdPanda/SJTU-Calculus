x=-1:0.01:5;
y=(x>=2&x<=4)/2;
plot(x,y)
hold on
idx=x<=3;
xi=x(idx); yi=y(idx);
fill([xi xi(end) xi(1)],[y(idx) 0 0],'m','facealpha',.2,'edgecolor','none')
axis([-1,5,0,0.6]);
set(gca,'xTicklabel',{'' '' '' 'a' '(a+b)/2' 'b'})
set(gca,'yTicklabel',{'' '' '' '' '' '1/(b-a)'})
xlabel('x');
ylabel('f(x)');
hold off