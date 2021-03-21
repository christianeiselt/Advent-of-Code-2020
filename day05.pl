#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use Readonly;
use version; our $VERSION = qv('1.0.0');
use lib 'lib';
use AdventOfCode::Common;
use AdventOfCode::Day05;

Readonly my $PUZZLE_FILE      => './day05_input';
Readonly my $PUZZLE_INPUT_REF =>
    AdventOfCode::Common->get_file_content($PUZZLE_FILE);

Readonly my $SOLUTION_PART_ONE =>
    AdventOfCode::Day05->get_highest_seat_id($PUZZLE_INPUT_REF);
Readonly my $SOLUTION_PART_TWO =>
    AdventOfCode::Day05->get_my_seat_id($PUZZLE_INPUT_REF);

print "Advent of Code 2020 - Day 05 Solutions: Part One: $SOLUTION_PART_ONE"
    . " / Part Two: $SOLUTION_PART_TWO\n"
    or croak 'no output available';
