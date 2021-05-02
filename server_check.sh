#!/bin/bash

url="https://my.uopeople.edu/"

# -o(output FILE)で/dev/nullにファイル出力
# -w(write-out)でhttp_codeを指定
# -s(silent)でエラー等の出力を非表示
STATUS_CODE=`curl $url -o /dev/null -w '%{http_code}\n' -s`

if [ $STATUS_CODE -ge 400 -a $STATUS_CODE -le 499 ]; then
    curl -X POST -H 'Content-type: application/json' --data "{'text': 'リクエストに失敗しました:cry:\nステータスコード: ${STATUS_CODE}'}" $SLACK_WEBHOOK_URL
elif [ $STATUS_CODE -ge 500 ]; then
    curl -X POST -H 'Content-type: application/json' --data "{'text': 'Moodle落ちてるかも:cry:\nステータスコード: ${STATUS_CODE}'}" $SLACK_WEBHOOK_URL
fi
