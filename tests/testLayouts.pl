#!/bin/env perl

use strict;
use warnings;
use xkbTestFunc;

backupXkbSettings();
                                                                                                                 
dumpXkbSettingsBackup();

testLevel2( "layout", "variant", 2, "(", ")" );

restoreXkbSettings();
