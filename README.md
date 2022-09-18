# 銭湯館

![スクリーンショット 2022-09-18 10 09 33](https://user-images.githubusercontent.com/64511596/190881300-cd3d29a7-76f2-48b7-a4de-fb5c825437c2.png)

サービスURL : https://www.sentoukan.site/

---

## サービス概要：

銭湯館は近くの銭湯・サウナを検索でき、行けば行くほどサービス上のお金が稼げるというサービスです。

フードデリバリーのドライバーアプリと銭湯・サウナを掛け合わせました。

# 機能について：
## 1. マップ検索

![スクリーンショット 2022-09-18 10 18 26](https://user-images.githubusercontent.com/64511596/190881520-46312215-9e6e-4eed-ba99-210e8b27a8ae.png)


## 2. 目的地までの距離を測る

![スクリーンショット 2022-09-18 10 19 11](https://user-images.githubusercontent.com/64511596/190881528-431cb4d1-e263-40e4-8c0f-a5b810d6bd12.png)

## 3. twitterシェア

![スクリーンショット 2022-09-18 10 20 48](https://user-images.githubusercontent.com/64511596/190881530-c8365a62-20ea-4948-992c-9704bab30e65.png)


# 使用技術：

### バックエンド

Ruby 3.1.0  
Ruby on Rails 7.0.3

### フロントエンド

JavaScript  
Tailwind CSS  
Material Tailwind

### インフラ

Heroku

## 使用API
Google Maps JavaScript API（マップ検索に使用）  
Geolocation API（現在地の取得に使用）  

## 距離測定について

三平方の定理を利用しています。

現在位置の座標を(a, b)、 目的地の座標を(c,d)として、

二点間の距離を、√(c−a)2+(d−b)2 で計算しています。
