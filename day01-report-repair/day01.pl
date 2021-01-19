#!/usr/bin/perl

use warnings;
use strict;
use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day01;

my $inputfile = './input.txt';
my $input = AOC2020::Common->getFileContent($inputfile);

my $solutionA = AOC2020::Day01->getSolutionA($input);
my $solutionB = AOC2020::Day01->getSolutionB($input);

print("Solution A: $solutionA\n");
print("Solution B: $solutionB\n");
