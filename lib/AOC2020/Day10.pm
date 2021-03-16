#!/usr/bin/perl

package AOC2020::Day10;

use warnings;
use strict;
use List::Util qw(min max);
use Readonly;
use version; our $VERSION = qv('1.0.1');

sub solve_part_1 {
    Readonly my $SELF      => shift;
    Readonly my $INPUT_REF => shift;
    Readonly my $RESULT    => get_differences_product($INPUT_REF);

    return $RESULT;
}

sub solve_part_2 {
    Readonly my $SELF       => shift;
    Readonly my $INPUT_REF  => shift;
    Readonly my $TARGET_SUM => shift;
    Readonly my $RESULT     => solve($INPUT_REF);

    return $RESULT;
}

sub solve {
    return 1;
}

sub get_list_by_number {
    my $list_ref = shift;
    my @list;

    foreach my $number ( @{$list_ref} ) {
        $list[$number] = 1;
    }

    return \@list;
}

sub get_counter_for_defined {
    Readonly my $INPUT_COUNTER_REF => shift;
    my $counter_ref = $INPUT_COUNTER_REF;

    $counter_ref->{'count'}++;
    if ( $counter_ref->{'count'} == 1 ) {
        $counter_ref->{'count'} = 0;
        $counter_ref->{1}++;
    }
    elsif ( $counter_ref->{'count'} == 3 ) {
        $counter_ref->{'count'} = 0;
        $counter_ref->{3}++;
    }

    return $counter_ref;
}

sub get_counter {
    Readonly my $LIST_REF          => shift;
    Readonly my $ITERATOR          => shift;
    Readonly my $INPUT_COUNTER_REF => shift;
    my $counter_ref = $INPUT_COUNTER_REF;
    my @list        = @{$LIST_REF};

    if ( defined $list[$ITERATOR] ) {
        $counter_ref = get_counter_for_defined($counter_ref);
    }
    else {
        $counter_ref->{'count'}++;
    }

    return $counter_ref;
}

sub add_difference_for_builtin_adapter {
    Readonly my $COUNTER => shift;

    return $COUNTER + 1;
}

sub get_difference_counters {
    my $list_ref    = shift;
    my @list        = @{$list_ref};
    my $counter_ref = {};
    $counter_ref->{'count'} = -1;
    $counter_ref->{1}       = 0;
    $counter_ref->{3}       = 0;
    my $list_length = scalar @list;

    for my $i ( 0 .. scalar @list ) {
        $counter_ref = get_counter( $list_ref, $i, $counter_ref );
    }

    $counter_ref->{3} =
        add_difference_for_builtin_adapter( $counter_ref->{3} );

    return $counter_ref;
}

sub get_differences_product {
    Readonly my $INPUT_REF       => shift;
    Readonly my $NUMBER_LIST_REF => get_list_by_number($INPUT_REF);
    Readonly my $COUNTERS_REF    => get_difference_counters($NUMBER_LIST_REF);

    return $COUNTERS_REF->{1} * $COUNTERS_REF->{3};
}

1;
