#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.3');
use Test::More tests => 5;

use lib '../lib/';
use AdventOfCode::Common;
use AdventOfCode::Day10;

Readonly my $EXAMPLE_FILE              => './day10_example';
Readonly my $PUZZLE_FILE               => './day10_input';
Readonly my $PART_ONE_EXAMPLE_SOLUTION => 220;
Readonly my $PART_ONE_PUZZLE_SOLUTION  => 2_176;
Readonly my $PART_TWO_EXAMPLE_SOLUTION => 1;
Readonly my $PART_TWO_PUZZLE_SOLUTION  => 1;

Readonly my $EXAMPLE_INPUT_REF => AdventOfCode::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF  => AdventOfCode::Common->get_file_content($PUZZLE_FILE);

is( AdventOfCode::Day10->solve_part_1($EXAMPLE_INPUT_REF),
    $PART_ONE_EXAMPLE_SOLUTION, 'Example solution of Part One is correct.' );

is( AdventOfCode::Day10->solve_part_1($PUZZLE_INPUT_REF),
    $PART_ONE_PUZZLE_SOLUTION, 'Puzzle solution of Part One is correct.' );

is( AdventOfCode::Day10->solve_part_2( $EXAMPLE_INPUT_REF, $PART_ONE_EXAMPLE_SOLUTION ),
    $PART_TWO_EXAMPLE_SOLUTION, 'Example solution of Part Two is correct.' );

is( AdventOfCode::Day10->solve_part_2( $PUZZLE_INPUT_REF, $PART_ONE_PUZZLE_SOLUTION ),
    $PART_TWO_PUZZLE_SOLUTION, 'Puzzle solution of Part Two is correct.' );

subtest 'prepare_counter' => sub {
    plan tests => 1;

    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $EXPECTED_REF => {
        'count'       => -1,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $COUNTER_REF => AdventOfCode::Day10->prepare_counter();
    is_deeply($COUNTER_REF, $EXPECTED_REF, 'ok');
};
