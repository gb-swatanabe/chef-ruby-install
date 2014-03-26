chef cookbooks
==============

## レシピ

* ruby
  * tarballからのrubyインストール

## 使い方

必要なgemはGemfileに記述してあります

```
$ cd chef
$ bundle install --path=vendor/bundle
```

### 対象の準備

仮に対象サーバ名を`server1`とする

```
$ cp nodes/server_name.json_example nodes/server1.json
$ bundle exec knife solo prepare server1
```

* `server1`の名前でsshログインできるよう`~/.ssh/config`を記述しておくこと
* ログインユーザは`server1`上でsudo権限を持っていること
  * sudo時にパスワードが必要な場合は、`knife solo`実行時にプロンプトが表示されるのでそこで入力する

### Rubyのインストール

```
$ bundle exec knife solo cook server1
```
