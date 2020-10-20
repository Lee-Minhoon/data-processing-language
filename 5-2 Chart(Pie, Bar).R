rivers
stem(rivers)
stem(rivers, scale = 2)

# Pie Chart
city <- c("서울", "부산", "대구", "인천")
pm25 <- c(18, 22, 21, 30)
colors <- c("red", "orange", "yellow", "green")
pie(pm25, labels = city, col = colors, main = "지역별 미세먼지")
pie(pm25, labels = city, col = colors, main = "지역별 미세먼지",
    init.angle = 90, clockwise = T)
colors()

# Label, Pallete
install.packages("RColorBrewer")
library(RColorBrewer)

greens <- brewer.pal(4, 'Greens')
pct <- round(pm25 / sum(pm25) * 100.0)
city_label <- paste(city, ", ", pct, "%", sep = "")
pie(pm25, labels = city_label, col = greens, main = "지역별 미세먼지",
    init.angle = 90, clockwise = T)

# Bar Plot
dept <- c("영업1팀", "영업2팀", "영업3팀", "영업4팀")
sales01 <- c(4, 12, 5, 8)

bp <- barplot(sales01, names.arg = dept, main = "부서별 영업 실적(1분기)",
            col = rainbow(length(dept)), xlab = "부서", ylab = "영업 실적",
            ylim = c(0, 15))
text(x = bp, y = sales01, labels = sales01, pos = 1)
barplot(sales01, names.arg = dept, main = "부서별 영업 실적(1분기)",
        col = rainbow(length(dept)), xlab = "부서", ylab = "영업 실적",
        ylim = c(0, 15), horiz = TRUE)
sale02 <- c(12, 8, 8, 4)
sales <- rbind(sales01, sale02)
sales
legend_label <- c("1분기", "2분기")
barplot(sales, names.arg = dept, main = "부서별 영업 실적(1~2분기)",
        col = c("green", "orange"), xlab = "부서", ylab = "영업 실적",
        ylim = c(0, 15), legend.text = legend_label, beside = TRUE)
