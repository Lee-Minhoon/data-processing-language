# Call Libaraies
install.packages("neuralnet")
install.packages("MASS")
library(neuralnet)
library(MASS)

# 데이터 확인
head(Boston)

# 분석 대상 데이터 할당
data <- Boston[, c(1, 2, 4, 5, 9, 14)]
head(data)

# 결측치 확인
na <- apply(data, 2, is.na)
na
apply(na, 2, sum)

# 데이터 정규화
maxs <- apply(data, 2, max)
maxs
mins <- apply(data, 2, min)
mins
data.scaled <- scale(data, center = mins, scale = maxs - mins)
data.scaled

# 학습용과 테스트용 데이터 분리
n <- nrow(data.scaled)
set.seed(1234)
index <- sample(1:n, round(0.8 * n))
index

train <- as.data.frame(data.scaled[index, ])
head(train)

test <- as.data.frame(data.scaled[-index, ])
head(test)

# 학습용 입출력 변수 할당
names.col <- colnames(train)
names.col

var.dependent <- names.col[6]
var.dependent

var.independent <- names.col[-6]
var.independent

f.var.independent <- paste(var.independent, collapse = "+")
f.var.independent

f <- paste(var.dependent, "~", f.var.independent)
f

# 학습 및 모형 출력
nn <- neuralnet(f, data = train, hidden =c(3, 2), linear.output = T)
plot(nn)

# 테스트
predicted <- compute(nn, test[, ])
predicted$net.result

predicted.real <- predicted$net.result * (maxs[5] - mins[5]) + mins[5]
predicted.real

test.real <- test$medv * (maxs[5] - mins[5]) + mins[5]
test.real

# 실제 값 대비 예측 값 비교(분포)
plot(test.real, predicted.real, xlim = c(0, 25), ylim = c(0, 25),
     main = "실제 값 대비예측 값 분포", xlab = "실제 값", ylab = "예측 값",
     col = 'red', pch = 18, cex = 0.7)
abline(0, 1, col = "blue", lty = 2)

MAPE.nn <- sum(abs(test.real - predicted.real) / test.real * 100) / length(test.real)
MAPE.nn
