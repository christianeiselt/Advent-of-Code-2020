#!/usr/bin/perl

use warnings;
use strict;
use version; our $VERSION = qv('1.0.3');
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day04;

my $inputfile = './day04_example';
my $input     = AOC2020::Common->get_file_content($inputfile);

subtest 'count valid passports for Part One' => sub {
  plan tests => 1;

  is( AOC2020::Day04->getValidCountPartOne($input),
    2, 'returned correct count of valid passports for Part One' );
};

subtest 'count valid passports for Part Two' => sub {
  plan tests => 1;

  is( AOC2020::Day04->getValidCountPartTwo($input),
    2, 'returned correct count of valid passports for Part Two' );
};
