#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.9');
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

subtest 'testSolutionA' => sub {
    plan tests => 4;
    is( AOC2020::Day01->get_number_a( 'NUMBER_ONE', $EXAMPLE_INPUT_REF ),
        1721, 'Solution A: Correct Number One.' );
    is( AOC2020::Day01->get_number_a( 'NUMBER_TWO', $EXAMPLE_INPUT_REF ),
        299, 'Solution A: Correct Number Two.' );
    is( AOC2020::Day01->get_solution_a($EXAMPLE_INPUT_REF),
        514579, 'Solution A (Example) is correct.' );
    is( AOC2020::Day01->get_solution_a($PUZZLE_INPUT_REF),
        802011, 'Solution A is correct.' );
};

subtest 'testSolutionB' => sub {
    plan tests => 5;
    is( AOC2020::Day01->get_number_b( 'NUMBER_ONE', $EXAMPLE_INPUT_REF ),
        979, 'Solution B: Correct Number One.' );
    is( AOC2020::Day01->get_number_b( 'NUMBER_TWO', $EXAMPLE_INPUT_REF ),
        366, 'Solution B: Correct Number Two.' );
    is( AOC2020::Day01->get_number_b( 'NUMBER_THREE', $EXAMPLE_INPUT_REF ),
        675, 'Solution B: Correct Number Three.' );
    is( AOC2020::Day01->get_solution_b($EXAMPLE_INPUT_REF),
        241861950, 'Solution B (Example) is correct.' );
    is( AOC2020::Day01->get_solution_b($PUZZLE_INPUT_REF),
        248607374, 'Solution B is correct.'
    );
};
