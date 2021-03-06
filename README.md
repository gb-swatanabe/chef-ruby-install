chef cookbooks for ruby install
===============================

## レシピ

* ruby
  * tarballからのrubyインストール

## 使い方

必要なgemはGemfileに記述してあります

```
$ cd chef-ruby-install
$ bundle install --path=vendor/bundle
$ bundle exec knife solo init .
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

### その他

/opt/rubyのsymlinkは手動で

```
$ cd /opt
$ sudo ln -s ruby-X.X.X ruby
```
