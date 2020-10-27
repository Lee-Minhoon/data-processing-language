# Call Library
library(rvest)
library(ggplot2)
library(scales)

# 백준(알고리즘 트레이닝 사이트) 랭킹 페이지를 스크래핑 하였습니다.
url <- "https://www.acmicpc.net/ranklist/"

# 시작과 끝 페이지 설정
page.start <- 1
page.end <- 5

# 데이터 통합할 변수 생성
total_name <- NULL
total_problem <- NULL
total_rate <- NULL

# 시작부터 끝페이지까지 반복
for (p in page.start:page.end) {
  
  # 페이지 URL 설정
  url.page <- paste(url, p, sep = "")
  
  # 웹문서 읽기
  html <- read_html(url.page)
  
  # 페이지 별 데이터 추출
  page <- html_nodes(html, "#ranklist td") %>% html_text()

  # 각 페이지에서 필요한 데이터 저장
  total_name <- c(total_name, page[seq(2, length(page), 6)])
  total_problem <- c(total_problem, as.numeric(page[seq(4, length(page), 6)]))
  total_rate <- c(total_rate, page[seq(6, length(page), 6)])
}

# * 100은 원래 페이지당 사람수 곱해주는 것
# person변수는 차트 한 페이지당 몇명의 사람을 보여줄 것인지
person = 10L
for (i in 1:(page.end * 100 / person)) {
  # index변수를 생성하고 차트에 띄워줄 데이터들을 불러온다.
  index = c((i * person):((i - 1) * person + 1))
  name <- c(total_name[index])
  problem <- c(total_problem[index])
  rate <- c(total_rate[index])
  color <- NULL
  grade = c(6000, 3000, 2000, 1500, 1000, 500)
  grade_color = c("#670000", "#FF0000", "#FFBB00", "#5F00FF", "#0054FF", "#000000")
  for (j in problem) {
    if (j >= 6000) color <- c(color, "#670000")
    else if (j >= 3000) color <- c(color, "#FF0000")
    else if (j >= 2000) color <- c(color, "#FFBB00")
    else if (j >= 1500) color <- c(color, "#5F00FF")
    else if (j >= 1000) color <- c(color, "#0054FF")
    else if (j >= 500) color <- c(color, "#000000")
    else color <- c(color, "#8C8C8C")
  }
  
  # option값에 따라 각각 ggplot, plot함수를 실행
  option = TRUE
  if (option)
  {
    dataframe = data.frame(index, name, rate, problem)
    print(ggplot(data = dataframe, mapping = aes(index, problem))
          + geom_bar(stat='identity')
          + theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 20, color = "#5D5D5D"),
                  axis.title = element_text(face = "bold", size = 15, color = "#5D5D5D"))
          + ggtitle("백준 사이트 랭킹")
          + labs(x = "랭킹", y="푼 문제수")
          + scale_x_continuous(breaks = seq(index[1], index[person], -1), minor_breaks = NULL,
                               trans = "reverse", labels = paste(seq(index[1], index[person], -1), "등"))
          + scale_y_continuous(breaks = seq(0, 10000, 500), limits = c(0, 10000))
          + coord_flip()
          + annotate("segment", x = index[1] + 0.5, xend = index[person] - 0.5, y = grade, yend = grade,
                     color = grade_color, size = 1)
          + annotate("text", x = index, y = problem + 200,
                     label = paste(name, "(", rate, ")", sep = ""),
                     hjust = 0, vjust = 0.3, color = color))
  }
  else
  {
    bp <- barplot(problem, names.arg = index, main = "백준 사이트 랭킹",
                  xlab = "푼 문제수", ylab = "랭킹", xlim = c(0, 10000), horiz = TRUE)
    text(y = bp, x = problem, labels = paste(name, "(", rate, ")", sep = ""), pos = 4, col = color)
    for (j in 1:6) {
      abline(v = grade[j], col = grade_color[j], lty = 2)
    }
  }
  Sys.sleep(2)
}
