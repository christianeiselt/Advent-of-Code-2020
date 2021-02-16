#!/usr/bin/perl

use warnings;
use strict;
use version; our $VERSION = qv('1.0.3');
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day04;

my $example_file  = './day04_example';
my $example_input = AOC2020::Common->get_file_content($example_file);
my $puzzle_file   = './day04_input';
my $puzzle_input  = AOC2020::Common->get_file_content($puzzle_file);

subtest 'count valid passports for Part One' => sub {
  plan tests => 2;

  is( AOC2020::Day04->get_valid_count_part_one($example_input),
    2, 'returned correct count of valid passports for Part One' );
  is( AOC2020::Day04->get_valid_count_part_one($puzzle_input),
    245, 'returned correct count of valid passports for Part One' );
};

subtest 'count valid passports for Part Two' => sub {
  plan tests => 2;

  is( AOC2020::Day04->get_valid_count_part_two($example_input),
    2, 'returned correct count of valid passports for Part Two' );
  is( AOC2020::Day04->get_valid_count_part_two($puzzle_input),
    133, 'returned correct count of valid passports for Part Two' );
};
