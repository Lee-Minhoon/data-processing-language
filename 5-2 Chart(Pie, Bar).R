rivers
stem(rivers)
stem(rivers, scale = 2)

# Pie Chart
city <- c("����", "�λ�", "�뱸", "��õ")
pm25 <- c(18, 22, 21, 30)
colors <- c("red", "orange", "yellow", "green")
pie(pm25, labels = city, col = colors, main = "������ �̼�����")
pie(pm25, labels = city, col = colors, main = "������ �̼�����",
    init.angle = 90, clockwise = T)
colors()

# Label, Pallete
install.packages("RColorBrewer")
library(RColorBrewer)

greens <- brewer.pal(4, 'Greens')
pct <- round(pm25 / sum(pm25) * 100.0)
city_label <- paste(city, ", ", pct, "%", sep = "")
pie(pm25, labels = city_label, col = greens, main = "������ �̼�����",
    init.angle = 90, clockwise = T)

# Bar Plot
dept <- c("����1��", "����2��", "����3��", "����4��")
sales01 <- c(4, 12, 5, 8)

bp <- barplot(sales01, names.arg = dept, main = "�μ��� ���� ����(1�б�)",
            col = rainbow(length(dept)), xlab = "�μ�", ylab = "���� ����",
            ylim = c(0, 15))
text(x = bp, y = sales01, labels = sales01, pos = 1)
barplot(sales01, names.arg = dept, main = "�μ��� ���� ����(1�б�)",
        col = rainbow(length(dept)), xlab = "�μ�", ylab = "���� ����",
        ylim = c(0, 15), horiz = TRUE)
sale02 <- c(12, 8, 8, 4)
sales <- rbind(sales01, sale02)
sales
legend_label <- c("1�б�", "2�б�")
barplot(sales, names.arg = dept, main = "�μ��� ���� ����(1~2�б�)",
        col = c("green", "orange"), xlab = "�μ�", ylab = "���� ����",
        ylim = c(0, 15), legend.text = legend_label, beside = TRUE)