## How to use

It takes two arguments to run.
   First argument: Monitored file name
   Second argument: command executed when the monitored file is updated

実行するには2個の引数が必要です。  
  第一引数: 監視対象ファイル名  
  第二引数: 監視対象ファイルが更新された際に実行されるコマンド  

### Docker command sample

Detect local file updates and copy to AWS S3 Bucket.

First argument: ```/tmp/hoge```  
Second argument: ```aws s3 cp /tmp/hoge s3://****/hoge```  

```docker run --rm -it -e AWS_ACCESS_KEY_ID=**** -e AWS_SECRET_ACCESS_KEY=**** -e AWS_DEFAULT_REGION=****  filewatch:latest  /tmp/hoge 'aws s3 cp /tmp/hoge s3://****/hoge'```
