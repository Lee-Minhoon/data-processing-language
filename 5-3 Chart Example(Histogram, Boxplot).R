# plot
women
height <- women$height
weight <- women$weight
plot(x = height, y = weight, xlab = "키", ylab = "몸무게",
     main = "키와 몸무게의 변화", pch = 23, type = "c")

# Histogram
quakes
mag <- quakes$mag
hist(mag, main = "지진 발생 강도의 분포", xlab = "지진 강도",
     ylab = "발생 건수", col = rainbow(10), breaks = seq(4, 6.5, by=0.5))
hist(mag, main = "지진 발생 강도의 분포", xlab = "지진 강도",
     ylab = "발생 건수", col = rainbow(10), freq = FALSE)
lines(density(mag), lwd = 2)

# Box Plot
boxplot(mag, main = "지진 발생 강동의 분포", xlab = "지진",
        ylab = "지진 규모", col = "red")
