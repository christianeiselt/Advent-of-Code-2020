#!/usr/bin/perl

use warnings;
use strict;
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day04;

my $inputfile = './day04_example';
my $input = AOC2020::Common->getFileContent($inputfile);
my $inputfile2 = './day04_input';
my $input2 = AOC2020::Common->getFileContent($inputfile2);


my $newPassport = {
  "ecl" => undef,
  "pid" => undef,
  "eyr" => undef,
  "hcl" => undef,
  "byr" => undef,
  "iyr" => undef,
  "hgt" => undef,
};

subtest 'count valid passports for Part One' => sub
{
  plan tests => 2;

  is(AOC2020::Day04->getValidCountPartOne($input), 2, 'returned correct count of valid passports for Part One');
  is(AOC2020::Day04->getValidCountPartOne($input2), 245, 'returned correct count of valid passports for Part One');
};

subtest 'count valid passports for Part Two' => sub
{
  plan tests => 2;

  is(AOC2020::Day04->getValidCountPartTwo($input), 2,'returned correct count of valid passports for Part Two');
  is(AOC2020::Day04->getValidCountPartTwo($input2), 133,'returned correct count of valid passports for Part Two');
};
