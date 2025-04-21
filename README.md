# HexletCode

[![CI](https://github.com/So1que/rails-project-63/actions/workflows/lint.yml/badge.svg)](https://github.com/So1que/rails-project-63/actions/workflows/lint.yml)
[![hexlet-check](https://github.com/So1que/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/So1que/rails-project-63/actions/workflows/hexlet-check.yml)

TODO: Delete this and the text below, and describe your gem

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet_code`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install hexlet_code
```

## Usage

### Basic Form

Create a basic form for your object:

```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new(name: 'rob', job: 'hexlet')

# Generate an empty form
HexletCode.form_for user do |f|
end
# => "<form action='#' method='post'></form>"

# Add form attributes
HexletCode.form_for user, class: 'user-form' do |f|
end
# => "<form action='#' method='post' class='user-form'></form>"

# Specify a form URL
HexletCode.form_for user, url: '/users' do |f|
end
# => "<form action='/users' method='post'></form>"
```

### Form Fields

Add input fields to your form:

```ruby
# Add text inputs
HexletCode.form_for user do |f|
  f.input :name
  f.input :job
end
# => "<form action='#' method='post'><input name='name' type='text' value='rob'><input name='job' type='text' value='hexlet'></form>"

# Add a textarea
HexletCode.form_for user do |f|
  f.input :job, as: :text
end
# => "<form action='#' method='post'><textarea name='job' cols='20' rows='40'>hexlet</textarea></form>"

# Customize field attributes
HexletCode.form_for user do |f|
  f.input :name, class: 'user-input'
  f.input :job, as: :text, rows: 50, cols: 50
end
# => "<form action='#' method='post'><input name='name' type='text' value='rob' class='user-input'><textarea name='job' cols='50' rows='50'>hexlet</textarea></form>"
```

Note: Attempting to use a field that doesn't exist on the object will raise a `NoMethodError`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
