#!/bin/bash

url="https://my.uopeople.edu/"

curl -I $url > check # -Iでヘッダーのみ出力しcheckに出力

# grep HTTP check の出力 サーバーが正常な場合 HTTP/1.1 200 OK
# awk '{print $2}'で2番目の200を取得
STATUS_CODE=`grep HTTP check | awk '{print $2}'`

if [ $STATUS_CODE -ne 200 ];then
    curl -X POST -H 'Content-type: application/json' --data "{'text': 'Moodle落ちてます:cry:\nステータスコード: ${STATUS_CODE}'}" $SLACK_WEBHOOK_URL
else
    # テストのために一旦出力
    curl -X POST -H 'Content-type: application/json' --data "{'text': '正常です。\nステータスコード: ${STATUS_CODE}'}" $SLACK_WEBHOOK_URL
fi
