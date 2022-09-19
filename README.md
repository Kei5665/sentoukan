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

## 3. 報酬獲得とtwitterシェア

![スクリーンショット 2022-09-18 14 45 57](https://user-images.githubusercontent.com/64511596/190910577-c6a3afe0-dc15-407e-a292-7b1f80c108c7.png)

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

二点間の距離は、大円距離の計算式としてVincenty法を利用しています。

φ1,λ1とφ2,λ2をそれぞれ点1と点2の緯度と経度とする。また、Δφ,Δλはその差の絶対値である。

![8d1fd4f0e438bb74d249c7e552e2e419ceb84a17](https://user-images.githubusercontent.com/64511596/190977895-5ffde18c-a937-4d00-810b-4ae9af6fffd3.svg)



