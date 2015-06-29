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


## Reading raw values
As a first test, you should look at the raw readings from the sensors on your IMU to make sure it is OK.  Run @bin/minimu9-ahrs --mode raw@.  The output should look something like this:

<pre>
   -138     129    -416      112      -8     228      -50      14       9
   -138     129    -419      120      -4     232      -49      20      18
   -138     129    -419      116     -12     228      -51      15       8
   -138     129    -419      116     -12     228      -50      21      17
   -137     130    -421      116      -8     232      -51      22      11
   -137     130    -421      120     -12     220      -56      20      14
</pre>

*Yes, there will be noise in all the readings, even if your IMU is not moving at all.*  That is totally normal for almost any kind of sensor.

This output consists of three vectors.  From left to right they are the raw magnetometer reading, the raw accelerometer reading, and the raw gyro reading.  Each vector consists of three integers, in X-Y-Z order.  You should turn the device and make sure that the raw readings change correspondingly.  For example, when the X axis of the board is pointing straight up, the accelerometer's X reading (the 4th number on each line) should be positive and the other two components of the acceleration should be close to zero.

##Calibrating the magnetometer

The magnetometer will need to be calibrated to create a mapping from the ellipsoid shape of the raw readings to the unit sphere shape that we want the scaled readings to have.  The calibration feature for the minimu9-ahrs assumes that the shape of the raw readings will be an ellipsoid that is offset from the origin and stretched along the X, Y, and Z axes.  It cannot handle a rotated ellipsoid.  It is interesting to run @minimu9-ahrs --mode raw > output.tsv@ while moving the magnetometer and then make some scatter plots of the raw magnetometer readings in a spreadsheet program to see what shape the readings have.

The calibration is done with a shell script that pipes raw sensor readings from @minimu9-ahrs@ into a Python script.  This requires Python and SciPy..  

To calibrate, run @minimu9-ahrs-calibrate@ and follow the on-screen instructions when they tell you to start rotating the IMU through as many different orientations as possible.  Once the data is done being read, you can stop rotating the IMU and relax for about 20 minutes while the Python script figures out the optimal calibration.  The calibration will be written to the file @~/.minimu9-ahrs-cal@.

The calibration file @~/.minimu9-ahrs-cal@ is simply a one-line file with 6 numbers separated by spaces: minimum x, maximum x, minimum y, maximum y, minimum z, maximum z.  These numbers specify the linear mapping from the raw ellipsoid to the unit sphere.  For example, if "minimum x" is -414, it means that a magnetometer reading of -414 on the X axis will get mapped to -1.0 when the readings are scaled.

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Run 'rake compile' to build the C++ bits. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/donavan/minimu9ahrs.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

