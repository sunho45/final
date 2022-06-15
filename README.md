# 최적화 알고리즘을 이용한 회귀식 추정

## 회귀식 추정에 대하여


<img src="https://user-images.githubusercontent.com/100903674/173190695-07380a11-b96d-4f33-aa57-53328f08b880.png" width="350" height="350">

x=선호의 공부시간 y=선호의 성적이라고 가정한다.

![image](https://user-images.githubusercontent.com/100903674/173190798-e33ba9d4-3a8f-4566-9341-5a878e5f6891.png)

다음과 같은 데이터가 주어진다면

<img src="https://user-images.githubusercontent.com/100903674/173190895-e0e36b58-0d2a-494c-b1ab-a74d80df4d86.png" width="350" height="350">



위의 그림과 같이 직선을 그을 수 있다.

위의 그림에서 알수 있듯이 선호의 학습시간에 대한 성적값 데이터들을 y=5*X 가 관통하는것을 보았을 때 이 직선을 분석하면 공부시간과 성적의 상관관계를 알 수 있다. 회귀식을 추정한다는 것은 이런 상관관계를 수학적으로 나타낸다는 것을 의미한다.이런 회귀식을 통해
미래를 예측할 수 있수도 있다. 예를들어 선호가 9시간을 공부했을때 성적은 45점이 나온다고 예측할 수 있다.많은 정보가 오가는 정보화 사회속에서 미래의 결과를 예측하고 대비하는 것은 큰 장점이라고 할 수 있다.
## 선형 회귀 알고리즘의 식 분석
y|a|x|+|b
---|---|---|---|---|
종속변수(결과)|  |독립변수(원인)

어떤 사건의 원인이 되는 변수 $ x,x_1,x_2,x_3$등을 독립변수라 하고 변수 $y$는 결과로 원인의 영향을 받으므로 종속변수이다.
 위와 같이 단순회귀식에서 확장해서 원인이 여러개인 회귀식을 만들 수 있다.
 **ex)$y=ax_1+bx_2+cx_3+....+x_n$**
 
 
##모의 담금질 기법을 이용한 최소 MSE 찾기 

![슬라이드1](https://user-images.githubusercontent.com/100903674/173720997-9425f067-b95c-4af2-bf94-f9ae0a8c8c34.PNG)

위의 그림 처럼 데이터가 뒤죽박죽할때는 딱 들어맞는 완벽한 회귀식을 찾기 어렵고 오차가 있다.. 그러므로 이런 경우에는 데이터를 표현할 완벽한 식이 아닌 최선의 답을 찾아내야 한다. 따라서 최선의 답을 찾기 위해 적합성 정도를 보여주는 MSE를 활용해 최선의 답을 찾을 수 있다.

### MSE란?
MSE란 오차를 제곱한 값의 평균이다. 여기서 오차는 실제 데이터값과 예측 선형 회귀식의 차이이다. 예측 선형 회귀식과 데이터값의 오차값이 적을수록 선형 회귀식의 정확성은 높아지므로 MSE가 0에 수렴할 수록 선형회귀식의 정확성은 높아진다. MSE를 식으로 표현하면
![image](https://user-images.githubusercontent.com/100903674/173725732-024e5c85-cee3-4b01-8dae-eaa1d35923c2.png)

### 모의 담금질 기법 

모의 담금질 기법은 높은 온도에서 액체상태인 물질이 온도가 점차 낮아지면서 변하는 과정을 모방한 해 탐색 알고리즘이다. 여기에서는 최소 MSE를 찾아야 한다. 모의 담금질 기법에서는 온도T의 개념이 매우 중요하다. 높은 온도의 쇳물에서는 각 분자의 에너지가 크기때문에 이리 저리 날뛰며 최적해를 찾기 시작한다.  분자는 큰 범위에서 확률적으로 움직여 더 나쁜해를 찾을 수도 있고 이과정에서 최적해를 찾을 수도 있다. 쇳물이 굳듯이 분자의 움직임도 둔해져 찾은 최적해의 범위에서 좁아진 범위에서 해를 찾아간다. 이러한 과정속에서 상대적으로 괜찮은 해인 지역 최적해를 찾는다 하더라도 궁극적인 목표인 전역 최적해를 찾기까지 분자의 움직임은 멈추지 않는다.

![image](https://user-images.githubusercontent.com/100903674/173774936-f63f8a5a-4261-4665-99eb-d924e9f5a950.png)

### 모의 담금질 기법으로  MSE 찾기(code)

#### 기본 변수
```
dx=[2 4 6 8 10 2 6 8 10 12 14 16 18 16 18 18]  

dy=[10 20 30 40 50 30 40 20 60 65 60 70 70 65 80 75 ]

syms x
a=0;
b=0;
T=500;
da=0;
db=0;
n=1000;
```
a(기울기)=0,b(y절편)=0 T=500, da(예측된 나중 기울기)=0,db(예측된 y절편)=0,n=1000 (온도가 식혀지는 횟수)으로 초기화 시켜준다.
#### T(온도)는 왜 500으로 정했나?
1000번 시행했을때 300,400대에 비해 더 빨리 0에 근사하고 600,700대에 비해 눈에띄게 구동시간이 짧아 종합적으로 이를 고려해 평균값인 500으로 정했다. 

#### 이웃해의 설정
```
u=-1+2*rand();
t=-1+2*rand();
 da=a+T*u;
 db=b+T*t;

```
$u=t=-1과 1 사이의 난수 ,da=기울기의 이웃해, db=y절편의 이웃해                           $ 
#### 이웃해를 위와 같이 정한 이유

쇳물의 분자가 담금질되어 활발한 운동상태에서 식어 움직임이 둔해지는 것과 비슷하게 시간이 지날수록 온도가 낮아져 기존 변수에서 랜덤으로 최적해의 범위를 찾는 범위를 줄이기 위해 이웃해를 위와  정의해 보았다. 




## 선형회귀 알고리즘의 실행과 결과 
![ezgif com-gif-maker (2)](https://user-images.githubusercontent.com/100903674/173194264-19d42cb6-12ad-4b58-9cd5-56d594932d01.gif)


```
y=4.444x+1.3297라는 결과값이 나온다. 
```


