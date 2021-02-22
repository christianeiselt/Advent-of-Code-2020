#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.10');
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
Readonly my $NUMBER_COUNT_PART_ONE => 2;
Readonly my $NUMBER_COUNT_PART_TWO => 3;
Readonly my $TARGET_SUM            => 2020;

subtest 'testSolutionA' => sub {
    plan tests => 2;
    is( AOC2020::Day01->get_product_of_numbers_adding_to(
            $TARGET_SUM, $EXAMPLE_INPUT_REF, $NUMBER_COUNT_PART_ONE
        ),
        514579,
        'Solution A (Example) is correct.'
    );
    is( AOC2020::Day01->get_product_of_numbers_adding_to(
            $TARGET_SUM, $PUZZLE_INPUT_REF, $NUMBER_COUNT_PART_ONE
        ),
        802011,
        'Solution A is correct.'
    );
};

subtest 'testSolutionB' => sub {
    plan tests => 2;
    is( AOC2020::Day01->get_product_of_numbers_adding_to(
            $TARGET_SUM, $EXAMPLE_INPUT_REF, $NUMBER_COUNT_PART_TWO
        ),
        241861950,
        'Solution B (Example) is correct.'
    );
    is( AOC2020::Day01->get_product_of_numbers_adding_to(
            $TARGET_SUM, $PUZZLE_INPUT_REF, $NUMBER_COUNT_PART_TWO
        ),
        248607374,
        'Solution B is correct.'
    );
};
