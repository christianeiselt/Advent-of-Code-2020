#!/usr/bin/perl

use warnings;
use strict;
use lib './lib/';
use AOC2020::Common;
use AOC2020::Day02;

my $inputfile = './day02_input';
my $input = AOC2020::Common->getFileContent($inputfile);

my $solutionA = AOC2020::Day02->getValidPasswordCountForPart(1, $input);
my $solutionB = AOC2020::Day02->getValidPasswordCountForPart(2, $input);

print("Solution A: $solutionA\n");
print("Solution B: $solutionB\n");
