#!/bin/env perl

use strict;

my $origXkbRules;
my $origXkbModel;
my $origXkbLayouts;
my $origXkbOptions;
my $origXkbVariants;

sub backupXkbSettings
{
  open (XPROP, "xprop -root |") or die "Could not start xprop";
  PROP: while (<XPROP>)
  {
    if (/_XKB_RULES_NAMES\(STRING\) = \"(.*)\", \"(.*)\", \"(.*)\", \"(.*)\", \"(.*)\"/)
    {
      ( $origXkbRules, $origXkbModel, $origXkbLayouts, $origXkbVariants, $origXkbOptions ) = 
      ( $1, $2, $3, $4, $5 ) ;
      last PROP;
    }
  }
  close XPROP;
}

sub setXkbSettings
{
  my ( $xkbRules, $xkbModel, $xkbLayouts, $xkbVariants, $xkbOptions ) = @_;
  ( system ( "setxkbmap", 
       "-rules", $xkbRules,
       "-model", $xkbModel,
       "-layout", $xkbLayouts,
       "-variant", $xkbVariants,
       "-option", $xkbOptions ) == 0 ) or die "Could not set xkb configuration";
}

sub restoreXkbSettings
{
  setXkbSettings( $origXkbRules, $origXkbModel, $origXkbLayouts, $origXkbVariants, $origXkbOptions );
}

sub dumpXkbSettings
{
  my ( $xkbRules, $xkbModel, $xkbLayouts, $xkbVariants, $xkbOptions ) = @_;
  print "rules: [$xkbRules]\n" ;
  print "model: [$xkbModel]\n" ;
  print "layouts: [$xkbLayouts]\n" ;
  print "variants: [$xkbVariants]\n" ;
  print "options: [$xkbOptions]\n" ;
}

sub testLevel1
{
  my ( $type, $idx ) = @_;

  open ( XSLTPROC, "xsltproc --stringparam type $type listCIs.xsl ../rules/base.xml.in |" ) or
    die ( "Could not start xsltproc" );
  while (<XSLTPROC>)
  {
    chomp();
    if (/(\w+)/)
    {
      my $paramValue=$1;
      print "--- setting $type: [$paramValue]\n";
      my @params = ( $origXkbRules, $origXkbModel, $origXkbLayouts, $origXkbVariants, $origXkbOptions );
      @params[$idx] = $paramValue;
      dumpXkbSettings ( @params );
      setXkbSettings ( @params );
    }
  }
  close XSLTPROC;
}

backupXkbSettings();

dumpXkbSettings( $origXkbRules, $origXkbModel, $origXkbLayouts, $origXkbVariants, $origXkbOptions );

testLevel1( "model", 1 );

restoreXkbSettings();
