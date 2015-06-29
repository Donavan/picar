require 'mkmf-rice'

$CFLAGS = '-std=c++0x ' + $CFLAGS

CONFIG['warnflags'].slice!(/ -Wdeclaration-after-statement/)
CONFIG['warnflags'].slice!(/ -Wimplicit-function-declaration/)

create_makefile('minimu9ahrs/minimu9ahrs')
