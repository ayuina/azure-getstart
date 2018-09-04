# ハンズオン環境の構築

本ドキュメントはハンズオンを実施するために必要な環境を構築するための説明資料です。

## 前提環境

Windows 10 クライアントをご用意ください。


## Linux シェル環境 のインストール

ハンズオンでは Linux シェルを使用したり、Azure 仮想マシンへ SSH 接続をする必要があります。
ここでは Windows Subsystem for Linux および Ubuntu 環境をインスールして利用します。

### Windows Subsystem for Linux のインストール

まず **Windows の機能の有効化または無効化** より Windows Subsystem for Linux をインストールします。

![WSLのインストール](./image/install-wsl.png)

インストールが完了したら機能を有効にするために一度 Widnwos を再起動してください。

### Windows Subsystem for Linux のインストール

続いて Microsoft ストアから 
[Ubuntu をインストール](https://www.microsoft.com/store/productId/9NBLGGH4MSV6)
します。

![Ubuntu のインストール](./image/install-ubuntu.png)

インストール完了後に Ubuntu を起動すると、管理者のユーザー名とパスワードを入力してください。

### 補足
より詳細な手順が必要な場合は
[こちら](http://www.atmarkit.co.jp/ait/articles/1608/08/news039.html)
などをご参照ください。


## Git クライアントのインストール

ハンズオンで使用する手順書やアプリケーションのソースコードは GitHub に格納されていますので、
[Git for Windows](https://gitforwindows.org/) 
をインストールしておくと便利です。
インストールウィザードで表示される選択肢は全て既定のオプションで構いません。

インストールが完了したら PowerShell やコマンドプロンプトから Git コマンドが実行できることを確認します。

![Git Version](./image/git-installed.png)

VSCおｄ
### ハンズオン資源のダウンロード

ハンズオン資源一式はローカルにダウンロードしておくとよいでしょう。PowerShell やコマンドプロンプトでデスクトップ等の作業フォルダに移動し、以下のコマンドを実行します。

```
PS > git clone https://github.com/ayuina/azure-getstart
```

Clone コマンドの完了後、リポジトリ名のサブディレクトリの中身を確認してダウンロードされていることを確認します。

![リポジトリのクローン](./image/git-clone.png)

### 補足
インストール方法、Git コマンド、GitHub についてより詳細な手順や解説が必要な場合は
[こちら](http://www.atmarkit.co.jp/ait/articles/1603/31/news026.html)
などが参考になるでしょう。

## コンテナ環境のインストール

サンプルアプリケーションを Docker コンテナ上で動作させることも出来ますので、
[Docker for Windows](https://docs.docker.com/docker-for-windows/)
もインストールしておくと良いでしょう。



## 統合開発環境のインストール

ハンズオンでは基本的にアプリケーションのソースコードそのものは扱いませんが、ファイルの参照や修正のためにテキストエディタがあると良いでしょう。
ここでは
[Visual Studio Code](https://code.visualstudio.com/)
 を利用することにします。

![VSCodeのインストール](./image/install-code.png)

インストールオプションは既定値のままでも構いませんが、Windows エクスプローラでファイルやフォルダのコンテキストメニューから VSCode で開けるようにしておくと便利です。

先ほど GitHub レポジトリからクローンしたフォルダを VSCode で開くと以下のようになります。
![VSCodeで開く](./image/open-repo-with-code.png)

VSCode の統合ターミナルを開くと PowerShell が使用でき、そこからこれまでインストールしてきた  Bash、Git、Docker を起動することが可能になります。
