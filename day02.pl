#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use Readonly;
use version; our $VERSION = qv('1.0.6');
use lib 'lib';
use AOC2020::Common;
use AOC2020::Day02;

Readonly my $PUZZLE_FILE      => './day02_input';
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

my $SOLUTION_A =
    AOC2020::Day02->get_valid_password_count_for_part( 1, $PUZZLE_INPUT_REF );
my $SOLUTION_B =
    AOC2020::Day02->get_valid_password_count_for_part( 2, $PUZZLE_INPUT_REF );

print "Solution A: $SOLUTION_A\n" or croak 'no output available';
print "Solution B: $SOLUTION_B\n" or croak 'no output available';
