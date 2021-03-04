#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.7');
use Test::More tests => 4;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day04;

Readonly my $EXAMPLE_FILE              => './day04_example';
Readonly my $PUZZLE_FILE               => './day04_input';
Readonly my $PART_ONE_EXAMPLE_SOLUTION => 2;
Readonly my $PART_ONE_PUZZLE_SOLUTION  => 245;
Readonly my $PART_TWO_EXAMPLE_SOLUTION => 2;
Readonly my $PART_TWO_PUZZLE_SOLUTION  => 133;

Readonly my $EXAMPLE_INPUT_REF =>
    AOC2020::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

is( AOC2020::Day04->solve_part_1($EXAMPLE_INPUT_REF),
    $PART_ONE_EXAMPLE_SOLUTION, 'Example solution of Part One is correct.' );

is( AOC2020::Day04->solve_part_1($PUZZLE_INPUT_REF),
    $PART_ONE_PUZZLE_SOLUTION, 'Puzzle solution of Part One is correct.' );

is( AOC2020::Day04->solve_part_2($EXAMPLE_INPUT_REF),
    $PART_TWO_EXAMPLE_SOLUTION, 'Example solution of Part Two is correct.' );

is( AOC2020::Day04->solve_part_2($PUZZLE_INPUT_REF),
    $PART_TWO_PUZZLE_SOLUTION, 'Puzzle solution of Part Two is correct.' );
