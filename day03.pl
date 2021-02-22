#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use Readonly;
use version; our $VERSION = qv('1.0.5');
use lib 'lib';
use AOC2020::Common;
use AOC2020::Day03;

Readonly my $PUZZLE_FILE      => './day03_input';
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

my $slopes_ref = {
    'slopeA' => { 'right' => 1, 'down' => 1 },
    'slopeB' => { 'right' => 3, 'down' => 1 },
    'slopeC' => { 'right' => 5, 'down' => 1 },
    'slopeD' => { 'right' => 7, 'down' => 1 },
    'slopeE' => { 'right' => 1, 'down' => 2 },
};
my $START_POS_REF = { 'x' => 0, 'y' => 0 };

my $SOLUTION_A =
    AOC2020::Day03->get_tree_count_for_slope( $PUZZLE_INPUT_REF,
    $slopes_ref->{'slopeB'},
    $START_POS_REF );
print "Solution A: $SOLUTION_A\n" or croak 'no output available';

my $SOLUTION_B =
    AOC2020::Day03->get_product_of_tree_counts( $PUZZLE_INPUT_REF,
    $slopes_ref, $START_POS_REF );
print "Solution B: $SOLUTION_B\n" or croak 'no output available';
