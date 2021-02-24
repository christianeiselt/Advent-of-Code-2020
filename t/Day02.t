#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.9');
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
Readonly my $PART_ONE_EXAMPLE_SOLUTION => 2;
Readonly my $PART_ONE_PUZZLE_SOLUTION  => 416;
Readonly my $PART_TWO_EXAMPLE_SOLUTION => 1;
Readonly my $PART_TWO_PUZZLE_SOLUTION  => 688;

subtest 'count valid passwords for Part One' => sub {
    plan tests => 2;

    is( AOC2020::Day02->get_valid_password_count_for_part(
            $PART_ONE, $EXAMPLE_INPUT_REF
        ),
        $PART_ONE_EXAMPLE_SOLUTION,
        'Example solution of Part One is correct.'
    );
    is( AOC2020::Day02->get_valid_password_count_for_part(
            $PART_ONE, $PUZZLE_INPUT_REF
        ),
        $PART_ONE_PUZZLE_SOLUTION,
        'Puzzle solution of Part One is correct.'
    );
};

subtest 'count valid passwords for Part Two' => sub {
    plan tests => 2;

    is( AOC2020::Day02->get_valid_password_count_for_part(
            $PART_TWO, $EXAMPLE_INPUT_REF
        ),
        $PART_TWO_EXAMPLE_SOLUTION,
        'Example solution of Part Two is correct.'
    );
    is( AOC2020::Day02->get_valid_password_count_for_part(
            $PART_TWO, $PUZZLE_INPUT_REF
        ),
        $PART_TWO_PUZZLE_SOLUTION,
        'Puzzle solution of Part Two is correct.'
    );
};
