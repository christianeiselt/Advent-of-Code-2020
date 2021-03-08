#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.1');
use Test::More tests => 4;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day09;

Readonly my $EXAMPLE_FILE              => './day09_example';
Readonly my $PUZZLE_FILE               => './day09_input';
Readonly my $PART_ONE_EXAMPLE_SOLUTION => undef;
Readonly my $PART_ONE_PUZZLE_SOLUTION  => undef;
Readonly my $PART_TWO_EXAMPLE_SOLUTION => undef;
Readonly my $PART_TWO_PUZZLE_SOLUTION  => undef;

Readonly my $EXAMPLE_INPUT_REF =>
  AOC2020::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF =>
  AOC2020::Common->get_file_content($PUZZLE_FILE);

is( AOC2020::Day09->solve_part_1($EXAMPLE_INPUT_REF),
    $PART_ONE_EXAMPLE_SOLUTION, 'Example solution of Part One is correct.' );

is( AOC2020::Day09->solve_part_1($PUZZLE_INPUT_REF),
    $PART_ONE_PUZZLE_SOLUTION, 'Puzzle solution of Part One is correct.' );

is( AOC2020::Day09->solve_part_2($EXAMPLE_INPUT_REF),
    $PART_TWO_EXAMPLE_SOLUTION, 'Example solution of Part Two is correct.' );

is( AOC2020::Day09->solve_part_2($PUZZLE_INPUT_REF),
    $PART_TWO_PUZZLE_SOLUTION, 'Puzzle solution of Part Two is correct.' );
