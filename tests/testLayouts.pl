#!/bin/env perl

use strict;
use warnings;
use xkbTestFunc;

xkbTestFunc::backupXkbSettings();
                                                                                                                 
xkbTestFunc::dumpXkbSettingsBackup();

xkbTestFunc::testLevel2( "layout", "variant", 2, "(", ")" );

xkbTestFunc::restoreXkbSettings();
