gender<-c("W", "M", "W", "M")
gender
gf<-factor(gender)
gf
x
x<-c(70, 80, 90)
x
arr<-array(x)
arr
z<-1:6
z
arr<-array(z, dim=c(2, 3))
arr
help(array)
arr<-array(z, c(2,3))
arr
arr<-array(1:6, c(2,3))
arr
arr<-array(3:9, c(2,3))
arr
name<-list(c("row1", "row2"), c("col1", "col2", "col3"))
name
arr
arr<-array(1:6, dim=c(2, 3), dimnames=name)
arr
arr[2, 3]
arr[2, 3]<-7
arr
arr[1, ]
arr[, 2]
x<-1:6
x
mtx<-matrix(x, nrow = 2)
mtx
mtx<-matrix(x, nrow = 2, dimnames = name, byrow = TRUE)
mtx
mtx<-rbind(mtx, 1:3)
mtx
rownames(mtx)
rownames(mtx)[3]<-"row3"
mtx
x<-list("aa", 10, c(1, 2, 3))
x
x[[1]]
x[[3]]
x[[3]][2]
x<-list(name = "aa", age = 10, number = c(1, 2, 3))
x
x[2]
x[[2]]
x["age"]
x$name
df<-data.frame(name = c("aa", "bb"), age = c(10, 15), number = c(50, 60))
df
df<-rbind(df, data.frame(name = "cc", age = 20, number = 70))
df
df[3, 2]
df[2, ]
df[-2, ]
str(df)
x
str(x)
df[1, 1]<-"dd"
df
library()
data(package = "datasets")
quakes
head(quakes)
str(quakes)
iris
volcano
head(volcano)
tail(quakes)
names(quakes)
write.table(quakes, "./output/quakes.csv")
write.table(quakes, "./output/quakes.csv", sep = ",")
df<-read.csv("./output/quakes.csv", header = T)
head(df)
sd(1:10)
getTriArea<-function(w, h) {
  area<-w*h/2
  return(area)
}
getTriArea(10, 20)
