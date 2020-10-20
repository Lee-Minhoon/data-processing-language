score<-70
score
print(score)
score<-c(70, 80, 90)
score
score[2]
score[0]
score[4]
score[4]<-100
score
score[2]<-85
score
name<-c("aa", "bb", "Cc")
name
x<-seq(1, 10, by = 3)
x
x<-seq(1, 10, by = 4)
x
x<-1:10
x
x<-10:1
x
x<-seq(1, 10, length.out = 5)
x
help("seq")
help(seq)
x<-c(1, 2, 3)
x
y<-rep(x, times = 2)
y
y<-rep(x, each = 3)
y
2*3
i<-2^3
i
x
x+3
y<-x+3
y
x
y*x
y+x
z<-1
x+z
z<-c(1, 2)
z
x+z
2>5
2<5
2<=2
x
x<=2
x[x<2]
x[x<=2]
x
any(x<=2)
all(x<=2)
x<-c(TRUE, TRUE, FALSE, FALSE)
x
y<-c(TRUE, FALSE, TRUE, FALSE)
x&y
x|y
!x
xor(x, y)
x<-c(1, 2, NA, 4)
x
x<-c(1, 2, NaN, 4)
x
x<-NULL
x
z<-3/0
z
0/0
