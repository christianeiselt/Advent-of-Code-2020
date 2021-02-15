#!/usr/bin/perl

use warnings;
use strict;
use version; our $VERSION = qv('1.0.2');
use Test::More tests => 1;

use lib '../lib/';
use AOC2020::Common;

subtest 'testInput' => sub {
  plan tests => 1;
  my $filename = 'misc/input.txt';
  my $finding  = 2004;
  my $content  = AOC2020::Common->getFileContent($filename);
  is( @{$content}[0], $finding, 'Correct value returned.' );
};

