#!/usr/bin/perl

use warnings;
use strict;
use version; our $VERSION = qv('1.0.5');
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day01;

my $inputfile = './day01_example';
my $input     = AOC2020::Common->get_file_content($inputfile);

subtest 'testSolutionA' => sub {
  plan tests => 3;
  is( AOC2020::Day01->get_number_a( 1, $input ),
    1721, 'Solution A: Correct Number One.' );
  is( AOC2020::Day01->get_number_a( 2, $input ),
    299, 'Solution A: Correct Number Two.' );
  is( AOC2020::Day01->get_solution_a($input), 514579,
    'Solution A is correct.' );
};

subtest 'testSolutionB' => sub {
  plan tests => 4;
  is( AOC2020::Day01->get_number_b( 1, $input ),
    979, 'Solution B: Correct Number One.' );
  is( AOC2020::Day01->get_number_b( 2, $input ),
    366, 'Solution B: Correct Number Two.' );
  is( AOC2020::Day01->get_number_b( 3, $input ),
    675, 'Solution B: Correct Number Three.' );
  is( AOC2020::Day01->get_solution_b($input),
    241861950, 'Solution B is correct.' );
};
