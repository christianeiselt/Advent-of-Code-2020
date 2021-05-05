#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.5');
use Test::More tests => 4;

use lib '../lib/';
use AdventOfCode::Common;
use AdventOfCode::Day09;

Readonly my $EXAMPLE_FILE              => './day09_example';
Readonly my $PUZZLE_FILE               => './day09_input';
Readonly my $EXAMPLE_BATCH_SIZE        => 5;
Readonly my $EXAMPLE_PREAMBLE_LENGTH   => 5;
Readonly my $PUZZLE_BATCH_SIZE         => 25;
Readonly my $PUZZLE_PREAMBLE_LENGTH    => 25;
Readonly my $PART_ONE_EXAMPLE_SOLUTION => 127;
Readonly my $PART_ONE_PUZZLE_SOLUTION  => 18_272_118;
Readonly my $PART_TWO_EXAMPLE_SOLUTION => 62;
Readonly my $PART_TWO_PUZZLE_SOLUTION  => 2_186_361;

Readonly my $EXAMPLE_INPUT_REF => AdventOfCode::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF  => AdventOfCode::Common->get_file_content($PUZZLE_FILE);

is( AdventOfCode::Day09->solve_part_1(
        {   'data_ref'        => $EXAMPLE_INPUT_REF,
            'batch_size'      => $EXAMPLE_BATCH_SIZE,
            'preamble_length' => $EXAMPLE_PREAMBLE_LENGTH,
        },
    ),
    $PART_ONE_EXAMPLE_SOLUTION,
    'Example solution of Part One is correct.'
);

is( AdventOfCode::Day09->solve_part_1(
        {   'data_ref'        => $PUZZLE_INPUT_REF,
            'batch_size'      => $PUZZLE_BATCH_SIZE,
            'preamble_length' => $PUZZLE_PREAMBLE_LENGTH,
        }
    ),
    $PART_ONE_PUZZLE_SOLUTION,
    'Puzzle solution of Part One is correct.'
);

is( AdventOfCode::Day09->solve_part_2( $EXAMPLE_INPUT_REF, $PART_ONE_EXAMPLE_SOLUTION ),
    $PART_TWO_EXAMPLE_SOLUTION, 'Example solution of Part Two is correct.' );

is( AdventOfCode::Day09->solve_part_2( $PUZZLE_INPUT_REF, $PART_ONE_PUZZLE_SOLUTION ),
    $PART_TWO_PUZZLE_SOLUTION, 'Puzzle solution of Part Two is correct.' );
