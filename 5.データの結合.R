# 1 使用するライブラリとデータ作成

## 1.1 ライブラリ
install.packages("dplyr") # 一度もインストールしていない場合
library(dplyr)

## 1.2 データ
Id1 <- c(1,2,3)
Height <- c(150,160,170)
dataA <- data.frame(Id1, Height) 
Id2 <- c(1,3,5)
Weight <- c(50,60,70)
dataB <- data.frame(Id2, Weight) 
Id1 <- c(4,5,6)
Height <- c(160,150,170)
dataC <- data.frame(Id1, Height) 
dataA ; dataB ; dataC



# 2 bind系

## 2.1 rbind (bind系)
data1 <- rbind(dataA, dataC)
dataA ; dataC ; data1

## 2.2 cbind (bind系)
data2 <- cbind(dataA, dataB)
dataA ; dataB ; data2



# 3 join系

## 3.1 left_join (join系)
data3 <- left_join(dataA, dataB, by=c("Id1"="Id2"))
dataA ; dataB ; data3

## 3.2 right_join (join系)
data4 <- right_join(dataA, dataB, by=c("Id1"="Id2"))
dataA ; dataB ; data4

## 3.3 full_join (join系)
data5 <- full_join(dataA, dataB, by=c("Id1"="Id2"))
dataA ; dataB ; data5

