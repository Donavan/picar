#ifndef _MINIMU9_H
#define _MINIMU9_H

#include "IMU.h"
#include "LSM303.h"
#include "L3G.h"


//using namespace rice;

class MinIMU9 : public IMU {
public:
  MinIMU9(const char * i2cDeviceName);

  LSM303 compass;
  L3G gyro;

  virtual vector readAcc();
  virtual vector readMag();
  virtual vector readGyro();

  void readAll()
  {
    readAcc(); readMag(); readGyro();
  }
  virtual void enable();
  virtual void loadCalibration();
  virtual void measureOffsets();

  Rice::Array getRawMag();
  Rice::Array getRawAcc();
  Rice::Array getRawGyro();
  Rice::Array getRawData();

  bool isEnabled() { return compass.isEnabled() && gyro.isEnabled(); }

private:
  bool _enabled;
};

#endif
