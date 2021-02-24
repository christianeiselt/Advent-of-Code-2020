#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.11');
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day01;

Readonly my $EXAMPLE_FILE      => './day01_example';
Readonly my $EXAMPLE_INPUT_REF =>
    AOC2020::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_FILE      => './day01_input';
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);
Readonly my $NUMBER_COUNT_PART_ONE     => 2;
Readonly my $NUMBER_COUNT_PART_TWO     => 3;
Readonly my $TARGET_SUM                => 2_020;
Readonly my $PART_ONE_EXAMPLE_SOLUTION => 514_579;
Readonly my $PART_ONE_PUZZLE_SOLUTION  => 802_011;
Readonly my $PART_TWO_EXAMPLE_SOLUTION => 241_861_950;
Readonly my $PART_TWO_PUZZLE_SOLUTION  => 248_607_374;

subtest 'test_part_one' => sub {
    plan tests => 2;
    is( AOC2020::Day01->get_product_of_numbers_adding_to(
            $TARGET_SUM, $EXAMPLE_INPUT_REF, $NUMBER_COUNT_PART_ONE
        ),
        $PART_ONE_EXAMPLE_SOLUTION,
        'Example solution of Part One is correct.'
    );
    is( AOC2020::Day01->get_product_of_numbers_adding_to(
            $TARGET_SUM, $PUZZLE_INPUT_REF, $NUMBER_COUNT_PART_ONE
        ),
        $PART_ONE_PUZZLE_SOLUTION,
        'Puzzle solution of Part One is correct.'
    );
};

subtest 'test_part_two' => sub {
    plan tests => 2;
    is( AOC2020::Day01->get_product_of_numbers_adding_to(
            $TARGET_SUM, $EXAMPLE_INPUT_REF, $NUMBER_COUNT_PART_TWO
        ),
        $PART_TWO_EXAMPLE_SOLUTION,
        'Example solution of Part Two is correct.'
    );
    is( AOC2020::Day01->get_product_of_numbers_adding_to(
            $TARGET_SUM, $PUZZLE_INPUT_REF, $NUMBER_COUNT_PART_TWO
        ),
        $PART_TWO_PUZZLE_SOLUTION,
        'Puzzle solution of Part Two is correct.'
    );
};
