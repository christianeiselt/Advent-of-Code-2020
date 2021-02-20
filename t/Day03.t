#!/usr/bin/perl

use warnings;
use strict;
use version; our $VERSION = qv('1.0.5');
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day03;

my $example_file  = './day03_example';
my $example_input = AOC2020::Common->get_file_content($example_file);
my $puzzle_file   = './day03_input';
my $puzzle_input  = AOC2020::Common->get_file_content($puzzle_file);

my $slopes = {
    'slopeA' => { 'right' => 1, 'down' => 1 },
    'slopeB' => { 'right' => 3, 'down' => 1 },
    'slopeC' => { 'right' => 5, 'down' => 1 },
    'slopeD' => { 'right' => 7, 'down' => 1 },
    'slopeE' => { 'right' => 1, 'down' => 2 },
};

my $startPos = { 'x' => 0, 'y' => 0 };

subtest 'count trees on route for Part One' => sub {
    plan tests => 2;

    is( AOC2020::Day03->get_tree_count_for_slope(
            $example_input, $slopes->{'slopeB'}, $startPos
        ),
        7,
        'correct tree count for example input'
    );
    is( AOC2020::Day03->get_tree_count_for_slope(
            $puzzle_input, $slopes->{'slopeB'}, $startPos
        ),
        228,
        'correct tree count for puzzle input'
    );
};

subtest 'count trees on routes for Part Two' => sub {
    plan tests => 2;

    is( AOC2020::Day03->get_product_of_tree_counts(
            $example_input, $slopes, $startPos
        ),
        336,
        'correct product for example input'
    );
    is( AOC2020::Day03->get_product_of_tree_counts(
            $puzzle_input, $slopes, $startPos
        ),
        6818112000,
        'correct product for puzzle input'
    );
};
