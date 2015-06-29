# Minimu9ahrs

 Ruby gem for reading data from the Pololu MinIMU-9 over I²C. Works on the Raspberry Pi and probably other embedded ARM Linux boards.

This gem provides bindings for the [minimu9-ahrs](https://github.com/DavidEGrayson/minimu9-ahrs) project.  At some point most of the C++ code in this will live in a library.  This is all very experimental currently.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'minimu9ahrs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minimu9ahrs

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Run 'rake compile' to build the C++ bits. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/donavan/minimu9ahrs.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

