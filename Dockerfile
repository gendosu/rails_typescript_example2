FROM ruby:2.7.4-buster as base

# -------------
# for Ruby
# -------------

ENV RUBY_MAJOR 2.7
ENV RUBY_VERSION 2.7.4

ENV PATH "/.nodenv/bin:/.nodenv/shims:$PATH"
ENV NODENV_ROOT "/.nodenv"

# install things globally, for great justice
# and don't create ".bundle" in all our apps
ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME"
ENV BUNDLE_SILENCE_ROOT_WARNING=1
ENV BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH=/app/bin:$GEM_HOME/bin:$BUNDLE_PATH/gems/bin:$PATH

RUN apt-get update \
  &&  apt-get install -y --allow-change-held-packages \
  locales \
  vim \
  cmake \
  gconf-service \
  glib-networking \
  fonts-liberation \
  libgtk-3-0 \
  libappindicator1 \
  libappindicator3-1 \
  graphviz \
  && locale-gen ja_JP.UTF-8 \
  && echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc \
  && echo "set mouse-=a" >> /root/.vimrc \
  && localedef -f UTF-8 -i ja_JP ja_JP.utf8 \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# -------------
# for Node
# -------------

RUN git clone https://github.com/nodenv/nodenv.git /.nodenv

RUN mkdir -p "$(nodenv root)"/plugins

RUN git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build

RUN nodenv install 16.13.1

RUN nodenv global 16.13.1

RUN npm install -g yarn

RUN nodenv rehash

ENV PATH "/app/bin:/app/node_modules/.bin:/root/.bundle/bin:$PATH"

WORKDIR /app

