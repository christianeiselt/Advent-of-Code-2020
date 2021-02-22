#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.5');
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day04;

Readonly my $EXAMPLE_FILE      => './day04_example';
Readonly my $EXAMPLE_INPUT_REF =>
    AOC2020::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_FILE      => './day04_input';
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);

subtest 'count valid passports for Part One' => sub {
    plan tests => 2;

    is( AOC2020::Day04->get_valid_count_part_one($EXAMPLE_INPUT_REF),
        2, 'returned correct count of valid passports for Part One' );
    is( AOC2020::Day04->get_valid_count_part_one($PUZZLE_INPUT_REF),
        245, 'returned correct count of valid passports for Part One' );
};

subtest 'count valid passports for Part Two' => sub {
    plan tests => 2;

    is( AOC2020::Day04->get_valid_count_part_two($EXAMPLE_INPUT_REF),
        2, 'returned correct count of valid passports for Part Two' );
    is( AOC2020::Day04->get_valid_count_part_two($PUZZLE_INPUT_REF),
        133, 'returned correct count of valid passports for Part Two'
    );
};
