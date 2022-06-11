
dx=[2 4 6 8 10 ]
dxi=[2 4 6 8 2  ]
dy=[15 30 45 60 75  ]
dyi=[2 4 6 8 2  ]
syms x
a=0;
b=0;
T=50;
da=0;
db=0;


n=10000;

for num=1:n

u=-1+2*rand();
t=-1+2*rand();
 da=a+T*u;
 db=a+T*t;
predict=a*dx;

predictl=da*dx;
realgap=predict-dy;
mse=mean((realgap).^2);

realgapl=predictl-dy;
msel=mean((realgapl).^2);

d=msel-mse;
if(d<0)
    a=da;
    
else
q=rand;
p=exp(-d/T);
if(q<p)
a=da;

end
end






figure(1)

plot(dx,dy,'r.','MarkerSize',25) 
axis([0 14 0 100]),title(["학습률: 0.025,횟수=",num2str(num)     ]),xlabel("선호가 공부하는 시간"),ylabel("선호의 시험성적 "),hold on

y=a*x+b;
fplot(y,'b')
hold off
drawnow
figure(2)

T=0.90*T;



end



