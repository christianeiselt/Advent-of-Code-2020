#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.6');
use Test::More tests => 4;

use lib '../lib/';
use AOC2020::Common;

subtest 'test_get_file_content_ok' => sub {
    plan tests             => 1;
    Readonly my $FILE_NAME => 'misc/input.txt';
    Readonly my $FINDING   => 2004;
    Readonly my $CONTENT   => AOC2020::Common->get_file_content($FILE_NAME);
    is( @{$CONTENT}[0], $FINDING, 'Correct value returned.' );
};

subtest 'test_list_contains_number_empty_list' => sub {
    plan tests            => 1;
    Readonly my $LIST_REF => [];
    Readonly my $NUMBER   => 5;

    Readonly my $CONTAINS_NUMBER =>
        AOC2020::Common->list_contains_number( $LIST_REF, $NUMBER );

    is( $CONTAINS_NUMBER, 0, 'Returns correct value false for empty list.' );
};

subtest 'test_list_contains_number_true' => sub {
    plan tests            => 1;
    Readonly my $LIST_REF => [ 35, 15, 5 ];
    Readonly my $NUMBER   => 5;

    Readonly my $CONTAINS_NUMBER =>
        AOC2020::Common->list_contains_number( $LIST_REF, $NUMBER );

    is( $CONTAINS_NUMBER, 1,
        'Returns correct value true for list that contains number.' );
};

subtest 'test_list_contains_number_false' => sub {
    plan tests            => 1;
    Readonly my $LIST_REF => [ 35, 25, 15 ];
    Readonly my $NUMBER   => 5;

    Readonly my $CONTAINS_NUMBER =>
        AOC2020::Common->list_contains_number( $LIST_REF, $NUMBER );

    is( $CONTAINS_NUMBER, 0,
        'Returns correct value false for list that does not contain number.'
    );
};
