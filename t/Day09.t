#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.3');
use Test::More tests => 4;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day09;

Readonly my $EXAMPLE_FILE              => './day09_example';
Readonly my $PUZZLE_FILE               => './day09_input';
Readonly my $EXAMPLE_BATCH_SIZE        => 5;
Readonly my $EXAMPLE_PREAMBLE_LENGTH   => 5;
Readonly my $PUZZLE_BATCH_SIZE         => 25;
Readonly my $PUZZLE_PREAMBLE_LENGTH    => 25;
Readonly my $PART_ONE_EXAMPLE_SOLUTION => 127;
Readonly my $PART_ONE_PUZZLE_SOLUTION  => 18272118;
Readonly my $PART_TWO_EXAMPLE_SOLUTION => '';
Readonly my $PART_TWO_PUZZLE_SOLUTION  => '';

Readonly my $EXAMPLE_INPUT_REF =>
    AOC2020::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

is( AOC2020::Day09->solve_part_1(
        {   'data_ref'        => $EXAMPLE_INPUT_REF,
            'batch_size'      => $EXAMPLE_BATCH_SIZE,
            'preamble_length' => $EXAMPLE_PREAMBLE_LENGTH,
        },
    ),
    $PART_ONE_EXAMPLE_SOLUTION,
    'Example solution of Part One is correct.'
);

is( AOC2020::Day09->solve_part_1(
        {   'data_ref'        => $PUZZLE_INPUT_REF,
            'batch_size'      => $PUZZLE_BATCH_SIZE,
            'preamble_length' => $PUZZLE_PREAMBLE_LENGTH,
        }
    ),
    $PART_ONE_PUZZLE_SOLUTION,
    'Puzzle solution of Part One is correct.'
);

is( AOC2020::Day09->solve_part_2(
        {   'data_ref'        => $EXAMPLE_INPUT_REF,
            'batch_size'      => $EXAMPLE_BATCH_SIZE,
            'preamble_length' => $EXAMPLE_PREAMBLE_LENGTH,
        }
    ),
    $PART_TWO_EXAMPLE_SOLUTION,
    'Example solution of Part Two is correct.'
);

is( AOC2020::Day09->solve_part_2(
        {   'data_ref'        => $PUZZLE_INPUT_REF,
            'batch_size'      => $PUZZLE_BATCH_SIZE,
            'preamble_length' => $PUZZLE_PREAMBLE_LENGTH,
        }
    ),
    $PART_TWO_PUZZLE_SOLUTION,
    'Puzzle solution of Part Two is correct.'
);
