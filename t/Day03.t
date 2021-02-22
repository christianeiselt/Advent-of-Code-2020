#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.9');
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day03;

Readonly my $EXAMPLE_FILE      => './day03_example';
Readonly my $EXAMPLE_INPUT_REF =>
    AOC2020::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_FILE      => './day03_input';
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

Readonly my $SLOPES_REF => {
    'slope_a' => { 'right' => 1, 'down' => 1 },
    'slope_b' => { 'right' => 3, 'down' => 1 },
    'slope_c' => { 'right' => 5, 'down' => 1 },
    'slope_d' => { 'right' => 7, 'down' => 1 },
    'slope_e' => { 'right' => 1, 'down' => 2 },
};

Readonly my $START_POS_REF => { 'x' => 0, 'y' => 0 };

subtest 'count trees on route for Part One' => sub {
    plan tests => 2;

    is( AOC2020::Day03->get_tree_count_for_slope(
            $EXAMPLE_INPUT_REF, $SLOPES_REF->{'slope_b'},
            $START_POS_REF
        ),
        7,
        'correct tree count for example input'
    );
    is( AOC2020::Day03->get_tree_count_for_slope(
            $PUZZLE_INPUT_REF, $SLOPES_REF->{'slope_b'},
            $START_POS_REF
        ),
        228,
        'correct tree count for puzzle input'
    );
};

subtest 'count trees on routes for Part Two' => sub {
    plan tests => 2;

    is( AOC2020::Day03->get_product_of_tree_counts(
            $EXAMPLE_INPUT_REF, $SLOPES_REF, $START_POS_REF
        ),
        336,
        'correct product for example input'
    );
    is( AOC2020::Day03->get_product_of_tree_counts(
            $PUZZLE_INPUT_REF, $SLOPES_REF, $START_POS_REF
        ),
        6818112000,
        'correct product for puzzle input'
    );
};
