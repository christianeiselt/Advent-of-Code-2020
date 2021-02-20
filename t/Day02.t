#!/usr/bin/perl

use warnings;
use strict;
use version; our $VERSION = qv('1.0.6');
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day02;

my $example_file  = './day02_example';
my $example_input = AOC2020::Common->get_file_content($example_file);
my $puzzle_file   = './day02_input';
my $puzzle_input  = AOC2020::Common->get_file_content($puzzle_file);

subtest 'count valid passwords for Part One' => sub {
    plan tests => 2;

    is( AOC2020::Day02->get_valid_password_count_for_part(
            1, $example_input
        ),
        2,
        'count 2 valid passwords'
    );
    is( AOC2020::Day02->get_valid_password_count_for_part( 1, $puzzle_input ),
        416,
        'count 416 valid passwords'
    );
};

subtest 'count valid passwords for Part Two' => sub {
    plan tests => 2;

    is( AOC2020::Day02->get_valid_password_count_for_part(
            2, $example_input
        ),
        1,
        'count 1 valid passwords'
    );
    is( AOC2020::Day02->get_valid_password_count_for_part( 2, $puzzle_input ),
        688,
        'count 688 valid passwords'
    );
};
