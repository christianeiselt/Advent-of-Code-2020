#!/usr/bin/perl

use warnings;
use strict;
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Common;
use AOC2020::Day01;

subtest 'testSolutionA' => sub
{
  plan tests => 3;
  my @input = (1721,979,366,299,675,1456);
  is(AOC2020::Day01->getNumberA(1,\@input),1721,'Solution A: Correct Number One.');
  is(AOC2020::Day01->getNumberA(2,\@input),299,'Solution A: Correct Number Two.');
  is(AOC2020::Day01->getSolutionA(\@input),514579,'Solution A is correct.');
};

subtest 'testSolutionB' => sub
{
  plan tests => 4;
  my @input = (1721,979,366,299,675,1456);
  is(AOC2020::Day01->getNumberB(1,\@input),979,'Solution B: Correct Number One.');
  is(AOC2020::Day01->getNumberB(2,\@input),366,'Solution B: Correct Number Two.');
  is(AOC2020::Day01->getNumberB(3,\@input),675,'Solution B: Correct Number Three.');
  is(AOC2020::Day01->getSolutionB(\@input),241861950,'Solution B is correct.');
};
