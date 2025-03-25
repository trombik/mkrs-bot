# Telegram

The core feature of the application, the telegram bot.

## Telegram::Bot

* `bundle add telegram-bot`
* [The official GitHub repository](https://github.com/telegram-bot-rb/telegram-bot)
* [An example bot application](https://github.com/telegram-bot-rb/telegram-bot/)

### Secrets and API tokens

Use `rails credentials:edit` to keep API tokens.

See [Securing Rails Applications](https://guides.rubyonrails.org/security.html).

```console
rails credentials:edit --environment ${RAILS_ENV}
```

The content of the credential for an environment should look like:

```yaml
---
telegram:
  bot:
    token: API_TOKEN
    username: Bot
  bots:
    default:
```

## Links

* [Telegram bot documentation](https://core.telegram.org/bots)
* [Telegram Bot Features](https://core.telegram.org/bots/features)
