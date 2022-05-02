##### steps

github登録前の手順
- mkdir rails_typescript_example2
- cd rails_typescript_example2
- git init
- git commit --allow-empty -m "init"
- git remote add origin HEAD
- git push -u origin HEAD

Dockerfile関連のファイルを作成する
- [add first docker files](https://github.com/gendosu/rails_typescript_example2/commit/582622184f4a918acccae71cb4cc83bd20d1aef7)

Gemfileの作成
- docker-compose run --rm app bundle init  
  [add Gemfile](https://github.com/gendosu/rails_typescript_example2/commit/de2bd9d1bc2e426cbc1538
- [Gemfileにgem 'rails'をを追加](https://github.com/gendosu/rails_typescript_example2/commit/6d8d7b1166fad5b0818649728e3a13b9f9e7c68d)

bundle install実行
- docker-compose run --rm app bundle install  
  [bundle install](https://github.com/gendosu/rails_typescript_example2/commit/e93bf527673de370456088b8c46ab703f05365e3)

dockerコンテナの設定
- [docker-compose up時にアタッチ状態にするための設定追加](https://github.com/gendosu/rails_typescript_example2/commit/7c2230a40d397e2390c8858fbb2074881f33fb3a)

dockerコンテナ起動
- docker-compose up app

別のコンソールでdockerコンテナに接続して作業
- docker-compose exec app bash  
- docker-compose exec app bundle exec rails new rails_typescript_example2 --database=postgresql --webpack=react
