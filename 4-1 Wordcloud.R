city<-c("����", "�λ�", "�뱸", "��õ")
city
pm25<-c(18, 21, 30, 10)
y<-c(37.567, 35.180, 35.877, 37.457)
x<-c(126.978, 129.074, 128.600, 126.702)
help("plot")
plot(x = x, y = y, pch = 19, cex = pm25 * 0.3, col = rgb(1, 0, 0, 0.5),
     xlim = c(126, 130), ylim = c(35, 38), xlab = "�浵", ylab = "����")
text(x = x, y = y, labels = city)
install.packages("wordcloud")
library(wordcloud)
city
pm25
wordcloud(city, freq = pm25, color = rainbow(3), random.color = T)
city[5]<-"����"
pm25[5]<-40
wordcloud(city, freq = pm25, color = rainbow(3), random.color = T)
wordcloud(city, freq = pm25, color = rainbow(3))
wordcloud(city, freq = pm25, color = rainbow(5))
wordcloud(city, freq = pm25, color = rainbow(7))