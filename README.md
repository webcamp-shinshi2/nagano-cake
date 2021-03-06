# ながのCAKE ECサイト

DMM Webcampのチーム開発課題として作成した、長野県の洋菓子店のためのECサイト
<img width="1413" alt="スクリーンショット 2021-06-29 15 42 07" src="https://user-images.githubusercontent.com/81672054/125147990-2ea0b880-e16a-11eb-937d-76909439101e.png">

## 要件

### 背景
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。 InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

### 通販の内容
* 通販では注文に応じて製作する受注生産型。
* 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限なし。
* 送料は1配送につき全国一律800円。
* 友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送可能。
* 支払方法はクレジットカード、銀行振込から選択可能。

### 用語の定義
* 顧客：ながのCAKEの商品を購入する人(客)
* 会員：ECサイトにユーザー登録している顧客
* ECサイト：顧客が利用するサイト
* 管理サイト：店で働く事務員・パティシエ等が利用するサイト（管理者用サイト）
* ステータス
  * 注文ステータス：注文の状態遷移を表す
  * 製作ステータス：注文に紐付く注文商品の状態遷移を表す
  * 販売ステータス：商品の販売状況を表す。現状、販売中、売切れの2パターンがある。販売停止商品は「売切れ」をセットする。
  * 会員ステータス：現状、有効・退会の2パターンがある。
* ジャンル：商品の種類。現状、ケーキ、プリン、焼き菓子、キャンディの4ジャンルある。
* 注文個数：１回の注文に紐付く注文個数の合計。例）商品Aを3個、商品Bを2個注文→注文個数は5。
* 商品小計：商品単価（税込）×個数。例）1,200円（税込）の商品を2個購入＝商品小計は2,400円

### 実装機能
【会員側】
* 顧客は会員登録、ログイン・ログアウト、退会ができること
* 会員のログインはメールアドレスとパスワードで行うこと
* 会員がログインしている状態かどうか、ページのヘッダーにユーザ名を表示するなどして判断できるようにすること
* サイトの閲覧はログインなしで行えること
* 商品をカートに入れ、1度に複数種類、複数商品の購入ができること。また、カート内の商品は個数変更・削除ができること
* カートへの商品追加はログインなしでは行えないこと
* クレジットカード情報はシステム上保持しないこと
* 会員は配送先を複数登録しておくことが可能であること
* 会員はマイページから下記が行えること
  * ユーザ情報の閲覧・編集
  * 注文履歴の閲覧
  * 配送先の閲覧・編集
  * 注文履歴一覧には下記の情報が表示されること
  * 注文日
  * 配送先
  * 支払金額（商品合計＋送料）
  * 注文ステータス
* 注文履歴詳細には下記の情報が表示されること
  * 注文日
  * 配送先
  * 支払方法
  * 注文ステータス
  * 商品の注文内容詳細（商品名、単価、個数、小計）
  * 請求情報（商品合計、送料、支払金額）
* 会員登録時、下記の情報をユーザ情報として入力できること
  * 名前（姓・名）
  * 名前（カナ姓・カナ名）
  * 郵便番号
  * 住所
  * 電話番号
  * メールアドレス
  * パスワード
* 商品は税込価格で表示されること

【管理者側】
* 管理者用メールアドレスとパスワードでログインできること（管理者用メールアドレスとパスワードは事前にデータベースへ登録できていれば良い）
* 商品について、下記が行えること
  * 新規追加、編集
  * 販売停止（売切表示）
* 商品情報は下記のものを持つこと
  * 商品名
  * 商品説明文
  * ジャンル
  * 税抜価格
  * 商品画像
  * 販売ステータス
  * 会員登録されているユーザ情報の閲覧、編集、退会処理が行えること
* ユーザの注文履歴が一覧・詳細表示できること
* 注文履歴には注文ごとに下記の情報が表示されること
  * 購入者
  * 購入日
  * 購入内容
  * 請求額合計
  * 配送先
  * 注文ステータス
  * 各注文商品の製作ステータス
* 注文ステータス、製作ステータスの更新ができること
* ヘッダーには検索窓を配置するが、実際に検索はできなくてもよい。（余裕があれば、商品名や会員氏名で検索できるとよいが、必須ではないので、優先順位を下げてほしい）


## 設計概要

### ER図


![ER図](https://user-images.githubusercontent.com/81369773/122745471-fffa9500-d2c3-11eb-84c3-f26f1e3d4632.png)


### アプリケーション詳細設計図
* 会員側

![アプリ設計書（会員）](https://user-images.githubusercontent.com/81369773/122743636-1e5f9100-d2c2-11eb-824e-e3e21f89286e.png)


* 管理者側

![アプリ設計書（管理者）](https://user-images.githubusercontent.com/81369773/122743492-fe2fd200-d2c1-11eb-95cd-e256a8227b6d.png)


### 使用言語
* HTML & CSS
* JavaScript
* Ruby（2.6.3）
* Ruby on Rails（5.2.6）


## 開発者
チーム紳士： ダンディ ・ Nona ・ さかたい ・ じょー


## 開発期間
2021/06/12〜06/28
