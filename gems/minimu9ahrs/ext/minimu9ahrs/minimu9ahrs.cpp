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
                                .define_method("read",                  &MinIMU9::readAll)
                                .define_method("read_mag",              &MinIMU9::readMag)
                                .define_method("read_acc",              &MinIMU9::readAcc)
                                .define_method("read_gyro",             &MinIMU9::readGyro)
                                .define_method("raw_mag",               &MinIMU9::getRawMag)
                                .define_method("raw_acc",               &MinIMU9::getRawAcc)
                                .define_method("raw_gyro",              &MinIMU9::getRawGyro)
                                .define_method("raw_data",              &MinIMU9::getRawData)
                                .define_method("enabled?",              &MinIMU9::isEnabled)
                                .define_method("load_calibration",      &MinIMU9::loadCalibration)
                                .define_method("load_calibration_from", &MinIMU9::loadCalibrationFrom)
                                .define_method("measure_offsets",       &MinIMU9::measureOffsets)
                                .define_method("gyro",                  &MinIMU9::getGyro)
                                .define_method("compass",               &MinIMU9::getCompass);

    Data_Type<L3G> rb_cL3G =  define_class_under<L3G>(rb_mModule, "L3G")
            .define_constructor(Constructor<L3G, const char *>())
            .define_method("enable",    &L3G::enable)
            .define_method("enabled?",  &L3G::isEnabled)
            .define_method("read",      &L3G::read)
            .define_method("write_reg", &L3G::writeReg)
            .define_method("read_reg",  &L3G::readReg);

    Data_Type<LSM303> rb_cLSM303 =  define_class_under<LSM303>(rb_mModule, "LSM303")
            .define_constructor(Constructor<LSM303, const char *>())
            .define_method("enable",        &LSM303::enable)
            .define_method("enabled?",      &LSM303::isEnabled)
            .define_method("read",          &LSM303::read)
            .define_method("read_acc",      &LSM303::readAcc)
            .define_method("read_mag",      &LSM303::readMag)
            .define_method("write_acc_reg", &LSM303::writeAccReg)
            .define_method("read_acc_reg",  &LSM303::readAccReg)
            .define_method("write_mag_reg", &LSM303::writeMagReg)
            .define_method("read_mag_reg",  &LSM303::readMagReg);
}