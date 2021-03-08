#!/usr/bin/perl

package AOC2020::Day09;

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.0');

sub solve_part_1 {
    Readonly my $SELF             => shift;
    Readonly my $INSTRUCTIONS_REF => shift;
    Readonly my $RESULT           => solve($INSTRUCTIONS_REF);

    return $RESULT;
}

sub solve_part_2 {
    Readonly my $SELF             => shift;
    Readonly my $INSTRUCTIONS_REF => shift;
    Readonly my $RESULT           => solve($INSTRUCTIONS_REF);

    return $RESULT;
}

sub solve {

}

1;
