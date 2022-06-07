# 1 使用するライブラリとデータの作成

## 1.1 ライブラリ
install.packages("dplyr") 
library(dplyr)

## 1.2 データの作成
set.seed(1)
数学 <- round(rnorm(10, 50, 10)) # 数学~N(50,10)
英語 <- round(rnorm(10, 50, 10)) # 英語~N(50,10)
クラス <- rbinom(10, 1, 0.5) # クラス~B(1,0.5), クラス~Be(0.5)
data <- data.frame(数学, 英語, クラス) # データフレーム作成
data # データ確認



# 2 データの確認

## 2.1 上からいくつか確認
head(data) 
head(data,5) # 上から5個
data %>% head(5) # パイプ演算子

## 2.2 ランダムにいくつか確認
data %>% sample_n(5) # ランダムに5個 



# 3 パイプ演算子の利用
data %>%
  select(数学, クラス) %>% # カラム選択
  filter(数学>50) %>% # 条件
  mutate(数学z=scale(数学)) %>% # 新しい列追加
  mutate(数学=数学-2) %>% # 既存データの変更
  mutate(クラス=ifelse(クラス==1, "A", "B")) %>% # ifelse(条件, TRUE, FALSE)
  arrange(数学) %>% # 昇順
  arrange(desc(数学)) %>% # 降順
  rename(英語=数学) %>% # カラム名変更
  group_by(クラス)  %>% # グループ分け
  summarise(英語m=mean(英語), 英語s=sum(英語)) # 集計



# 4 データの格納
data_new <- data %>%
  select(数学, クラス) %>% # カラム選択
  filter(数学>50) %>% # 条件
  mutate(数学z=scale(数学)) %>% # 新しい列追加
  mutate(数学=数学-2) %>% # 既存データの変更
  mutate(クラス=ifelse(クラス==1, "A", "B")) # ifelse(条件, TRUE, FALSE)
data_new %>% head()


