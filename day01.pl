#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use Readonly;
use version; our $VERSION = qv('1.0.6');
use lib 'lib';
use AOC2020::Common;
use AOC2020::Day01;

Readonly my $PUZZLE_FILE      => './day01_input';
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);
Readonly my $NUMBER_COUNT_PART_ONE => 2;
Readonly my $NUMBER_COUNT_PART_TWO => 3;
Readonly my $TARGET_SUM            => 2020;

my $SOLUTION_A =
    AOC2020::Day01->get_product_of_numbers_adding_to( $TARGET_SUM,
    $PUZZLE_INPUT_REF, $NUMBER_COUNT_PART_ONE );
my $SOLUTION_B =
    AOC2020::Day01->get_product_of_numbers_adding_to( $TARGET_SUM,
    $PUZZLE_INPUT_REF, $NUMBER_COUNT_PART_TWO );

print "Solution A: $SOLUTION_A\n" or croak 'no output available';
print "Solution B: $SOLUTION_B\n" or croak 'no output available';
