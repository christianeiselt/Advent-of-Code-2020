#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('0.1.12');
use Test::More tests => 19;

use lib '../lib/';
use AdventOfCode::Day10;

subtest 'prepare_counter' => sub {
    plan tests => 1;

    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $EXPECTED_REF => {
        'count'       => -1,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $RESULT_REF => AdventOfCode::Day10->prepare_counter();
    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'add_difference_for_builtin_adapter' => sub {
    plan tests => 1;

    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $COUNTER_REF  => {
        'count'       => -1,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $EXPECTED_REF => {
        'count'       => -1,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 1,
    };
    Readonly my $RESULT_REF => AdventOfCode::Day10->add_difference_for_builtin_adapter($COUNTER_REF);
    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'increment_count' => sub {
    plan tests                => 1;
    Readonly my $COUNTER_REF  => { 'count' => -1, };
    Readonly my $EXPECTED_REF => { 'count' => 0, };
    Readonly my $RESULT_REF   => AdventOfCode::Day10->increment_count($COUNTER_REF);

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'set_occupied' => sub {
    plan tests => 1;

    Readonly my $EXPECTED => 1;
    Readonly my $RESULT   => AdventOfCode::Day10->set_occupied();

    is( $RESULT, $EXPECTED, 'ok' );
};

subtest 'set_zero' => sub {
    plan tests => 1;

    Readonly my $EXPECTED => 0;
    Readonly my $RESULT   => AdventOfCode::Day10->set_zero();

    is( $EXPECTED, $RESULT, 'ok' );
};

subtest 'reset_count' => sub {
    plan tests => 1;

    Readonly my $COUNTER_REF  => { 'count' => -1, };
    Readonly my $EXPECTED_REF => { 'count' => 0, };
    Readonly my $RESULT_REF   => AdventOfCode::Day10->reset_count($COUNTER_REF);

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'get_marked_list' => sub {
    plan tests => 1;

    Readonly my $LIST_REF     => [ 1,     2 ];
    Readonly my $EXPECTED_REF => [ undef, 1, 1 ];
    Readonly my $RESULT_REF   => AdventOfCode::Day10->get_marked_list($LIST_REF);

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'increment_difference_count' => sub {
    plan tests => 1;

    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $COUNTER_REF  => {
        'count'       => -1,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $EXPECTED_REF => {
        'count'       => -1,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 1,
    };
    Readonly my $DIFFERENCE => 3;
    Readonly my $RESULT_REF => AdventOfCode::Day10->increment_difference_count( $COUNTER_REF, $DIFFERENCE_3 );

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'get_counter_for_defined - -1' => sub {
    plan tests => 1;

    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $COUNTER_REF  => {
        'count'       => -1,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $EXPECTED_REF => {
        'count'       => 0,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $RESULT_REF => AdventOfCode::Day10->get_counter_for_defined($COUNTER_REF);

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'get_counter_for_defined - 0' => sub {
    plan tests => 1;

    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $COUNTER_REF  => {
        'count'       => 0,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $EXPECTED_REF => {
        'count'       => 0,
        $DIFFERENCE_1 => 1,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $RESULT_REF => AdventOfCode::Day10->get_counter_for_defined($COUNTER_REF);

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'get_counter_for_defined - 1' => sub {
    plan tests => 1;

    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $COUNTER_REF  => {
        'count'       => 1,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $EXPECTED_REF => {
        'count'       => 2,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $RESULT_REF => AdventOfCode::Day10->get_counter_for_defined($COUNTER_REF);

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'get_counter_for_defined - 2' => sub {
    plan tests => 1;

    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $COUNTER_REF  => {
        'count'       => 2,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $EXPECTED_REF => {
        'count'       => 0,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 1,
    };
    Readonly my $RESULT_REF => AdventOfCode::Day10->get_counter_for_defined($COUNTER_REF);

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'set_difference_count - 0' => sub {
    plan tests => 1;

    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $COUNTER_REF  => {
        'count'       => 0,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $EXPECTED_REF => {
        'count'       => 0,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $RESULT_REF => AdventOfCode::Day10->set_difference_count($COUNTER_REF);

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'set_difference_count - 1' => sub {
    plan tests => 1;

    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $COUNTER_REF  => {
        'count'       => 1,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $EXPECTED_REF => {
        'count'       => 0,
        $DIFFERENCE_1 => 1,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $RESULT_REF => AdventOfCode::Day10->set_difference_count($COUNTER_REF);

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'set_difference_count - 2' => sub {
    plan tests => 1;

    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $COUNTER_REF  => {
        'count'       => 2,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $EXPECTED_REF => {
        'count'       => 2,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $RESULT_REF => AdventOfCode::Day10->set_difference_count($COUNTER_REF);

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'set_difference_count - 3' => sub {
    plan tests => 1;

    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $COUNTER_REF  => {
        'count'       => 3,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };
    Readonly my $EXPECTED_REF => {
        'count'       => 0,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 1,
    };
    Readonly my $RESULT_REF => AdventOfCode::Day10->set_difference_count($COUNTER_REF);

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'get_counter' => sub {
    plan tests => 1;

    Readonly my $ITERATOR     => 3;
    Readonly my $INPUT_REF    => [ 0, 1, 2, 3 ];
    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $COUNTER_REF  => {
        'count'       => 3,
        $DIFFERENCE_1 => 1,
        $DIFFERENCE_3 => 2,
    };
    Readonly my $EXPECTED_REF => {
        'count'       => 4,
        $DIFFERENCE_1 => 1,
        $DIFFERENCE_3 => 2,
    };
    Readonly my $RESULT_REF => AdventOfCode::Day10->get_counter( $INPUT_REF, $ITERATOR, $COUNTER_REF );

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'get_difference_counters' => sub {
    plan tests => 1;

    Readonly my $INPUT_REF    => [ 0, 1, 2, 3 ];
    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $EXPECTED_REF => {
        'count'       => 1,
        $DIFFERENCE_1 => 3,
        $DIFFERENCE_3 => 1,
    };
    Readonly my $RESULT_REF => AdventOfCode::Day10->get_difference_counters($INPUT_REF);

    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'get_differences_product' => sub {
    plan tests => 1;

    Readonly my $INPUT_REF    => [ 0, 1, 2, 3 ];
    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $EXPECTED => 3;
    Readonly my $RESULT => AdventOfCode::Day10->get_differences_product($INPUT_REF);

    is_deeply( $RESULT, $EXPECTED, 'ok' );
};

