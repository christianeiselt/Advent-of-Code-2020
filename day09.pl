#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use Readonly;
use version; our $VERSION = qv('1.0.1');
use lib 'lib';
use AOC2020::Common;
use AOC2020::Day09;

Readonly my $PUZZLE_BATCH_SIZE      => 25;
Readonly my $PUZZLE_PREAMBLE_LENGTH => 25;
Readonly my $PUZZLE_FILE            => './day09_input';
Readonly my $PUZZLE_INPUT_REF       =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

Readonly my $SOLUTION_PART_ONE => AOC2020::Day09->solve_part_1(
    {   'data_ref'        => $PUZZLE_INPUT_REF,
        'batch_size'      => $PUZZLE_BATCH_SIZE,
        'preamble_length' => $PUZZLE_PREAMBLE_LENGTH,
    },
);
Readonly my $SOLUTION_PART_TWO =>
    AOC2020::Day09->solve_part_2( $PUZZLE_INPUT_REF, $SOLUTION_PART_ONE );

print "Advent of Code 2020 - Day 01 Solutions: Part One: $SOLUTION_PART_ONE"
    . " / Part Two: $SOLUTION_PART_TWO\n"
    or croak 'no output available';
