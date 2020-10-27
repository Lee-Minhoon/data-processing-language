# Call Library
library(magick)

# Set Variable
table_path = "./resource/table.png"
table <- image_read(table_path)
table <- image_scale(table, "300X400!")

ball_path = "./resource/ball.png"
ball <- image_read(ball_path)
ball <- image_scale(ball, "40X40!")

x <- 0
y <- 0
xd <- TRUE
yd <- TRUE

while(TRUE)
{
  # X, Y의 위치 (공의 위치)
  position <- paste("+", x, "+", y, sep = "")
  
  # 당구대이미지에 당구공이미지를 offset위치로 합침
  img <- image_composite(table, ball, offset = position)
  
  # 이미지를 출력
  print(img)
  
  # x와 y가 움직히는 방향을 정함
  if (x == 260) xd = FALSE
  else if (x == 0) xd = TRUE
  if (y == 360) yd = FALSE
  else if (y == 0) yd = TRUE
  
  # x, y값을 바꿔줌
  if (xd) x = x + 10
  else x = x - 10
  if (yd) y = y + 10
  else y = y - 10
  
  # 대기
  Sys.sleep(0.1)
}
