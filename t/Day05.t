#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.2');
use Test::More tests => 3;

use lib '../lib/';
use AdventOfCode::Common;
use AdventOfCode::Day05;

Readonly my $EXAMPLE_FILE => './day05_example';
Readonly my $PUZZLE_FILE  => './day05_input';

Readonly my $PART_ONE_EXAMPLE_SOLUTION => 820;
Readonly my $PART_ONE_PUZZLE_SOLUTION  => 991;
Readonly my $PART_TWO_PUZZLE_SOLUTION  => 534;

Readonly my $EXAMPLE_INPUT_REF => AdventOfCode::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF  => AdventOfCode::Common->get_file_content($PUZZLE_FILE);

is( AdventOfCode::Day05->solve_part_1($EXAMPLE_INPUT_REF),
    $PART_ONE_EXAMPLE_SOLUTION, 'Example solution of Part One is correct.' );

is( AdventOfCode::Day05->solve_part_1($PUZZLE_INPUT_REF),
    $PART_ONE_PUZZLE_SOLUTION, 'Puzzle solution of Part One is correct.' );

is( AdventOfCode::Day05->solve_part_2($PUZZLE_INPUT_REF),
    $PART_TWO_PUZZLE_SOLUTION, 'Puzzle solution of Part Two is correct.' );
