#!/usr/bin/perl -w
#
# $Id: generate_gnuplot.pl 14 2007-02-01 15:49:12Z mitza $
#

foreach $t (@ARGV) {
  print "plot '", $t, "_delta.32.histo.dat'\n";
  foreach $i (2..16) {
    print "replot '", $t, "_delta.", 32*$i, ".histo.dat'\n";
  }
}
