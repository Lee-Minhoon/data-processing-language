# 몬테카를로 시뮬레이션
iteration <- 1000
n_circle <- 0

plot(NA, xlim = c(0, 1), ylim = c(0, 1))
pts <- NULL

for(i in 1:iteration) {
  # 임의의 위치에 점 생성 (x, y)
  x <- runif(1, min = 0, max = 1)
  y <- runif(1, min = 0, max = 1)
  
  pts <- rbind(pts, c(x, y))
  
  # 거리 계산
  dist <- sqrt(x ^ 2 + y ^ 2)
  if(dist <= 1) {
    n_circle <- n_circle + 1
  }
}

points(pts, pch = 19, cex = 0.5, col = "black")
pi <- 4 * n_circle / iteration

# 회귀선 구하기
x <- c(1, 2.2, 3.5, 4, 5.2, 6.4, 7.1, 8.3, 9.2, 10)
y <- c(41, 47, 62, 75, 85, 90, 110, 115, 125, 140)
plot(x, y, xlim = c(0, 10), ylim = c(0, 150))

# 기울기(b), y절편(a) (y=bx+a)
B <- seq(-5, 15, by = 1)
A <- seq(-30, 30, by = 1)

cost.mtx <- matrix(NA, nrow = length(B), ncol = length(A))

for(i in 1:length(B)) {
  for(j in 1:length(A)) {
    err.sum <- 0
    
    for(k in 1:length(x)) {
      y_hat <- B[i] * x[k] + A[j]
      err <- (y_hat - y[k]) ^ 2
      err.sum <- err.sum + err
    }
    cost <- err.sum / length(x)
    cost.mtx[i, j] <- cost
  }
}

range(cost.mtx)

idx <- which(cost.mtx == min(cost.mtx), arr.ind = TRUE)
idx.Bmin <- idx[1, 1]
idx.Amin <- idx[1, 2]
Bmin <- B[idx.Bmin]
Amin <- A[idx.Amin]

abline(a = Amin, b = Bmin, col = "red", lty = 2)

plot(B, cost.mtx[, idx.Amin])

# rgl
install.packages("rgl")
library(rgl)
persp3d(B, A, cost.mtx, col = "yellow", zlim = c(0, 400))
