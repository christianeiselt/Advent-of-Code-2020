#!/usr/bin/perl

use warnings;
use strict;
use lib './lib/';
use AOC2020::Common;
use AOC2020::Day03;

my $inputfile = './day03_input';
my $input = AOC2020::Common->getFileContent($inputfile);

my $slopes = {
  'slopeA' => {'right' => 1,'down' => 1},
  'slopeB' => {'right' => 3,'down' => 1},
  'slopeC' => {'right' => 5,'down' => 1},
  'slopeD' => {'right' => 7,'down' => 1},
  'slopeE' => {'right' => 1,'down' => 2},
};

my $startPos = {'x' => 0, 'y' => 0};
my $solutionA = AOC2020::Day03->GetTreeCountForSlope($input, $slopes->{'slopeB'}, $startPos);
print("Solution A: $solutionA\n");

my $solutionB = AOC2020::Day03->GetProductOfTreeCounts($input, $slopes, $startPos);
print("Solution B: $solutionB\n");
