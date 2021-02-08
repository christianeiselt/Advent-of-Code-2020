#!/usr/bin/perl

use warnings;
use strict;
use lib './lib/';
use AOC2020::Common;
use AOC2020::Day04;
use Data::Dumper;

#my $string = '193cm';
#print(Dumper($value));
my $inputfile = './day04_input';
my $input = AOC2020::Common->getFileContent($inputfile);



my $solutionA = AOC2020::Day04->getValidCountPartOne($input);
print("Solution A: $solutionA\n");

my $solutionB = AOC2020::Day04->getValidCountPartTwo($input);
print("Solution B: $solutionB\n");
