# 패키지 설치 로딩
install.packages("rvest")
library(rvest)

# 웹문서(페이지) 읽기
naver_movie_url <- "https://movie.naver.com/movie/point/af/list.nhn"
html <- read_html(naver_movie_url)
html

# 리뷰 셀 추출
review_cell <- html_nodes(html, "#old_content table tr .title")
review_cell

# 평점 추출
score <- html_nodes(review_cell, "em") %>% html_text()
score

# 리뷰 추출
review <- review_cell %>% html_text()
review

# 리뷰 정제
index.start <- regexpr("\t별점 -", review)
index.end <- regexpr("\t신고", review)

review <- substring(review, index.start, index.end)
review
review <- substring(review, 16)
review
review <- gsub("[|\n|\t]", "", review)
review
review <- trimws(review, "both")
review

# URL 설정
url.page <- "https://movie.naver.com/movie/point/af/list.nhn?&page=" 

# 시작과 끝 페이지
page.start <- 1
page.end <- 5

# 페이지별 리뷰 통합
review.page <- NULL

# 시작부터 끝페이지까지 반복
for(p in page.start:page.end) {
  
  # 페이지 URL 설정
  url <- paste(url.page, p, sep = "")
  
  ## 8.4절과 동일: 시작
  
  # 웹문서 읽기
  html <- read_html(url, encoding = "CP949")
  
  # 리뷰 셀 추출
  review_cell <- html_nodes(html, "#old_content table tr .title")

  # 평점 추출
  score <- html_nodes(review_cell, "em") %>% html_text()
  
  # 리뷰 추출
  review <- review_cell %>% html_text()
  
  # 리뷰 데이터 정제
  # (1) 리뷰 부분 추출 색인
  index.start <- regexpr("\t별점 -", review)
  index.end <- regexpr("\t신고", review)
  # (2) 리뷰 추출
  review <- substring(review, index.start, index.end)
  review <- substring(review, 16)
  # (3) 제어문자 제거
  review <- gsub("[|\n|\t]", "", review)
  # (4) 리뷰 좌우 공백 제거
  review <- trimws(review, "both")
  
  ## 8.4절과 동일: 끝
  
  # 각 페이지의 리뷰 저장
  review.page <- c(review.page, review)
}

# 리뷰 전체 출력
review.page
