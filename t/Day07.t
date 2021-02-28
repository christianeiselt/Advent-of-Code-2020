#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.0');
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day07;

Readonly my $EXAMPLE_FILE_1      => './day07_example1';
Readonly my $EXAMPLE_FILE_2      => './day07_example2';
Readonly my $PUZZLE_FILE       => './day07_input';
Readonly my $EXAMPLE_INPUT_1_REF =>
    AOC2020::Common->get_file_content($EXAMPLE_FILE_1);
Readonly my $EXAMPLE_INPUT_2_REF =>
    AOC2020::Common->get_file_content($EXAMPLE_FILE_2);
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

subtest 'test_part_one_example' => sub {
    plan tests => 1;

    Readonly my $PART_ONE_EXAMPLE_SOLUTION => 4;
    Readonly my $BAG_NAME => 'shiny gold';

    Readonly my $HIGHEST_SEAT_ID =>
        AOC2020::Day07->get_bag_color_count($EXAMPLE_INPUT_1_REF, $BAG_NAME);

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

#subtest 'test_part_two_puzzle' => sub {
#    plan tests => 1;
#
#    Readonly my $PART_TWO_PUZZLE_SOLUTION => 6;
#
#    Readonly my $RESULT_PART_TWO_PUZZLE =>
#        AOC2020::Day07->get_inside_bags_count($EXAMPLE_INPUT_1_REF);
#
#    is( $RESULT_PART_TWO_PUZZLE, $PART_TWO_PUZZLE_SOLUTION,
#        'Puzzle solution of Part Two is correct.' );
#};

#subtest 'test_part_two_puzzle' => sub {
#    plan tests => 1;
#
#    Readonly my $PART_TWO_PUZZLE_SOLUTION => 3316;
#
#    Readonly my $RESULT_PART_TWO_PUZZLE =>
#        AOC2020::Day07->solve_part_2($PUZZLE_INPUT_REF);
#
#    is( $RESULT_PART_TWO_PUZZLE, $PART_TWO_PUZZLE_SOLUTION,
#        'Puzzle solution of Part Two is correct.' );
#};
