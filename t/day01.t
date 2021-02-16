#!/usr/bin/perl

use warnings;
use strict;
use version; our $VERSION = qv('1.0.6');
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day01;

my $example_file  = './day01_example';
my $example_input = AOC2020::Common->get_file_content($example_file);
my $puzzle_file   = './day01_input';
my $puzzle_input  = AOC2020::Common->get_file_content($puzzle_file);

subtest 'testSolutionA' => sub {
  plan tests => 4;
  is( AOC2020::Day01->get_number_a( 1, $example_input ),
    1721, 'Solution A: Correct Number One.' );
  is( AOC2020::Day01->get_number_a( 2, $example_input ),
    299, 'Solution A: Correct Number Two.' );
  is( AOC2020::Day01->get_solution_a($example_input),
    514579, 'Solution A (Example) is correct.' );
  is( AOC2020::Day01->get_solution_a($puzzle_input),
    802011, 'Solution A is correct.' );
};

subtest 'testSolutionB' => sub {
  plan tests => 5;
  is( AOC2020::Day01->get_number_b( 1, $example_input ),
    979, 'Solution B: Correct Number One.' );
  is( AOC2020::Day01->get_number_b( 2, $example_input ),
    366, 'Solution B: Correct Number Two.' );
  is( AOC2020::Day01->get_number_b( 3, $example_input ),
    675, 'Solution B: Correct Number Three.' );
  is( AOC2020::Day01->get_solution_b($example_input),
    241861950, 'Solution B (Example) is correct.' );
  is( AOC2020::Day01->get_solution_b($puzzle_input),
    248607374, 'Solution B is correct.' );
};
