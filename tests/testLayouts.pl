#!/bin/env perl

use strict;
use warnings;
use xkbTestFunc;

xkbTestFunc::backupXkbSettings();
                                                                                                                 
xkbTestFunc::dumpXkbSettingsBackup();

xkbTestFunc::testLevel2( "layout", "variant", 2, "(", ")", 1, 1, 0 );

xkbTestFunc::restoreXkbSettings();
