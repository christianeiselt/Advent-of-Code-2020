#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use Readonly;
use version; our $VERSION = qv('1.0.8');
use lib 'lib';
use AdventOfCode::Common;
use AdventOfCode::Day01;

Readonly my $NUMBER_COUNT_PART_ONE => 2;
Readonly my $NUMBER_COUNT_PART_TWO => 3;
Readonly my $TARGET_SUM            => 2020;
Readonly my $PUZZLE_FILE           => './day01_input';
Readonly my $PUZZLE_INPUT_REF      =>
    AdventOfCode::Common->get_file_content($PUZZLE_FILE);

Readonly my $SOLUTION_PART_ONE =>
    AdventOfCode::Day01->get_product_of_numbers_adding_to( $TARGET_SUM,
    $PUZZLE_INPUT_REF, $NUMBER_COUNT_PART_ONE );
Readonly my $SOLUTION_PART_TWO =>
    AdventOfCode::Day01->get_product_of_numbers_adding_to( $TARGET_SUM,
    $PUZZLE_INPUT_REF, $NUMBER_COUNT_PART_TWO );

print "Advent of Code 2020 - Day 01 Solutions: Part One: $SOLUTION_PART_ONE"
    . " / Part Two: $SOLUTION_PART_TWO\n"
    or croak 'no output available';
