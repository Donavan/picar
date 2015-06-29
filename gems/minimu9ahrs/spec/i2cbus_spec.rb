require 'spec_helper'

def test_i2c_device
  return ENV['MINIUM_TEST_DEVICE'].nil? ? '/dev/i2c-1' : ENV['MINIUM_TEST_DEVICE']
end

describe Minimu9ahrs::I2CBus do
  clazz = Minimu9ahrs::I2CBus

  describe 'instance level' do
    before(:each) do
      # noinspection RubyInstanceVariableNamingConvention
      @I2CBus = clazz.new(test_i2c_device)
    end

    it 'has a function to set the address' do
      expect(@I2CBus).to respond_to(:address=)
    end

    it 'can write data, given a command byte' do
      expect(@I2CBus).to respond_to(:write_byte)
    end

    it 'has a function to read a byte, given a command byte' do
      expect(@I2CBus).to respond_to(:read_byte)
    end

    it 'has a function to read a block of bytes (from address)' do
      expect(@I2CBus).to respond_to(:read_block)
    end

    it 'has a function to try to read a byte (from address)' do
      expect(@I2CBus).to respond_to(:try_read_byte)
    end

    it 'has a function to try to read a byte from a passed address' do
      expect(@I2CBus).to respond_to(:try_read_byte_with_addr)
    end
  end

end
