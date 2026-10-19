# Horse Diary（乗馬記録アプリ）

乗馬のレッスン内容や気づきを、スマホから手軽に記録・振り返りできるアプリです。

<!-- ここに完成後のスクリーンショットを入れる -->

## 作った理由

乗馬を習う中で、レッスンで教わったことや馬ごとの癖をすぐに忘れてしまい、紙のメモでは後から振り返りにくいと感じていました。<br>
レッスン直後に手軽に記録し、練習の過程を振り返れるようにしたいと考え、このアプリを作りました。

## 公開URL

<!-- デプロイ後に記載する -->

## 成果物（上流工程）

| 工程 | 成果物 |
| --- | --- |
| 要件定義 | [要件定義書（Googleドキュメント）](https://docs.google.com/document/d/1wTYUM-btG6RvFGCxhLJLUXIdx032MmhcjXQ4vmG1CKw/edit?usp=sharing) |
| 画面設計 | [ワイヤーフレーム（Figma）](https://www.figma.com/design/VdpCxqZeHB5PyJsPZRYDBw/horse-diary-%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0-%E6%8F%90%E5%87%BA%E7%94%A8?node-id=5-53&t=hFaiOX9HZihqc02b-1) |
| DB設計 | [ER図（Figma）](https://www.figma.com/board/8EnVQThdqeGWsFMjWMEEgy/horse-diary-ER%E5%9B%B3--%E6%8F%90%E5%87%BA%E7%94%A8-?t=cKTlQR5Eu2wpzY1y-1) |
| テーブル設計 | [テーブル定義（Figma）](https://www.figma.com/board/sEJCDAD7JHi8UWRlVqWtma/horse-diary-%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9-%E6%8F%90%E5%87%BA%E7%94%A8?t=cKTlQR5Eu2wpzY1y-1) |

## 主な機能

- ユーザー登録・ログイン、プロフィール設定
- レッスン記録の作成・編集・削除
- レッスン履歴の一覧表示・検索
- 馬・講師の登録・編集・削除
- 馬・講師ごとのレッスン回数と記録の表示

## 使用技術

- Ruby 3.4
- Ruby on Rails 8.1
- PostgreSQL
- importmap
<!-- デプロイ先（例：Render） -->

## 工夫した点

- 操作に不慣れな方でも迷わず使えるよう、1画面の情報量を絞ったシンプルな画面設計にしました
- 登録済みの馬・講師や、レッスン内容（並足・軽速歩・速歩など）をワンタップで選べるようにし、少ない操作で記録できるようにしました
- 厩舎やレッスン直後など、その場ですぐ記録できるよう、最初からスマホ画面で設計しました
- 要件定義・画面設計・ER図を先に作成し、作るものを明確にしてから実装に入りました

## 今後の改善予定

- 他ユーザーのレッスン記録の閲覧、いいね・コメント機能
- レッスン記録の公開・非公開設定
- ユーザーのフォロー機能
