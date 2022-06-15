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
 
 
## 담금질 알고리즘을 이용한 최소 MSE 찾기 

![슬라이드1](https://user-images.githubusercontent.com/100903674/173720997-9425f067-b95c-4af2-bf94-f9ae0a8c8c34.PNG)

위의 그림 처럼 데이터가 뒤죽박죽할때는 딱 들어맞는 완벽한 회귀식을 찾기 어렵고 오차가 있다.. 그러므로 이런 경우에는 데이터를 표현할 완벽한 식이 아닌 최선의 답을 찾아내야 한다. 따라서 최선의 답을 찾기 위해 적합성 정도를 보여주는 MSE를 활용해 최선의 답을 찾을 수 있다.

### MSE란?
MSE란 오차를 제곱한 값의 평균이다. 여기서 오차는 실제 데이터값과 예측 선형 회귀식의 차이이다. 예측 선형 회귀식과 데이터값의 오차값이 적을수록 선형 회귀식의 정확성은 높아지므로 MSE가 0에 수렴할 수록 선형회귀식의 정확성은 높아진다. MSE를 식으로 표현하면
![image](https://user-images.githubusercontent.com/100903674/173725732-024e5c85-cee3-4b01-8dae-eaa1d35923c2.png)

### 담금질 알고리즘 

담금질 알고리즘은 높은 온도에서 액체상태인 물질이 온도가 점차 낮아지면서 변하는 과정을 모방한 해 탐색 알고리즘이다. 여기에서는 최소 MSE를 찾아야 한다. 









## 선형회귀 알고리즘의 실행과 결과 
![ezgif com-gif-maker (2)](https://user-images.githubusercontent.com/100903674/173194264-19d42cb6-12ad-4b58-9cd5-56d594932d01.gif)


```
y=4.444x+1.3297라는 결과값이 나온다. 
```


