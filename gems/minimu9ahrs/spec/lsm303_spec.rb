require 'spec_helper'

def test_i2c_device
  return ENV['MINIUM_TEST_DEVICE'].nil? ? '/dev/i2c-1' : ENV['MINIUM_TEST_DEVICE']
end

describe Minimu9ahrs::LSM303 do
  clazz = Minimu9ahrs::LSM303

  describe 'instance level' do
    before(:each) do
      @lsm303= clazz.new(test_i2c_device)
    end

    it 'has an enable function' do
      expect(@lsm303).to respond_to(:enable)
    end

    it 'can tell you if it is enabled' do
      expect(@lsm303).to respond_to(:enabled?)
    end

    it 'has a function to read the accelerometer' do
      expect(@lsm303).to respond_to(:read_acc)
    end

    it 'has a function to read the magnetometer' do
      expect(@lsm303).to respond_to(:read_mag)
    end

    it 'has a function to read a magnetometer register' do
      expect(@lsm303).to respond_to(:read_mag_reg)
    end

    it 'has a function to read a write a magnetometer register' do
      expect(@lsm303).to respond_to(:write_mag_reg)
    end

    it 'has a function to read a accelerometer register' do
      expect(@lsm303).to respond_to(:read_acc_reg)
    end

    it 'has a function to read a write a accelerometer register' do
      expect(@lsm303).to respond_to(:write_acc_reg)
    end

    describe 'enable functionality' do
      before(:each) do
        @lsm303= clazz.new(test_i2c_device)
      end
      it 'returns false for enabled? if not enabled' do
        expect(@lsm303.enabled?).to eq(false)
      end

      it 'returns true for enabled? if enabled' do
        @lsm303.enable
        expect(@lsm303.enabled?).to eq(true)
      end
    end

  end

end
