install.packages("XML")
install.packages("ggplot2")

library(XML)
library(ggplot2)

api <- "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureLIst"
api_key <- "DnBaNmHFz8qU8PByn85zPZzJnLxTsbL63RQNnCiB89wUh905iGsZLVi1LyLlwHOfTIr%2FFFXl3RF1eACNYezUfw%3D%3D"

numOfRows <- 10
pageNo <- 1
itemCode <- "PM10"
dataGubun <- "HOUR"
searchCondition <- "MONTH"

url <- paste(api, "?serviceKey=", api_key,
             "&numOfRows=", numOfRows,
             "&pageNo=", pageNo,
             "&itemCode=", itemCode,
             "&dataGubun=", dataGubun,
             "&searchCondition=", searchCondition,
             sep = "")

url
xmlFile <- xmlParse(url)
xmlFile
xmlRoot(xmlFile)
df <- xmlToDataFrame(getNodeSet(xmlFile, "//items//item"))
df

ggplot(data = df, aes(x = dataTime, y = busan, fill = dataTime)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90), legend.position = "none") +
  labs(title = "시간대별 부산지역의 PM10 변화", x = "측정일시", y = "농도") +
  scale_fill_manual(values = rainbow(10)) +
  coord_flip()
df
pm <- df[1, 4:20]
pm
