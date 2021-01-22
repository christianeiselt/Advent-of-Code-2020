#!/usr/bin/perl

use warnings;
use strict;
use Test::More tests => 1;

use lib '../lib/';
use AOC2020::Common;

subtest 'testInput' => sub
{
  plan tests => 1;
  my $filename = 'misc/input.txt';
  my $content = AOC2020::Common->getFileContent($filename);
  is(@{$content}[0],2004,'Correct value returned.');
};

