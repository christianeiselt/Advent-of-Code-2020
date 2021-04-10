#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use Readonly;
use version; our $VERSION = qv('1.0.1');
use lib 'lib';
use AdventOfCode::Common;
use AdventOfCode::Day07;

Readonly my $DAY               => 'Day 07';
Readonly my $PUZZLE_FILE       => './day07_input';
Readonly my $PUZZLE_INPUT_REF  => AdventOfCode::Common->get_file_content($PUZZLE_FILE);
Readonly my $BAG_NAME          => 'shiny gold';
Readonly my $SOLUTION_PART_ONE => AdventOfCode::Day07->get_bag_color_count( $PUZZLE_INPUT_REF, $BAG_NAME );
Readonly my $SOLUTION_PART_TWO => AdventOfCode::Day07->get_inside_bags_count( $PUZZLE_INPUT_REF, $BAG_NAME );

print "Advent of Code 2020 - $DAY Solutions: Part One: $SOLUTION_PART_ONE" . " / Part Two: $SOLUTION_PART_TWO\n"
    or croak 'no output available';
