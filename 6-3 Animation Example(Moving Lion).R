path = "./resource/"
count <- c(0, 0, 0)
for (n in 1:500){
  coin <- sample(c(0,1), 2, replace=T)
  
  index <- sum(coin) + 1
  count[index] <- count[index] + 1
  
  probability <- count / n
  
  title <- paste("¹Ýº¹ ¼ö: ", n, " / 500")
  
  barplot(probability,
          names.arg = c(0, 1, 2),
          xlab = "¾Õ¸éÀÌ ³ª¿Â È½¼ö",
          ylab = "È®·ü",
          col = rainbow(3),
          main = title)
  
  Sys.sleep(0.05)
}

install.packages("imager")
library(imager)

img_path <- paste(path, "roulette.png", sep = "")
img <- load.image(img_path)
plot(img)

# ·ê·¿ ÀÌ¹ÌÁö Å©±â º¯È¯
img <- resize(img, size_x = 400L, size_y = 400L)
plot(img, xlim = c(0, 400), ylim = c(0,400))
plot(img, xlim = c(0, 400), ylim = c(0,400), axes = FALSE)

# ·ê·¿ È¸Àü
rot.count <- sample(11:20, 1)
rot.count

angle <- 0
for(i in 1:rot.count){
  angle <- angle + 36
  title <- paste("·ê·¿ È¸Àü: ", i, "/", rot.count)
  
  imrotate(img,
           angle,
           cx = 200, cy = 200) %>%
    draw_circle(x = 200, y = 50, radius = 30,
                col = c(1, 0, 0, 0), opacity = 0.5) %>%
    plot(axes = FALSE, main = title)
  Sys.sleep(0.2)
}

install.packages("magick")
library(magick)

lion_bg <- image_read(paste(path, "lion_bg.png", sep = ""))
lion_1 <- image_read(paste(path, "lion_1.png", sep = ""))
lion_2 <- image_read(paste(path, "lion_2.png", sep = ""))

lion_bg <- image_scale(lion_bg, "600x300!")
lion_1 <- image_scale(lion_1, "100x50!")
lion_2 <- image_scale(lion_2, "100x50!")

print(lion_bg)
print(lion_1)
print(lion_2)

# ÀÌ¹ÌÁö ÇÕ¼º Å×½ºÆ®
img <- image_composite(lion_bg, lion_1, offset = "+0+150")
print(img)

# ÀÌ¹ÌÁö ÀÌµ¿
moving <- 0
x <- 0
y <- 150
while(TRUE) {
  if(x < 0) position <- paste(x, "+", y, sep="")
  else position <- paste("+", x, "+", y, sep="")
  
  if(moving %% 2 == 0) img <- image_composite(lion_bg, lion_1, offset = position)
  else img <- image_composite(lion_bg, lion_2, offset = position)
  
  print(img)
  Sys.sleep(0.3)
  
  if(x > 599) break
  moving <- moving + 1
  x <- x + 20
}
