#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('0.0.1');
use Test::More tests => 1;

use lib '../lib/';
use AdventOfCode::Day08;

subtest 'get_list_count' => sub {
    plan tests => 1;

    Readonly my $INPUT_REF  => [ 0, 1, 2, 3 ];
    Readonly my $EXPECTED   => 4;
    Readonly my $RESULT_REF => AdventOfCode::Day08->get_list_count($INPUT_REF);
    is_deeply( $RESULT_REF, $EXPECTED, 'ok' );
};
