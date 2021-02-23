#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.8');
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day02;

Readonly my $EXAMPLE_FILE      => './day02_example';
Readonly my $EXAMPLE_INPUT_REF =>
    AOC2020::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_FILE      => './day02_input';
Readonly my $PUZZLE_INPUT_REF =>
    AOC2020::Common->get_file_content($PUZZLE_FILE);
Readonly my $PART_ONE => 1;
Readonly my $PART_TWO => 2;

subtest 'count valid passwords for Part One' => sub {
    plan tests => 2;

    is( AOC2020::Day02->get_valid_password_count_for_part(
            $PART_ONE, $EXAMPLE_INPUT_REF
        ),
        2,
        'count 2 valid passwords'
    );
    is( AOC2020::Day02->get_valid_password_count_for_part(
            $PART_ONE, $PUZZLE_INPUT_REF
        ),
        416,
        'count 416 valid passwords'
    );
};

subtest 'count valid passwords for Part Two' => sub {
    plan tests => 2;

    is( AOC2020::Day02->get_valid_password_count_for_part(
            $PART_TWO, $EXAMPLE_INPUT_REF
        ),
        1,
        'count 1 valid passwords'
    );
    is( AOC2020::Day02->get_valid_password_count_for_part(
            $PART_TWO, $PUZZLE_INPUT_REF
        ),
        688,
        'count 688 valid passwords'
    );
};
