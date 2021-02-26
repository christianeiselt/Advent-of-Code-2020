#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.0');
use Test::More tests => 4;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day06;

Readonly my $EXAMPLE_FILE      => './day06_example';
Readonly my $PUZZLE_FILE       => './day06_input';
Readonly my $EXAMPLE_INPUT_REF =>
    AOC2020::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

subtest 'test_part_one_example' => sub {
    plan tests => 1;

    Readonly my $PART_ONE_EXAMPLE_SOLUTION => 11;

    Readonly my $HIGHEST_SEAT_ID =>
        AOC2020::Day06->get_group_count_part_1($EXAMPLE_INPUT_REF);

    is( $HIGHEST_SEAT_ID, $PART_ONE_EXAMPLE_SOLUTION,
        'Example solution of Part One is correct.' );
};

subtest 'test_part_one_puzzle' => sub {
    plan tests => 1;

    Readonly my $PART_ONE_PUZZLE_SOLUTION => 6726;

    Readonly my $RESULT_PART_ONE_PUZZLE =>
        AOC2020::Day06->get_group_count_part_1($PUZZLE_INPUT_REF);

    is( $RESULT_PART_ONE_PUZZLE, $PART_ONE_PUZZLE_SOLUTION,
        'Puzzle solution of Part One is correct.' );
};

subtest 'test_part_two_puzzle' => sub {
    plan tests => 1;

    Readonly my $PART_TWO_PUZZLE_SOLUTION => 6;

    Readonly my $RESULT_PART_TWO_PUZZLE =>
        AOC2020::Day06->get_group_count_part_2($EXAMPLE_INPUT_REF);

    is( $RESULT_PART_TWO_PUZZLE, $PART_TWO_PUZZLE_SOLUTION,
        'Puzzle solution of Part Two is correct.' );
};

subtest 'test_part_two_puzzle' => sub {
    plan tests => 1;

    Readonly my $PART_TWO_PUZZLE_SOLUTION => 3316;

    Readonly my $RESULT_PART_TWO_PUZZLE =>
        AOC2020::Day06->get_group_count_part_2($PUZZLE_INPUT_REF);

    is( $RESULT_PART_TWO_PUZZLE, $PART_TWO_PUZZLE_SOLUTION,
        'Puzzle solution of Part Two is correct.' );
};
