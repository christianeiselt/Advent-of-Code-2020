#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use Readonly;
use version; our $VERSION = qv('1.0.7');
use lib 'lib';
use AdventOfCode::Common;
use AdventOfCode::Day04;

Readonly my $PUZZLE_FILE      => './day04_input';
Readonly my $PUZZLE_INPUT_REF => AdventOfCode::Common->get_file_content($PUZZLE_FILE);

Readonly my $SOLUTION_PART_ONE => AdventOfCode::Day04->get_valid_count_part_one($PUZZLE_INPUT_REF);
Readonly my $SOLUTION_PART_TWO => AdventOfCode::Day04->get_valid_count_part_two($PUZZLE_INPUT_REF);

print "Advent of Code 2020 - Day 04 Solutions: Part One: $SOLUTION_PART_ONE" . " / Part Two: $SOLUTION_PART_TWO\n"
    or croak 'no output available';
