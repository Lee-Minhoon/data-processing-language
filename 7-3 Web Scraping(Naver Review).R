# ��Ű�� ��ġ �ε�
install.packages("rvest")
library(rvest)

# ������(������) �б�
naver_movie_url <- "https://movie.naver.com/movie/point/af/list.nhn"
html <- read_html(naver_movie_url)
html

# ���� �� ����
review_cell <- html_nodes(html, "#old_content table tr .title")
review_cell

# ���� ����
score <- html_nodes(review_cell, "em") %>% html_text()
score

# ���� ����
review <- review_cell %>% html_text()
review

# ���� ����
index.start <- regexpr("\t���� -", review)
index.end <- regexpr("\t�Ű�", review)

review <- substring(review, index.start, index.end)
review
review <- substring(review, 16)
review
review <- gsub("[|\n|\t]", "", review)
review
review <- trimws(review, "both")
review

# URL ����
url.page <- "https://movie.naver.com/movie/point/af/list.nhn?&page=" 

# ���۰� �� ������
page.start <- 1
page.end <- 5

# �������� ���� ����
review.page <- NULL

# ���ۺ��� ������������ �ݺ�
for(p in page.start:page.end) {
  
  # ������ URL ����
  url <- paste(url.page, p, sep = "")
  
  ## 8.4���� ����: ����
  
  # ������ �б�
  html <- read_html(url, encoding = "CP949")
  
  # ���� �� ����
  review_cell <- html_nodes(html, "#old_content table tr .title")

  # ���� ����
  score <- html_nodes(review_cell, "em") %>% html_text()
  
  # ���� ����
  review <- review_cell %>% html_text()
  
  # ���� ������ ����
  # (1) ���� �κ� ���� ����
  index.start <- regexpr("\t���� -", review)
  index.end <- regexpr("\t�Ű�", review)
  # (2) ���� ����
  review <- substring(review, index.start, index.end)
  review <- substring(review, 16)
  # (3) ����� ����
  review <- gsub("[|\n|\t]", "", review)
  # (4) ���� �¿� ���� ����
  review <- trimws(review, "both")
  
  ## 8.4���� ����: ��
  
  # �� �������� ���� ����
  review.page <- c(review.page, review)
}

# ���� ��ü ���
review.page