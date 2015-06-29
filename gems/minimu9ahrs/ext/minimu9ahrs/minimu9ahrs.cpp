#include "rice/Constructor.hpp"
#include "rice/String.hpp"
#include "MinIMU9.h"
#include "vector.h"

using namespace Rice;

extern "C"
void Init_minimu9ahrs()
{
  Module rb_mModule = define_module("Minimu9ahrs");

  Data_Type<MinIMU9> rb_cImu9 =  define_class_under<MinIMU9>(rb_mModule, "MinIMU9")
                                .define_constructor(Constructor<MinIMU9, const char *>())
                                .define_method("enable",                &MinIMU9::enable)
                                .define_method("readAll",               &MinIMU9::readAll)
                                .define_method("readMag",               &MinIMU9::readMag)
                                .define_method("readAcc",               &MinIMU9::readAcc)
                                .define_method("readGyro",              &MinIMU9::readGyro)
                                .define_method("raw_mag",               &MinIMU9::getRawMag)
                                .define_method("raw_acc",               &MinIMU9::getRawAcc)
                                .define_method("raw_gyro",              &MinIMU9::getRawGyro)
                                .define_method("raw_data",              &MinIMU9::getRawData)
                                .define_method("enabled?",              &MinIMU9::isEnabled)
                                .define_method("load_calibration",      &MinIMU9::loadCalibration)
                                .define_method("load_calibration_from", &MinIMU9::loadCalibrationFrom)
                                .define_method("measure_offsets",       &MinIMU9::measureOffsets);
}