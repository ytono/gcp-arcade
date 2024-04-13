# 上位イメージとして正式な Node ランタイムを使用します
FROM node:lts

# コンテナの作業ディレクトリを /app に設定します
WORKDIR /app

# 現行ディレクトリの内容を /app のコンテナにコピーします
ADD . /app

# コンテナのポート 80 を外部からアクセスできるようにします
EXPOSE 80

# コンテナの起動時に Node を使用して app.js を実行します
CMD ["node", "app.js"]
