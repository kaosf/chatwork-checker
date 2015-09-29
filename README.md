# Chatwork Checker

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

```sh
heroku config:set \
  BASIC_AUTH_USERNAME=username-for-basic-auth \
  BASIC_AUTH_PASSWORD=password-for-basic-auth \
  CHATWORK_API_TOKEN=0123456789abdefg0123456789abcdef
```

## When you forget BASIC auth information

```sh
heroku config:get BASIC_AUTH_USERNAME
heroku config:get BASIC_AUTH_PASSWORD
```

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright (C) 2015 ka
