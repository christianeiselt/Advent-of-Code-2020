#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.0');
use Test::More tests => 4;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day07;

Readonly my $EXAMPLE_FILE      => './day07_example';
Readonly my $PUZZLE_FILE       => './day07_input';
Readonly my $EXAMPLE_INPUT_REF =>
    AOC2020::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

subtest 'test_part_one_example' => sub {
    plan tests => 1;

    Readonly my $PART_ONE_EXAMPLE_SOLUTION => 4;
    Readonly my $BAG_NAME => 'shiny gold';

    Readonly my $HIGHEST_SEAT_ID =>
        AOC2020::Day07->get_bag_color_count($EXAMPLE_INPUT_REF, $BAG_NAME);

    is( $HIGHEST_SEAT_ID, $PART_ONE_EXAMPLE_SOLUTION,
        'Example solution of Part One is correct.' );
};

subtest 'test_part_one_puzzle' => sub {
    plan tests => 1;

    Readonly my $PART_ONE_PUZZLE_SOLUTION => 197;
    Readonly my $BAG_NAME => 'shiny gold';

    Readonly my $RESULT_PART_ONE_PUZZLE =>
        AOC2020::Day07->get_bag_color_count($PUZZLE_INPUT_REF, $BAG_NAME);

    is( $RESULT_PART_ONE_PUZZLE, $PART_ONE_PUZZLE_SOLUTION,
        'Puzzle solution of Part One is correct.' );
};

subtest 'test_part_two_puzzle' => sub {
    plan tests => 1;

    Readonly my $PART_TWO_PUZZLE_SOLUTION => 32;
    Readonly my $BAG_NAME => 'shiny gold';

    Readonly my $RESULT_PART_TWO_PUZZLE =>
        AOC2020::Day07->get_inside_bags_count($EXAMPLE_INPUT_REF, $BAG_NAME);

    is( $RESULT_PART_TWO_PUZZLE, $PART_TWO_PUZZLE_SOLUTION,
        'Puzzle solution of Part Two is correct.' );
};

subtest 'test_part_two_puzzle' => sub {
    plan tests => 1;

    Readonly my $PART_TWO_PUZZLE_SOLUTION => 85324;
    Readonly my $BAG_NAME => 'shiny gold';

    Readonly my $RESULT_PART_TWO_PUZZLE =>
        AOC2020::Day07->get_inside_bags_count($PUZZLE_INPUT_REF, $BAG_NAME);

    is( $RESULT_PART_TWO_PUZZLE, $PART_TWO_PUZZLE_SOLUTION,
        'Puzzle solution of Part Two is correct.' );
};
