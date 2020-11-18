install.packages("RCurl")
# xml, wordcloud
install.packages("RmecabKo")
install_mecab("C:/Rlibs/mecab")
install.packages("dotenv")

library(RCurl)
library(XML)
library(wordcloud)
library(RmecabKo)
library(dotenv)

keys = Sys.getenv(c("Client_ID", "Client_Secret"))
keys = unname(keys)

# API
searchUrl <- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- keys[1]
Client_Secret <- keys[2]

query <- URLencode(iconv("인공지능", "euc-kr", "UTF-8"))
url <- paste(searchUrl, "?query=", query, "&display=20", sep = "")
url
doc <- getURL(url, httpheader = c('Content-Type'="application/xml",
                                  'X-Naver-Client-Id' = Client_ID,
                                  'X-Naver-Client-Secret' = Client_Secret))
doc
xmlFile <- xmlParse(doc)
xmlFile
df <- xmlToDataFrame(getNodeSet(xmlFile, "//item"))
str(df)
description <- df[, 4]
description2 <- gsub("\\d|<b>|</b>|&quot;", "", description)

nouns <- nouns(iconv(description2, "utf-8"))

nouns.all <- unlist(nouns, use.names = F)

nouns.all1 <- nouns.all[nchar(nouns.all) <= 1]
nouns.all2 <- nouns.all[nchar(nouns.all) >= 2]

nouns.freq <- table(nouns.all2)
nouns.df <- data.frame(nouns.freq, stringAsFactors = F)

nouns.df.sort <- nouns.df[order(-nouns.df$Freq), ]

wordcloud(nouns.df.sort[, 1], freq = nouns.df.sort[, 2],
          min.freq = 1, scale = c(3, 0.7), rot.per = 0.25,
          random.order = F, random.color = T, colors = rainbow(7))

