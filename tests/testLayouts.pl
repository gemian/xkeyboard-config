#!/bin/env perl

use strict;
use xkbTestFunc;

backupXkbSettings();
                                                                                                                 
dumpXkbSettings( $origXkbRules, $origXkbModel, $origXkbLayouts, $origXkbVariants, $origXkbOptions );

testLevel2( "layout", "variant", 2, "(", ")" );

restoreXkbSettings();
