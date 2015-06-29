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

end
