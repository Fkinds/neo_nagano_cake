# お菓子屋さんECサイト「nagano-cake」  

## 製品概要  
田舎町に存在する個人経営のケーキ屋さんを意識して作りました。  

このECサイトは、田舎で個人経営を行っているケーキ屋さんの売り上げを伸ばすために作成しました。商品の販売状態や、注文確定した後の制作状況などが確認できるようになっています。
また、複数の住所を登録できることで配送先を自由に指定できます。ジャンル毎に検索ができるため商品の絞り込みを迅速に行うこともで来ます。

## 背景(開発のきっかけ、課題等)  

近年流行りのSNSやInstagramなどに商品の写真を載せたことで人気となり、全国各地から注文が来るようになった。SNSやInstagramなどのDMやメールで販売の注文を受けていたが、顧客情報の管理が煩雑となってきため、管理機能を含んだECサイトを開設しようと思い作成を行った。

UI/UX設計がお客様に対してとても親切な設計になっているとは言えないため、reactを用いて改善を行う予定
特に、改善に当たりスマートフォンでも使用可能なようにしたい。

## 使用技術
- Ruby 3.1.2
- css(bootstrap) 4.6.2
- Ruby on Rails 6.1.7
- docker/docker-compose
- Rubocop(Lint)

## ER図とテーブル定義書とアプリケーション詳細設計
- ER図  
https://drive.google.com/file/d/1hCt25UBemdSDUC-xFfWmzfBpXiDXQ9f3/view

- テーブル定義書  
https://docs.google.com/spreadsheets/d/16FWndn2HlmJ6UH6jUrJyhyGsZO87V5SD/edit#gid=136342688

- アプリケーション詳細設計  
https://docs.google.com/spreadsheets/d/1oSr2806jZ4PShUS6n6gdd8BH0K6PohKHjfz1WkSJDFA/edit#gid=755621295

## 機能一覧
### 顧客側  
- ログイン機能  
メールアドレス、パスワードでログインできる。  
ログイン時のみ利用できる機能が利用できるようになる。  
![Alt text](./pic/customer_login.png)  
![Alt text](./pic/top.png)  

- ログアウト機能   
ログインしている状態からログアウト状態にする。  
ログイン時のみ利用できる機能が利用できなくなる。  
![Alt text](./pic/customer_logout.png)  

- 商品一覧表示機能  
商品を一覧表示する。  
![Alt text](./pic/customer_items.png)  


- 商品詳細情報表示機能  
商品一覧画面で選択した商品の詳細情報を表示する。  
カート機能が表示されている。   
![Alt text](./pic/customer_item_show.png)  

- カート機能   
カートに商品を追加することができる。   
カートの中身を一覧表示することができる。  
カートの中身の個数を編集したり、削除したりすることができる。  
![Alt text](./pic/cart_item-1.png)  

- 注文機能  
カートの中身の購入をすることができる。  
支払方法や発送先を設定することができる。  
![Alt text](./pic/order.png)  
![Alt text](./pic/order_new.png)  

- 会員情報編集機能  
登録している情報を編集することができる。  
![Alt text](./pic/customer_edit.png)  

- 退会機能   
退会手続きをすることができる。  
![Alt text](./pic/is_deleted.png)  

- 配送先追加・編集機能   
登録している配送先を一覧で確認することができる。  
配送先の新規追加・修正・削除をすることができる。  
![Alt text](./pic/address.png)  

- 注文履歴機能  
過去の注文概要を一覧で確認することができる。  
注文の詳細（注文商品や個数など）を確認することができる。
![Alt text](./pic/order_show.png)  
![Alt text](./pic/order_index.png)  

### 管理者  
- ログイン機能  
メールアドレス、パスワードでログインできる。  
ログイン時のみ利用できる機能が利用できるようになる。  
![Alt text](./pic/admin_login.png)  

- ログアウト機能   
ログインしている状態からログアウト状態にする。  
ログイン時のみ利用できる機能が利用できなくなる。  

- 注文履歴機能  
過去の注文概要を一覧で確認することができる。  
注文の詳細（注文商品や個数など）を確認することができる。  
注文ステータス、製作ステータスを変更することができる。   
![Alt text](./pic/admin_order_index.png)  
![Alt text](./pic/admin_order_details.png)  

- 顧客機能  
顧客情報を一覧で確認することができる。  
顧客の詳細情報を確認することができる。  
顧客のステータス（有効/退会）を切り替えることができる。  
![Alt text](./pic/admin_customer_index.png)  
![Alt text](./pic/admin_customer_show.png)  
![Alt text](./pic/admin_customer_edit.png)  

- 商品一覧表示機能   
登録商品を一覧で確認することができる。  
![Alt text](./pic/admin_items.png)  

-  商品詳細情報表示機能  
商品の詳細情報を確認することができる。  
![Alt text](./pic/admin_item_show.png)  

- 商品情報変更機能  
商品の登録情報を変更することができる。  
販売ステータスを変更することができる。  
![Alt text](./pic/admin_item_edit.png)  

- ジャンル設定機能  
ジャンルの追加・変更を行うことができる。  
![Alt text](./pic/admin_genre.png)  

## 動かし方
1. ```git clone git@github.com:Fkinds/neo_nagano_cake.git```
2. ```docker compose build --no-cache```
3. ```docker compose up```
4. 以下のどちらかにアクセスする  
    http://localhost:3000/  
    http://127.0.0.1:3000/  

- 顧客側として  
1.リンクにアクセスして「nagano-cake」のサイトに移動する。  
    http://localhost:3000
2. 新規登録ボタンを押し、新規登録を行う。
3. 顧客としての機能がご確認いただけます。

- 管理者側として  
1. リンクよりwebアプリにアクセス
    http://localhost:3000/admins/sign_in
2. 次の試用アカウントでサインイン
 ```
 mail: test@test
 password: password
 ```
3. 顧客としての機能がご確認いただけます。  

注力したこと(こだわり等)  
- deviseのメソッドであるactive_for_authtication!をcustomer.rbでオーバーライドすることで退会機能のコード量を削減した。  
- adminとcustomerのヘッダー表示のコード量を正規表現を用いて削減した。
- .injectメソッドなど使用できるメソッドは、極力使用するようにしてコード量を削減した。  
- Rubocopを用いてコーディングスタイルを統一し、コードの保守性を意識した。　　

