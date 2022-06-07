# 1 使用するライブラリとデータの作成

## 1.1 ライブラリ
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

## 1.2  データの作成
set.seed(1)
数学 <- round(rnorm(100, 50, 10)) # 数学~N(50,10)
英語 <- round(rnorm(100, 50, 10)) # 英語~N(50,10)
クラス <- rbinom(100, 1, 0.5) # クラス~B(1,0.5), クラス~Be(0.5)
data <- data.frame(数学, 英語, クラス) # データフレーム作成
head(data) # データ確認



# 2 データの可視化

## 2.1 ヒストグラム
data %>%
  ggplot(aes(数学)) + # 軸を指定
  geom_histogram() # ヒストグラム

## 2.2 散布図
data %>% 
  ggplot(aes(数学, 英語)) + # 軸を決定
  geom_point() # 散布図



# 3 データを綺麗にプロット
data %>%
  ggplot(aes(数学, 英語)) + # 軸を指定
  geom_point() + # 散布図
  theme_classic(base_family = "HiraKakuPro-W3") + # テーマと文字化け修正(macの場合)
  #theme_bw(base_family = "HiraKakuPro-W3") + # 別のテーマ例
  theme(text=element_text(size=30)) + # テキストサイズ
  lims(x=c(0,100), y=c(0,100)) + # 軸の範囲
  #xlim(0,100) + # 軸の範囲は個別でも指定できるが１行上の方が楽
  #xlab("数学の点数")+ # 軸の名前も個別で指定できるが１行下の方が楽
  labs(x="数学の点数", y="英語の点数", title="テストの点数") # タイトルと軸



# 4 データをグループごとにプロット

# 4.1 グループごと
data %>%
  mutate(クラス=as.character(クラス)) %>% # クラスを数値から文字に変更
  ggplot(aes(数学, 英語, col=クラス)) + # 軸とグループを指定
  geom_point() + # 散布図
  theme_classic(base_family = "HiraKakuPro-W3") + # テーマと文字化け修正(macの場合)
  theme(text=element_text(size=30)) + # テキストサイズ
  lims(x=c(0,100), y=c(0,100)) + # 軸の範囲
  labs(x="数学の点数", y="英語の点数", title="テストの点数") # タイトルと軸

# 4.2 グループごと2
data %>%
  ggplot(aes(数学, 英語)) + # 軸を指定
  geom_point() + # 散布図
  theme_classic(base_family = "HiraKakuPro-W3") + # テーマと文字化け修正(macの場合)
  theme(text=element_text(size=30)) + # テキストサイズ
  lims(x=c(0,100), y=c(0,100)) + # 軸の範囲
  labs(x="数学の点数", y="英語の点数", title="テストの点数") + # タイトルと軸
  #facet_grid(~クラス) + # 対象のグループ指定
  facet_wrap(~クラス) # 対象のグループ指定



# 5 データフレームでない場合のプロット
ggplot() + 
  geom_point(aes(数学, 英語), col="blue", size=3) + # 軸と色(col)とサイズ(size)指定
  geom_histogram(aes(数学), binwidth = 30, fill="blue", alpha=0.3) # 横幅(binwidth)と色(fill)と薄さ(alpha)指定



