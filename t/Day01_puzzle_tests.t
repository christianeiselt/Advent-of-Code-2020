#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.18');
use Test::More tests => 4;

use lib '../lib/';
use AdventOfCode::Common;
use AdventOfCode::Day01;

Readonly my $EXAMPLE_FILE              => './day01_example';
Readonly my $PUZZLE_FILE               => './day01_input';
Readonly my $PART_ONE_EXAMPLE_SOLUTION => 514_579;
Readonly my $PART_ONE_PUZZLE_SOLUTION  => 802_011;
Readonly my $PART_TWO_EXAMPLE_SOLUTION => 241_861_950;
Readonly my $PART_TWO_PUZZLE_SOLUTION  => 248_607_374;

Readonly my $EXAMPLE_INPUT_REF => AdventOfCode::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF  => AdventOfCode::Common->get_file_content($PUZZLE_FILE);

is( AdventOfCode::Day01->solve_part_1($EXAMPLE_INPUT_REF),
    $PART_ONE_EXAMPLE_SOLUTION, 'Example solution of Part One is correct.' );

is( AdventOfCode::Day01->solve_part_1($PUZZLE_INPUT_REF),
    $PART_ONE_PUZZLE_SOLUTION, 'Puzzle solution of Part One is correct.' );

is( AdventOfCode::Day01->solve_part_2($EXAMPLE_INPUT_REF),
    $PART_TWO_EXAMPLE_SOLUTION, 'Example solution of Part Two is correct.' );

is( AdventOfCode::Day01->solve_part_2($PUZZLE_INPUT_REF),
    $PART_TWO_PUZZLE_SOLUTION, 'Puzzle solution of Part Two is correct.' );
