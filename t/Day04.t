#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.8');
use Test::More tests => 4;

use lib '../lib/';
use AdventOfCode::Common;
use AdventOfCode::Day04;

Readonly my $EXAMPLE_FILE              => './day04_example';
Readonly my $PUZZLE_FILE               => './day04_input';
Readonly my $PART_ONE_EXAMPLE_SOLUTION => 2;
Readonly my $PART_ONE_PUZZLE_SOLUTION  => 245;
Readonly my $PART_TWO_EXAMPLE_SOLUTION => 2;
Readonly my $PART_TWO_PUZZLE_SOLUTION  => 133;

Readonly my $EXAMPLE_INPUT_REF =>
    AdventOfCode::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF =>
    AdventOfCode::Common->get_file_content($PUZZLE_FILE);

is( AdventOfCode::Day04->solve_part_1($EXAMPLE_INPUT_REF),
    $PART_ONE_EXAMPLE_SOLUTION, 'Example solution of Part One is correct.' );

is( AdventOfCode::Day04->solve_part_1($PUZZLE_INPUT_REF),
    $PART_ONE_PUZZLE_SOLUTION, 'Puzzle solution of Part One is correct.' );

is( AdventOfCode::Day04->solve_part_2($EXAMPLE_INPUT_REF),
    $PART_TWO_EXAMPLE_SOLUTION, 'Example solution of Part Two is correct.' );

is( AdventOfCode::Day04->solve_part_2($PUZZLE_INPUT_REF),
    $PART_TWO_PUZZLE_SOLUTION, 'Puzzle solution of Part Two is correct.' );
