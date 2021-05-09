#!/usr/bin/perl

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('0.0.7');
use Test::More tests => 7;

use lib '../lib/';
use AdventOfCode::Day08;

subtest 'get_list_count' => sub {
    plan tests => 1;

    Readonly my $INPUT_REF => [ 0, 1, 2, 3 ];
    Readonly my $EXPECTED  => 4;
    Readonly my $RESULT    => AdventOfCode::Day08->get_list_count($INPUT_REF);
    is( $RESULT, $EXPECTED, 'ok' );
};

subtest 'get_filled_fixed_list' => sub {
    plan tests => 1;

    Readonly my $ZERO         => 0;
    Readonly my $LIST_COUNT   => 3;
    Readonly my $EXPECTED_REF => [ 0, 0, 0 ];
    Readonly my $RESULT_REF   => AdventOfCode::Day08->get_filled_fixed_list( $ZERO, $LIST_COUNT );
    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'get_i_acc_value' => sub {
    plan tests => 1;

    Readonly my $INSTRUCTION  => 0;
    Readonly my $ACC_VALUE    => 3;
    Readonly my $ITERATOR     => 1;
    Readonly my $EXPECTED_REF => { 'iterator' => 2, 'acc_value' => $ACC_VALUE };
    Readonly my $RESULT_REF   => AdventOfCode::Day08->get_i_acc_value( $INSTRUCTION, $ACC_VALUE, $ITERATOR );
    is_deeply( $RESULT_REF, $EXPECTED_REF, 'ok' );
};

subtest 'get_instruction_action' => sub {
    plan tests => 1;

    Readonly my $INSTRUCTION => 'nop +0';
    Readonly my $EXPECTED    => 'nop';
    Readonly my $RESULT      => AdventOfCode::Day08->get_instruction_action($INSTRUCTION);
    is( $RESULT, $EXPECTED, 'ok' );
};

subtest 'get_instruction_value' => sub {
    plan tests => 1;

    Readonly my $INSTRUCTION => 'acc -99';
    Readonly my $EXPECTED    => '-99';
    Readonly my $RESULT      => AdventOfCode::Day08->get_instruction_value($INSTRUCTION);
    is( $RESULT, $EXPECTED, 'ok' );
};

subtest 'get_jmp_action' => sub {
    plan tests => 1;

    Readonly my $EXPECTED    => 'jmp';
    Readonly my $RESULT      => AdventOfCode::Day08->get_jmp_action();
    is( $RESULT, $EXPECTED, 'ok' );
};

subtest 'get_acc_action' => sub {
    plan tests => 1;

    Readonly my $EXPECTED    => 'acc';
    Readonly my $RESULT      => AdventOfCode::Day08->get_acc_action();
    is( $RESULT, $EXPECTED, 'ok' );
};

