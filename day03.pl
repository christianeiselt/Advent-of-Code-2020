#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use version; our $VERSION = qv('1.0.4');
use lib 'lib';
use AOC2020::Common;
use AOC2020::Day03;

my $inputfile = './day03_input';
my $input     = AOC2020::Common->get_file_content($inputfile);

my $slopes = {
  'slopeA' => { 'right' => 1, 'down' => 1 },
  'slopeB' => { 'right' => 3, 'down' => 1 },
  'slopeC' => { 'right' => 5, 'down' => 1 },
  'slopeD' => { 'right' => 7, 'down' => 1 },
  'slopeE' => { 'right' => 1, 'down' => 2 },
};

my $START_POS = { 'x' => 0, 'y' => 0 };
my $SOLUTION_A =
    AOC2020::Day03->get_tree_count_for_slope( $input, $slopes->{'slopeB'},
  $START_POS );
print "Solution A: $SOLUTION_A\n" or croak 'no output available';

my $SOLUTION_B =
    AOC2020::Day03->get_product_of_tree_counts( $input, $slopes, $START_POS );
print "Solution B: $SOLUTION_B\n" or croak 'no output available';
