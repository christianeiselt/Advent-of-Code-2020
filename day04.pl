#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use version; our $VERSION = qv('1.0.2');
use lib 'lib';
use AOC2020::Common;
use AOC2020::Day04;

my $inputfile = './day04_input';
my $input     = AOC2020::Common->get_file_content($inputfile);

my $SOLUTION_A = AOC2020::Day04->getValidCountPartOne($input);
print "Solution A: $SOLUTION_A\n" or croak 'no output available';

my $SOLUTION_B = AOC2020::Day04->getValidCountPartTwo($input);
print "Solution B: $SOLUTION_B\n" or croak 'no output available';
