FROM ruby:3.1.2

# ライブラリのインストール
RUN apt update -qq &&  apt install -y git imagemagick libmagick++-dev sqlite3

# nodejs 16のインストール
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt install -y nodejs

# yarnのインストール
RUN npm install n -g && npm install -g yarn

# ワーキングディレクトリの設定
RUN mkdir /myapp
WORKDIR /myapp

# COPY
COPY . /myapp

# Gemfileのコピーとインストール
RUN bundle install

RUN yarn add @babel/plugin-proposal-private-methods @babel/plugin-proposal-private-property-in-object

# webpackerのコンパイルを実行
RUN rails webpacker:compile

# サーバの起動
CMD ["rails", "server", "-b", "0.0.0.0"]