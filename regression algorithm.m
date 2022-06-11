dx=[2 4 6 8 10 2 6 8 10 12 14 16 18 16 18 18]

dy=[10 20 30 40 50 30 40 20 60 65 60 70 70 65 80 75 ]

syms x
a=0;
b=0;
T=500;
da=0;
db=0;


n=1000;

for num=1:n

u=-1+2*rand();
t=-1+2*rand();
 da=a+T*u;
 db=b+T*t;
predict=a*dx;

predictl=da*dx;
realgap=predict-dy;
mse=mean((realgap).^2);

realgapl=predictl-dy;
msel=mean((realgapl).^2);

d=msel-mse;
if(d<0)
    a=da;
    realgapl=realgapl+b;
    realgapll=realgapl+db;
msel=mean((realgapl).^2);
msell=mean((realgapll).^2);
d=msell-msel;
if(d<0)
b=db;
else
q=rand;
p=exp(-d/T);
if(q<p)
b=db;

end    

end

else
  realgap=realgap+b;
    realgapll=realgap+db;
msel=mean((realgap).^2);
msell=mean((realgapll).^2);
d=msell-msel;
if(d<0)
b=db;
else
q=rand;
p=exp(-d/T);
if(q<p)
b=db;

end    

end







end

figure(1)

plot(dx,dy,'r.','MarkerSize',25) 
axis([0 20 0 100]),title(["횟수=",num2str(num),"온도=",num2str(T),"y=",num2str(a),"X+",num2str(b)   ]),xlabel("선호가 공부하는 시간"),ylabel("선호의 시험성적 "),hold on

y=a*x+b;
fplot(y,'b')
hold off
drawnow
figure(2)
T=0.99*T;


end



