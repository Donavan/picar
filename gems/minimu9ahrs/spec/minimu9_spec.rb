require 'spec_helper'

def test_i2c_device
  return ENV['MINIUM_TEST_DEVICE'].nil? ? '/dev/i2c-1' : ENV['MINIUM_TEST_DEVICE']
end

describe Minimu9ahrs::MinIMU9 do
  clazz = Minimu9ahrs::MinIMU9

  describe 'instance level' do
    before(:each) do
      @minimu= clazz.new(test_i2c_device)
    end

    it 'has an enable function' do
      expect(@minimu).to respond_to(:enable)
    end

    it 'can tell you if it is enabled' do
      expect(@minimu).to respond_to(:enabled?)
    end

    it 'has a function to read the magnetometer' do
      expect(@minimu).to respond_to(:read_mag)
    end

    it 'has a function to read the accelerometer' do
      expect(@minimu).to respond_to(:read_acc)
    end

    it 'has a function to read the gyro' do
      expect(@minimu).to respond_to(:read_gyro)
    end

    it 'has a function to read the all sensors' do
      expect(@minimu).to respond_to(:read)
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

    it 'can provide load a calibration file from the default location' do
      expect(@minimu).to respond_to(:load_calibration)
    end

    it 'can provide load a calibration file from a specific location' do
      expect(@minimu).to respond_to(:load_calibration_from)
    end

    it 'can measure_offsets' do
      expect(@minimu).to respond_to(:measure_offsets)
    end

    it 'makes the gyro available' do
      expect(@minimu).to respond_to(:gyro)
      expect(@minimu.gyro.class).to eq(Minimu9ahrs::L3G)
    end

    it 'makes the magnetometer/accelerometer available' do
      expect(@minimu).to respond_to(:compass)
      expect(@minimu.compass.class).to eq(Minimu9ahrs::LSM303)
    end

    describe 'enable functionality' do
      it 'returns false for enabled? if not enabled' do
        expect(@minimu.enabled?).to eq(false)
      end

      it 'returns true for enabled? if enabled' do
        @minimu.enable
        expect(@minimu.enabled?).to eq(true)
      end
    end

    describe 'raw data' do
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
            expect(sensor_data[data_index].class).to eq(Float), "Expected raw sensor data element #{sensors_index} for sensor #{sensors_index} to be a float got #{sensor_data[data_index].class}."
          end
        end
      end

    end

    describe 'reading data' do
      it 'returns all zeros for raw data if not enabled' do
        @minimu.read
        raw_data = @minimu.raw_data
        raw_data.each_with_index  do |sensor_data, sensors_index|
          (0..2).each do |data_index|
            expect(sensor_data[data_index]).to eq(0) ,  "Expected raw sensor data element #{sensors_index} for sensor #{sensors_index} to have a value of 0 got #{sensor_data[data_index]}."
          end
        end
      end

      it 'returns all zeros for raw data if enabled and read has not been called' do
        @minimu.enable
        raw_data = @minimu.raw_data
        raw_data.each_with_index  do |sensor_data, sensors_index|
          (0..2).each do |data_index|
            expect(sensor_data[data_index]).to eq(0) , "Expected raw sensor data element #{sensors_index} for sensor #{sensors_index} to have a value of 0 got #{sensor_data[data_index]}."
          end
        end
      end

      it 'returns real values for raw data if enabled and read has been called' do
        @minimu.enable
        @minimu.read
        raw_data = @minimu.raw_data
        raw_data.each_with_index  do |sensor_data, sensors_index|
          (0..2).each do |data_index|
            expect(sensor_data[data_index]).to_not eq(0) , "Expected raw sensor data element #{sensors_index} for sensor #{sensors_index} to have a non-zero value got #{sensor_data[data_index]}."
          end
        end
      end

    end
  end

end
