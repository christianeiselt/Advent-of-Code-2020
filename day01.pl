#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use Readonly;
use version; our $VERSION = qv('1.0.5');
use lib 'lib';
use AOC2020::Common;
use AOC2020::Day01;

Readonly my $PUZZLE_FILE      => './day01_input';
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

my $SOLUTION_A = AOC2020::Day01->get_solution_a($PUZZLE_INPUT_REF);
my $SOLUTION_B = AOC2020::Day01->get_solution_b($PUZZLE_INPUT_REF);

print "Solution A: $SOLUTION_A\n" or croak 'no output available';
print "Solution B: $SOLUTION_B\n" or croak 'no output available';
