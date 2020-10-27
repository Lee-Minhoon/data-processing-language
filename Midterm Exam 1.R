# Call Library
library(magick)

# Set Variable
pool_path = "./resource/pool.png"
pool <- image_read(pool_path)
pool <- image_scale(pool, "300X400!")

ball_path = "./resource/ball.png"
ball <- image_read(ball_path)
ball <- image_scale(ball, "40X40!")

x <- 0
y <- 0
xd <- TRUE
yd <- TRUE

while(TRUE)
{
  # X, Y�� ��ġ (���� ��ġ)
  position <- paste("+", x, "+", y, sep = "")
  
  # �籸���̹����� �籸���̹����� offset��ġ�� ��ħ
  img <- image_composite(pool, ball, offset = position)
  
  # �̹����� ���
  print(img)
  
  # x�� y�� �������� ������ ����
  if (x == 260) xd = FALSE
  else if (x == 0) xd = TRUE
  if (y == 360) yd = FALSE
  else if (y == 0) yd = TRUE
  
  # x, y���� �ٲ���
  if (xd) x = x + 10
  else x = x - 10
  if (yd) y = y + 10
  else y = y - 10
  
  # ���
  Sys.sleep(0.1)
}