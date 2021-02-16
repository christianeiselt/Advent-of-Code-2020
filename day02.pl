#!/usr/bin/perl

use warnings;
use strict;
use Carp;
use version; our $VERSION = qv('1.0.3');
use lib 'lib';
use AOC2020::Common;
use AOC2020::Day02;

my $inputfile = './day02_input';
my $input     = AOC2020::Common->get_file_content($inputfile);

my $SOLUTION_A = AOC2020::Day02->getValidPasswordCountForPart( 1, $input );
my $SOLUTION_B = AOC2020::Day02->getValidPasswordCountForPart( 2, $input );

print "Solution A: $SOLUTION_A\n" or croak 'no output available';
print "Solution B: $SOLUTION_B\n" or croak 'no output available';
