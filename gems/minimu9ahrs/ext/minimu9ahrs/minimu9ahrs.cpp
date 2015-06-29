#include "rice/Constructor.hpp"
#include "rice/String.hpp"
#include "MinIMU9.h"

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
                                .define_method("measure_offsets",       &MinIMU9::measureOffsets)
                                .define_method("gyro",                  &MinIMU9::getGyro);

    Data_Type<L3G> rb_cL3G =  define_class_under<L3G>(rb_mModule, "L3G")
            .define_constructor(Constructor<L3G, const char *>())
            .define_method("enable",    &L3G::enable)
            .define_method("enabled?",  &L3G::isEnabled)
            .define_method("read",      &L3G::read)
            .define_method("write_reg", &L3G::writeReg)
            .define_method("read_reg",  &L3G::readReg);
}