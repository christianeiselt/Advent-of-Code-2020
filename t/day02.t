#!/usr/bin/perl

use warnings;
use strict;
use Test::More tests => 2;

use lib '../lib/';
use AOC2020::Day02;

my @input = ('1-3 a: abcde','1-3 b: cdefg','2-9 c: ccccccccc');

subtest 'count valid passwords for Part One' => sub
{
  plan tests => 1;

  is(AOC2020::Day02->getValidPasswordCountForPart(1,\@input),2,'count 2 valid passwords');
};

subtest 'count valid passwords for Part Two' => sub
{
  plan tests => 1;

  is(AOC2020::Day02->getValidPasswordCountForPart(2,\@input),1,'count 1 valid passwords');
};
