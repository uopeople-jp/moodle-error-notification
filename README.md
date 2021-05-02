# server-down-notification

### 概要
moodleのサーバーにリクエストを送りステータスコードが400番台、500番台の時にSlackに通知するアプリ

### 実行方法
GitHub Actionsで定期実行を設定

設定ファイルは.github/workflows/schedule.ymlを参照

### 出力例
- 400 Bad Requestの時
<img width="1354" alt="スクリーンショット 2021-05-02 14 53 56" src="https://user-images.githubusercontent.com/59118646/116803990-4e0dda80-ab56-11eb-9d53-f2489c4fb6c5.png">

- 500 Internal Server Errorの時
<img width="1354" alt="スクリーンショット 2021-05-02 14 55 19" src="https://user-images.githubusercontent.com/59118646/116804014-71d12080-ab56-11eb-9386-40c40586dc68.png">

