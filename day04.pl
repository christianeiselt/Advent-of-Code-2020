#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use Readonly;
use version; our $VERSION = qv('1.0.4');
use lib 'lib';
use AOC2020::Common;
use AOC2020::Day04;

Readonly my $PUZZLE_FILE      => './day04_input';
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

my $SOLUTION_A = AOC2020::Day04->get_valid_count_part_one($PUZZLE_INPUT_REF);
print "Solution A: $SOLUTION_A\n" or croak 'no output available';

my $SOLUTION_B = AOC2020::Day04->get_valid_count_part_two($PUZZLE_INPUT_REF);
print "Solution B: $SOLUTION_B\n" or croak 'no output available';
