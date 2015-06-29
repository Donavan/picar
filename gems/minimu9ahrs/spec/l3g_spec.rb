require 'spec_helper'

def test_i2c_device
  return ENV['MINIUM_TEST_DEVICE'].nil? ? '/dev/i2c-1' : ENV['MINIUM_TEST_DEVICE']
end

describe Minimu9ahrs::L3G do
  clazz = Minimu9ahrs::L3G

  describe 'instance level' do
    before(:each) do
      @l3g= clazz.new(test_i2c_device)
    end

    it 'has an enable function' do
      expect(@l3g).to respond_to(:enable)
    end

    it 'can tell you if it is enabled' do
      expect(@l3g).to respond_to(:enabled?)
    end

    it 'has a function to read the sensor' do
      expect(@l3g).to respond_to(:read)
    end

    it 'has a function to read a register' do
      expect(@l3g).to respond_to(:read_reg)
    end

    it 'has a function to read a write a register' do
      expect(@l3g).to respond_to(:write_reg)
    end

    describe 'enable functionality' do
      before(:each) do
        @l3g= clazz.new(test_i2c_device)
      end
      it 'returns false for enabled? if not enabled' do
        expect(@l3g.enabled?).to eq(false)
      end

      it 'returns true for enabled? if enabled' do
        @l3g.enable
        expect(@l3g.enabled?).to eq(true)
      end
    end

  end

end
