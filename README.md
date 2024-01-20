# README

## 動かし方
1. ```git clone git@github.com:Fkinds/neo_nagano_cake.git```
2. ```docker compose build --no-cache```
3. ```docker compose up```
4. 以下のどちらかにアクセスする  
    http://localhost:3000/  
    http://127.0.0.1:3000/  

## タイトルと概要、URL
neo-nagano-cake

ケーキ屋さんのECサイトです。

- アピールポイント  
Rubocoopを用いてコードの保守性を改善しました。  
正規表現を用いてadminとcustomerのヘッターの表示するコード量を削減した。  
退会機能は、deiveseの機能をオーバーライドすることでコード量を削減した。  
製作ステータスのステータス処理をメソッドを持ちてコード量を削減した。  

## 使用技術
- Ruby 3.1.2
- Ruby on Rails 6.1.7
- docker/docker-compose

## ER図とテーブル定義書とアプリケーション詳細設計
- ER図  
https://app.diagrams.net/#G1s6yQVijwNchukTMIqWTfu6oIj0kgIMhN

- テーブル定義書  
https://docs.google.com/spreadsheets/d/16FWndn2HlmJ6UH6jUrJyhyGsZO87V5SD/edit#gid=136342688

- アプリケーション詳細設計  
https://docs.google.com/spreadsheets/d/1oSr2806jZ4PShUS6n6gdd8BH0K6PohKHjfz1WkSJDFA/edit#gid=755621295

## 機能一覧
- 認証機能(deivse)
- ログインユーザのアカウント管理機能
- 商品登録機能
- カート機能
- 配送先機能
- 注文機能
- 検索機能
- ジャンル検索機能

