#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('0.1.8');
use Test::More tests => 12;

use lib '../lib/';
use AdventOfCode::Common;
use AdventOfCode::Day10;

Readonly my $EXAMPLE_FILE              => './day10_example';
Readonly my $PUZZLE_FILE               => './day10_input';
Readonly my $PART_ONE_EXAMPLE_SOLUTION => 220;
Readonly my $PART_ONE_PUZZLE_SOLUTION  => 2_176;
Readonly my $PART_TWO_EXAMPLE_SOLUTION => 1;
Readonly my $PART_TWO_PUZZLE_SOLUTION  => 1;

Readonly my $EXAMPLE_INPUT_REF => AdventOfCode::Common->get_file_content($EXAMPLE_FILE);
Readonly my $PUZZLE_INPUT_REF  => AdventOfCode::Common->get_file_content($PUZZLE_FILE);

is( AdventOfCode::Day10->solve_part_1($EXAMPLE_INPUT_REF),
    $PART_ONE_EXAMPLE_SOLUTION, 'Example solution of Part One is correct.' );

is( AdventOfCode::Day10->solve_part_1($PUZZLE_INPUT_REF),
    $PART_ONE_PUZZLE_SOLUTION, 'Puzzle solution of Part One is correct.' );

is( AdventOfCode::Day10->solve_part_2( $EXAMPLE_INPUT_REF, $PART_ONE_EXAMPLE_SOLUTION ),
    $PART_TWO_EXAMPLE_SOLUTION, 'Example solution of Part Two is correct.' );

is( AdventOfCode::Day10->solve_part_2( $PUZZLE_INPUT_REF, $PART_ONE_PUZZLE_SOLUTION ),
    $PART_TWO_PUZZLE_SOLUTION, 'Puzzle solution of Part Two is correct.' );

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
