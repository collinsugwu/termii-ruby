# TermiiRuby
A Ruby gem for integrating Termii api [termii.com](termii.com)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'termii_ruby', '~> 0.1.1'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install termii_ruby

## Usage

## Token
Initialize the token object
```
token = TermiiRuby::Token.new(ENV["TERMII_API_KEY"])
```
Send OTP

to: phone number

from: sender id
```
otp = token.send_otp_token(to, from, message_text)
```
Send Voice Token

```
voice_token = token.send_voice_token(phone_number)
```

Send Voice Call

```
voice_call = token.send_voice_call(phone_number, code)
```

Send In App Token

```
in_app_token = token.send_in_app_token(phone_number)
```

Verify Token
```
verify = token.verify(pin_id, token)
```

## Sender
Initialize the Sender object
```
sender = TermiiRuby::Sender.new(ENV["TERMII_API_KEY"])
```
Fetch Senders
```
fetch_senders = sender.fetch_senders
```
Create Senders
```
create_sender = sender.create_sender(sender_id, usecase, company)
```

## Insight
Initialize the Insight object
```
insight = TermiiRuby::Insight.new(ENV["TERMII_API_KEY"])
```
Fetch Balance
```
balance = insight.balance
```
Search
```
search = insight.search(phone_number)
```
Status
```
status = insight.status(phone_number)
```
History
```
history = insight.history
```
## Available getters and setters for all objects
```
    message_type  <String>
    pin_type <String>
    channel <generic>
    pin_attempts <Integer>
    pin_length <Integer>
    pin_time_to_live <Integer>
    pin_placeholder <String>
    country_code <String>

```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/collinsugwu/termii_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/collinsugwu/termii_ruby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TermiiRuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/collinsugwu/termii_ruby/blob/master/CODE_OF_CONDUCT.md).
