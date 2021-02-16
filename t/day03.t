#!/usr/bin/perl

use warnings;
use strict;
use version; our $VERSION = qv('1.0.3');
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day03;

my $inputfile = './day03_example';
my $input     = AOC2020::Common->get_file_content($inputfile);

my $slopes = {
  'slopeA' => { 'right' => 1, 'down' => 1 },
  'slopeB' => { 'right' => 3, 'down' => 1 },
  'slopeC' => { 'right' => 5, 'down' => 1 },
  'slopeD' => { 'right' => 7, 'down' => 1 },
  'slopeE' => { 'right' => 1, 'down' => 2 },
};

my $startPos = { 'x' => 0, 'y' => 0 };

subtest 'count trees on route for Part One' => sub {
  plan tests => 1;

  is(
    AOC2020::Day03->GetTreeCountForSlope(
      $input, $slopes->{'slopeB'}, $startPos
    ),
    7,
    'correct count'
  );
};

subtest 'count trees on routes for Part Two' => sub {
  plan tests => 1;

  is( AOC2020::Day03->GetProductOfTreeCounts( $input, $slopes, $startPos ),
    336, 'correct product for example' );
};
