#!/usr/bin/perl

use warnings;
use strict;
use version; our $VERSION = qv('1.0.4');
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day02;

my $inputfile = './day02_example';
my $input     = AOC2020::Common->get_file_content($inputfile);

subtest 'count valid passwords for Part One' => sub {
  plan tests => 1;

  is( AOC2020::Day02->get_valid_password_count_for_part( 1, $input ),
    2, 'count 2 valid passwords' );
};

subtest 'count valid passwords for Part Two' => sub {
  plan tests => 1;

  is( AOC2020::Day02->get_valid_password_count_for_part( 2, $input ),
    1, 'count 1 valid passwords' );
};
