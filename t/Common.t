#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.5');
use Test::More tests => 1;

use lib '../lib/';
use AOC2020::Common;

subtest 'testInput' => sub {
    plan tests             => 1;
    Readonly my $FILE_NAME => 'misc/input.txt';
    Readonly my $FINDING   => 2004;
    Readonly my $CONTENT   => AOC2020::Common->get_file_content($FILE_NAME);
    is( @{$CONTENT}[0], $FINDING, 'Correct value returned.' );
};
