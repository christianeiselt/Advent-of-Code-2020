#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use Readonly;
use version; our $VERSION = qv('1.0.7');
use lib 'lib';
use AOC2020::Common;
use AOC2020::Day03;

Readonly my $PUZZLE_FILE      => './day03_input';
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);
Readonly my $SLOPES_REF => {
    'slope_a' => { 'right' => 1, 'down' => 1 },
    'slope_b' => { 'right' => 3, 'down' => 1 },
    'slope_c' => { 'right' => 5, 'down' => 1 },
    'slope_d' => { 'right' => 7, 'down' => 1 },
    'slope_e' => { 'right' => 1, 'down' => 2 },
};
Readonly my $START_POS_REF => { 'x' => 0, 'y' => 0 };
Readonly my $SOLUTION_PART_ONE =>
    AOC2020::Day03->get_tree_count_for_slope( $PUZZLE_INPUT_REF,
    $SLOPES_REF->{'slope_b'},
    $START_POS_REF );
Readonly my $SOLUTION_PART_TWO =>
    AOC2020::Day03->get_product_of_tree_counts( $PUZZLE_INPUT_REF,
    $SLOPES_REF, $START_POS_REF );

print "Advent of Code 2020 - Day 03 Solutions: Part One: $SOLUTION_PART_ONE / Part Two: $SOLUTION_PART_TWO\n" or croak 'no output available';
