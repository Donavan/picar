#include "minimu9ahrs.h"

VALUE rb_mMinimu9ahrs;

void
Init_minimu9ahrs(void)
{
  rb_mMinimu9ahrs = rb_define_module("Minimu9ahrs");
}
