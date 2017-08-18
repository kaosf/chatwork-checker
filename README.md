# Chatwork Checker

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

```sh
heroku config:set \
  CHATWORK_API_TOKEN=0123456789abdefg0123456789abcdef \
  SECRET_PATH=yourrandomstringABCxyz0123456789
```

## When you forget the `SECRET_PATH`

```sh
heroku config
```

## Development

Edit `.env` like following:

```
CHATWORK_API_TOKEN=0123456789abcdef0123456789abcdef
SECRET_PATH=abc
```

Run the following commands:

```
bundle install
rackup
# or
bundle install --path vendor/bundle
bundle exec rackup
```

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright (C) 2015-2017 ka
