# 표본추출, 난수
sample(c("앞면", "뒷면"), 20, replace = T)
runif(10, min = 0,max = 10)

iteration <- 5000
plot(0, 0, xlab = "동전을 던진 횟수", ylab = "앞면이 나오는 비율",
     xlim = c(0, iteration), ylim = c(0, 1))
abline(a = 0.5, b = 0, col = "red")

sum <- 0
for(x in 1:iteration) {
  # 동전 던지기
  coin <- sample(c("앞면", "뒷면"), 1, replace = T)
  if(coin == "앞면") {
    sum = sum + 1
  }
  prob <- sum / x
  points(x, prob)
}

x <- sample(c(0, 1), iteration, replace = T)
result <- sum(x) / iteration
round(result * 100, 1)
