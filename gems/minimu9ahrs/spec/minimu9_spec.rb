require 'spec_helper'

def test_i2c_device
  return ENV['MINIUM_TEST_DEVICE'].nil? ? '/dev/i2c-1' : ENV['MINIUM_TEST_DEVICE']
end

describe Minimu9ahrs::MinIMU9 do
  clazz = Minimu9ahrs::MinIMU9

  describe 'class level' do
    it 'requires an I2C bus device to initialize' do
      # TODO: Revisit this to find a workaround for Rice not mapping constructors to initialize
      # expect(clazz.instance_method(:initialize).arity).to eq(1)
      skip 'Constructor not mapped to initialize and no initialize written yet'
    end
  end

  describe 'instance level' do
    before(:all) do
      @minimu= clazz.new(test_i2c_device)
    end

    it 'has an enable function' do
      expect(@minimu).to respond_to(:enable)
    end

    it 'has a function to read the magnetometer' do
      expect(@minimu).to respond_to(:readMag)
    end

    it 'has a function to read the accelerometer' do
      expect(@minimu).to respond_to(:readAcc)
    end

    it 'has a function to read the gyro' do
      expect(@minimu).to respond_to(:readGyro)
    end

    it 'has a function to read the all sensors' do
      expect(@minimu).to respond_to(:readAll)
    end

    it 'can provide raw sensor data from the magnetometer' do
      expect(@minimu).to respond_to(:raw_mag)
    end

    it 'can provide raw sensor data from the accelerometer' do
      expect(@minimu).to respond_to(:raw_acc)
    end

    it 'can provide raw sensor data from the gryo' do
      expect(@minimu).to respond_to(:raw_gyro)
    end
  end

  describe 'raw data' do
    before(:all) do
      @minimu= clazz.new(test_i2c_device)
    end

    it 'returns an array of 3 floats for raw magnetometer data' do
      raw_data = @minimu.raw_mag
      expect(raw_data.class).to eq(Array)
      expect(raw_data.count).to eq(3)
      (0..2).each do |index|
        expect(raw_data[index].class).to eq(Float), "Expected raw magnetometer data element #{index} to be a float got #{raw_data[index].class}."
      end
    end

    it 'returns an array of 3 floats for raw accelerometer data' do
      raw_data = @minimu.raw_acc
      expect(raw_data.class).to eq(Array)
      expect(raw_data.count).to eq(3)
      (0..2).each do |index|
        expect(raw_data[index].class).to eq(Float), "Expected raw accelerometer data element #{index} to be a float got #{raw_data[index].class}."
      end
    end

    it 'returns an array of 3 floats for raw gryo data' do
      raw_data = @minimu.raw_gyro
      expect(raw_data.class).to eq(Array)
      expect(raw_data.count).to eq(3)
      (0..2).each do |index|
        expect(raw_data[index].class).to eq(Float), "Expected raw gyro data element #{index} to be a float got #{raw_data[index].class}."
      end
    end

    it 'returns an array of containing 3 arrays of 3 floats for raw data' do
      raw_data = @minimu.raw_data
      expect(raw_data.class).to eq(Array)
      expect(raw_data.count).to eq(3)

      raw_data.each_with_index  do |sensor_data, sensors_index|
        expect(sensor_data.class).to eq(Array), "Expected raw data element #{sensors_index} to be an Array got #{sensor_data.class}."
        expect(sensor_data.count).to eq(3), "Expected raw data element #{sensors_index} to have three elements got #{sensor_data.count}."
        (0..2).each do |data_index|
          expect(sensor_data[data_index].class).to eq(Float), "Expected raw sensor data element #{sensors_index} for senesor #{sensors_index} to be a float got #{sensor_data[data_index].class}."
        end
      end
    end

  end

end
