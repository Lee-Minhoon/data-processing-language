# 패키지 설치 로딩
install.packages("rvest")
library(rvest)

# 웹문서(페이지) 읽기
url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do"
html <- read_html(url)
html

title <- html_nodes(html, "#apiDataList .title") %>% html_text()
title

desc <- html_nodes(html, "#apiDataList .ellipsis") %>% html_text()
desc

title <- gsub("[|\r|\n|\t]", "", title)
title

api <- data.frame(title, desc)
api
