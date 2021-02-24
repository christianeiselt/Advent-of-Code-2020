#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.10');
use Test::More tests => 4;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day03;

Readonly my $EXAMPLE_FILE  => './day03_example';
Readonly my $PUZZLE_FILE   => './day03_input';
Readonly my $START_POS_REF => { 'x' => 0, 'y' => 0 };
Readonly my $SLOPES_REF    => {
    'slope_a' => { 'right' => 1, 'down' => 1 },
    'slope_b' => { 'right' => 3, 'down' => 1 },
    'slope_c' => { 'right' => 5, 'down' => 1 },
    'slope_d' => { 'right' => 7, 'down' => 1 },
    'slope_e' => { 'right' => 1, 'down' => 2 },
};
Readonly my $EXAMPLE_INPUT_REF =>
    AOC2020::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

subtest 'test_part_one_example' => sub {
    plan tests => 1;

    Readonly my $PART_ONE_EXAMPLE_SOLUTION => 7;

    Readonly my $RESULT_PART_ONE_EXAMPLE =>
        AOC2020::Day03->get_tree_count_for_slope( $EXAMPLE_INPUT_REF,
        $SLOPES_REF->{'slope_b'},
        $START_POS_REF );

    is( $RESULT_PART_ONE_EXAMPLE, $PART_ONE_EXAMPLE_SOLUTION,
        'Example solution of Part One is correct.' );
};

subtest 'test_part_one_puzzle' => sub {
    plan tests => 1;

    Readonly my $PART_ONE_PUZZLE_SOLUTION => 228;

    Readonly my $RESULT_PART_ONE_PUZZLE =>
        AOC2020::Day03->get_tree_count_for_slope( $PUZZLE_INPUT_REF,
        $SLOPES_REF->{'slope_b'},
        $START_POS_REF );

    is( $RESULT_PART_ONE_PUZZLE, $PART_ONE_PUZZLE_SOLUTION,
        'Puzzle solution of Part One is correct.' );
};

subtest 'test_part_two_example' => sub {
    plan tests => 1;

    Readonly my $PART_TWO_EXAMPLE_SOLUTION => 336;

    Readonly my $RESULT_PART_TWO_EXAMPLE =>
        AOC2020::Day03->get_product_of_tree_counts( $EXAMPLE_INPUT_REF,
        $SLOPES_REF, $START_POS_REF );

    is( $RESULT_PART_TWO_EXAMPLE, $PART_TWO_EXAMPLE_SOLUTION,
        'Example solution of Part Two is correct.' );
};

subtest 'test_part_two_puzzle' => sub {
    plan tests => 1;

    Readonly my $PART_TWO_PUZZLE_SOLUTION => 6_818_112_000;

    Readonly my $RESULT_PART_TWO_PUZZLE =>
        AOC2020::Day03->get_product_of_tree_counts( $PUZZLE_INPUT_REF,
        $SLOPES_REF, $START_POS_REF );

    is( $RESULT_PART_TWO_PUZZLE, $PART_TWO_PUZZLE_SOLUTION,
        'Puzzle solution of Part Two is correct.' );
};
