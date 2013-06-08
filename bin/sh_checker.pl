#!/usr/bin/env perl
use strict;
use warnings;
my $res =`/bin/sh -x "$ARGV[0]" 2>&1`;
my @lines = split( "\n", $res );
foreach my $line ( @lines ) {
    if ( $line =~ m{(.+):\sline\s(\d+):\s(.+)}ixms )  {
        print "$1:$2:$3\n";
    }
}
