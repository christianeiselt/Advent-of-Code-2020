#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.3');
use Test::More tests => 4;

use lib '../lib/';
use AdventOfCode::Common;
use AdventOfCode::Day07;

Readonly my $EXAMPLE_FILE              => './day07_example';
Readonly my $PUZZLE_FILE               => './day07_input';
Readonly my $PART_ONE_EXAMPLE_SOLUTION => 4;
Readonly my $PART_ONE_PUZZLE_SOLUTION  => 197;
Readonly my $PART_TWO_EXAMPLE_SOLUTION => 32;
Readonly my $PART_TWO_PUZZLE_SOLUTION  => 85_324;

Readonly my $EXAMPLE_INPUT_REF => AdventOfCode::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF  => AdventOfCode::Common->get_file_content($PUZZLE_FILE);

is( AdventOfCode::Day07->solve_part_1($EXAMPLE_INPUT_REF),
    $PART_ONE_EXAMPLE_SOLUTION, 'Example solution of Part One is correct.' );

is( AdventOfCode::Day07->solve_part_1($PUZZLE_INPUT_REF),
    $PART_ONE_PUZZLE_SOLUTION, 'Puzzle solution of Part One is correct.' );

is( AdventOfCode::Day07->solve_part_2($EXAMPLE_INPUT_REF),
    $PART_TWO_EXAMPLE_SOLUTION, 'Example solution of Part Two is correct.' );

is( AdventOfCode::Day07->solve_part_2($PUZZLE_INPUT_REF),
    $PART_TWO_PUZZLE_SOLUTION, 'Puzzle solution of Part Two is correct.' );
