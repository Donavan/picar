require 'mkmf-rice'

$CFLAGS = '-std=c++0x ' + $CFLAGS

create_makefile('minimu9ahrs/minimu9ahrs')
