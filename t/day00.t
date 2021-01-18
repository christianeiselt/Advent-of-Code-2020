#!/usr/bin/perl

use strict;
use Test::More tests => 1;

use lib '../lib/';
use AOC2020::Day00;

is(AOC2020::Day00->GetSolution(),42,'Solution is correct.');
