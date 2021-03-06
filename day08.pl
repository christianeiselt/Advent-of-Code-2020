#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use Readonly;
use version; our $VERSION = qv('1.0.0');
use lib 'lib';
use AOC2020::Common;
use AOC2020::Day08;

Readonly my $DAY              => 'Day 08';
Readonly my $PUZZLE_FILE      => './day08_input';
Readonly my $PUZZLE_INPUT_REF =>
  AOC2020::Common->get_file_content($PUZZLE_FILE);
Readonly my $SOLUTION_PART_ONE =>
  AOC2020::Day08->solve_part_1($PUZZLE_INPUT_REF);
Readonly my $SOLUTION_PART_TWO =>
  AOC2020::Day08->solve_part_2($PUZZLE_INPUT_REF);

print "Advent of Code 2020 - $DAY Solutions: Part One: $SOLUTION_PART_ONE"
  . " / Part Two: $SOLUTION_PART_TWO\n"
  or croak 'no output available';
