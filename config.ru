require 'dotenv'
Dotenv.load

require 'sinatra'

use Rack::Auth::Basic do |username, password|
  username == ENV['BASIC_AUTH_USERNAME'] && password == ENV['BASIC_AUTH_PASSWORD']
end

require 'net/https'
require 'json'
uri = URI.parse 'https://api.chatwork.com/v1/my/status'
https = Net::HTTP.new(uri.host, uri.port)
https.use_ssl = true
req = Net::HTTP::Get.new(uri.path)
req['Content-Type'] = 'application/json'
req['X-ChatworkToken'] = ENV['CHATWORK_API_TOKEN']

run Sinatra::Application

get '/' do
  res = https.request(req)
  rate_limit_remaining = res.header['X-RateLimit-Remaining']
  body = JSON.parse(res.body)
  unread_room_num = body['unread_room_num']
  unread_num = body['unread_num']
  emphasis = (unread_num > 0 ? 'style="color: red"' : '')
<<EOS
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <meta content="width=device-width" name="viewport">
  <title>Chatwork Checker</title>
</head>
<body>
Result at: #{ENV['TZ'] = 'Asia/Tokyo'; Time.now}<br>
API rate limit remaining: #{rate_limit_remaining}<br>
<span #{emphasis}>Unread room num: #{unread_room_num}</span><br>
<span #{emphasis}>Unread num: #{unread_num}</span><br>
<div
  id="reloadbutton"
  style="
    border: 2px solid black;
    margin-top: 50px;
    padding: 50px;
    background: #ddd;
    font-size: 150%;"
  onclick="
    document.getElementById('reloadbutton').innerHTML='Please wait ...';
    location.reload();
  "
>TAP HERE TO RELOAD</div>
</body>
</html>
EOS
end
