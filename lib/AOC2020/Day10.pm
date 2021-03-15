#!/usr/bin/perl

package AOC2020::Day10;

use warnings;
use strict;
use List::Util qw(min max);
use Readonly;
use version; our $VERSION = qv('1.0.0');

sub solve_part_1 {
    Readonly my $SELF      => shift;
    Readonly my $INPUT_REF => shift;
    Readonly my $RESULT    => solve($INPUT_REF);

    return $RESULT;
}

sub solve_part_2 {
    Readonly my $SELF       => shift;
    Readonly my $INPUT_REF  => shift;
    Readonly my $TARGET_SUM => shift;
    Readonly my $RESULT => solve($INPUT_REF);

    return $RESULT;
}

sub solve {
    return undef;
}

1;
