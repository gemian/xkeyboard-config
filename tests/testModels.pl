#!/bin/env perl

use strict;

my $origXkbRules;
my $origXkbModel;
my $origXkbLayouts;
my $origXkbOptions;
my $origXkbVariants;

sub backupXkbSettings
{
  ( $origXkbRules, $origXkbModel, $origXkbLayouts, $origXkbVariants, $origXkbOptions ) = getXkbSettings();
}

sub getXkbSettings
{
  my ( $xkbRules, $xkbModel, $xkbLayouts, $xkbVariants, $xkbOptions );

  open (XPROP, "xprop -root |") or die "Could not start xprop";
  PROP: while (<XPROP>)
  {
    if (/_XKB_RULES_NAMES\(STRING\) = \"(.*)\", \"(.*)\", \"(.*)\", \"(.*)\", \"(.*)\"/)
    {
      ( $xkbRules, $xkbModel, $xkbLayouts, $xkbVariants, $xkbOptions ) = 
      ( $1, $2, $3, $4, $5 ) ;
      last PROP;
    }
  }
  close XPROP;
  
  return ( $xkbRules, $xkbModel, $xkbLayouts, $xkbVariants, $xkbOptions );
}

sub setXkbSettings
{
  my ( $xkbRules, $xkbModel, $xkbLayouts, $xkbVariants, $xkbOptions ) = @_;
  ( system ( "setxkbmap", "-synch",
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

sub defaultXkbSettings
{
  return ( "base", "pc105", "us", "", "" );
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
    if (/(\S+)/)
    {
      my $paramValue=$1;
      print "--- setting $type: [$paramValue]\n";
      my @params = defaultXkbSettings();
      @params[$idx] = $paramValue;
      dumpXkbSettings ( @params );
      setXkbSettings ( @params );
      #print "--- dump:\n";
      #dumpXkbSettings( getXkbSettings() );
    }
  }
  close XSLTPROC;
}

sub testLevel2
{
  my ( $type, $subtype, $idx, $delim1, $delim2 ) = @_;

  open ( XSLTPROC, "xsltproc --stringparam type $type listCIs.xsl ../rules/base.xml.in |" ) or
    die ( "Could not start xsltproc" );
  while (<XSLTPROC>)
  {
    chomp();
    if (/(\S+)/)
    {
      my $paramValue=$1;
      print "--- scanning $type: [$paramValue]\n";

      my @params = defaultXkbSettings();
      @params[$idx] = "$paramValue";
      dumpXkbSettings ( @params );
      setXkbSettings ( @params );
      #print "--- dump:\n";
      #dumpXkbSettings( getXkbSettings() );

      open ( XSLTPROC2, "xsltproc --stringparam type $subtype --stringparam parentId $paramValue listCI2.xsl ../rules/base.xml.in |" ) or
        die ( "Could not start xsltproc" );
      while (<XSLTPROC2>)
      {
        chomp();
        if (/(\S+)/)
        {
          my $paramValue2=$1;
          print "  --- $subtype: [$paramValue2]\n";
          my @params = defaultXkbSettings();
          @params[$idx] = "$paramValue$delim1$paramValue2$delim2";
          dumpXkbSettings ( @params );
          setXkbSettings ( @params );
          #print "--- dump:\n";
          #dumpXkbSettings( getXkbSettings() );
        }
      }
      close XSLTPROa2C;
    }
  }
  close XSLTPROC;
}

backupXkbSettings();

dumpXkbSettings( $origXkbRules, $origXkbModel, $origXkbLayouts, $origXkbVariants, $origXkbOptions );

#testLevel1( "model", 1 );
testLevel2( "layout", "variant", 2, "(", ")" );

restoreXkbSettings();
