#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.6');
use Test::More tests => 4;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day04;

Readonly my $EXAMPLE_FILE      => './day04_example';
Readonly my $PUZZLE_FILE       => './day04_input';
Readonly my $EXAMPLE_INPUT_REF =>
    AOC2020::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

subtest 'test_part_one_example' => sub {
    plan tests => 1;

    Readonly my $PART_ONE_EXAMPLE_SOLUTION => 2;

    Readonly my $RESULT_PART_ONE_EXAMPLE =>
        AOC2020::Day04->get_valid_count_part_one($EXAMPLE_INPUT_REF);

    is( $RESULT_PART_ONE_EXAMPLE, $PART_ONE_EXAMPLE_SOLUTION,
        'Example solution of Part One is correct.' );
};

subtest 'test_part_one_puzzle' => sub {
    plan tests => 1;

    Readonly my $PART_ONE_PUZZLE_SOLUTION => 245;

    Readonly my $RESULT_PART_ONE_PUZZLE =>
        AOC2020::Day04->get_valid_count_part_one($PUZZLE_INPUT_REF);

    is( $RESULT_PART_ONE_PUZZLE, $PART_ONE_PUZZLE_SOLUTION,
        'Puzzle solution of Part One is correct.' );
};

subtest 'test_part_two_example' => sub {
    plan tests => 1;

    Readonly my $PART_TWO_EXAMPLE_SOLUTION => 2;

    Readonly my $RESULT_PART_TWO_EXAMPLE =>
        AOC2020::Day04->get_valid_count_part_two($EXAMPLE_INPUT_REF);

    is( $RESULT_PART_TWO_EXAMPLE, $PART_TWO_EXAMPLE_SOLUTION,
        'Example solution of Part Two is correct.' );
};

subtest 'test_part_two_puzzle' => sub {
    plan tests => 1;

    Readonly my $PART_TWO_PUZZLE_SOLUTION => 133;

    Readonly my $RESULT_PART_TWO_PUZZLE =>
        AOC2020::Day04->get_valid_count_part_two($PUZZLE_INPUT_REF);

    is( $RESULT_PART_TWO_PUZZLE, $PART_TWO_PUZZLE_SOLUTION,
        'Puzzle solution of Part Two is correct.' );
};
