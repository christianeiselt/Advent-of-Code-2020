#!/usr/bin/perl

package AdventOfCode::Day10;

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('0.1.9');

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

sub set_occupied {
    Readonly my $SELF => shift;
    return 1;
}

sub get_marked_list {
    Readonly my $SELF           => shift;
    Readonly my $INPUT_LIST_REF => shift;
    my @list;

    foreach my $number ( @{$INPUT_LIST_REF} ) {
        $list[$number] = AdventOfCode::Day10->set_occupied();
    }

    return \@list;
}

sub set_zero {
    Readonly my $SELF => shift;
    return 0;
}

sub reset_count {
    Readonly my $SELF              => shift;
    Readonly my $INPUT_COUNTER_REF => shift;
    my $counter_ref = $INPUT_COUNTER_REF;

    $counter_ref->{'count'} = AdventOfCode::Day10->set_zero();

    return $counter_ref;
}

sub increment_difference_count {
    Readonly my $SELF              => shift;
    Readonly my $INPUT_COUNTER_REF => shift;
    Readonly my $DIFFERENCE        => shift;
    my $counter_ref = $INPUT_COUNTER_REF;

    $counter_ref->{$DIFFERENCE}++;

    return $counter_ref;
}

sub increment_count {
    Readonly my $SELF              => shift;
    Readonly my $INPUT_COUNTER_REF => shift;
    my $counter_ref = $INPUT_COUNTER_REF;

    $counter_ref->{'count'}++;

    return $counter_ref;
}

sub set_difference_count {
    Readonly my $SELF              => shift;
    Readonly my $INPUT_COUNTER_REF => shift;
    Readonly my $DIFFERENCE_1      => 1;
    Readonly my $DIFFERENCE_3      => 3;
    Readonly my $COUNT             => $INPUT_COUNTER_REF->{'count'};
    my $counter_ref = $INPUT_COUNTER_REF;

    if ( $COUNT == $DIFFERENCE_1 ) {
        $counter_ref = AdventOfCode::Day10->reset_count($counter_ref);
        $counter_ref = AdventOfCode::Day10->increment_difference_count( $counter_ref, $DIFFERENCE_1 );
    }
    elsif ( $COUNT == $DIFFERENCE_3 ) {
        $counter_ref = AdventOfCode::Day10->reset_count($counter_ref);
        $counter_ref = AdventOfCode::Day10->increment_difference_count( $counter_ref, $DIFFERENCE_3 );
    }
    else {
        #
    }

    return $counter_ref;
}

sub get_counter_for_defined {
    Readonly my $SELF              => shift;
    Readonly my $INPUT_COUNTER_REF => shift;
    my $counter_ref = $INPUT_COUNTER_REF;

    $counter_ref = AdventOfCode::Day10->increment_count($counter_ref);
    $counter_ref = AdventOfCode::Day10->set_difference_count($counter_ref);

    return $counter_ref;
}

sub get_counter {
    Readonly my $SELF              => shift;
    Readonly my $LIST_REF          => shift;
    Readonly my $ITERATOR          => shift;
    Readonly my $INPUT_COUNTER_REF => shift;
    my $counter_ref = $INPUT_COUNTER_REF;
    my @list        = @{$LIST_REF};

    if ( defined $list[$ITERATOR] ) {
        $counter_ref = AdventOfCode::Day10->get_counter_for_defined($counter_ref);
    }
    else {
        $counter_ref->{'count'}++;
    }

    return $counter_ref;
}

sub add_difference_for_builtin_adapter {
    Readonly my $SELF              => shift;
    Readonly my $INPUT_COUNTER_REF => shift;
    Readonly my $DIFFERENCE_3      => 3;
    my $counter_ref = $INPUT_COUNTER_REF;

    $counter_ref->{$DIFFERENCE_3}++;

    return $counter_ref;
}

sub prepare_counter {
    Readonly my $SELF         => shift;
    Readonly my $DIFFERENCE_1 => 1;
    Readonly my $DIFFERENCE_3 => 3;
    Readonly my $COUNTER_REF  => {
        'count'       => -1,
        $DIFFERENCE_1 => 0,
        $DIFFERENCE_3 => 0,
    };

    return $COUNTER_REF;
}

sub get_difference_counters {
    Readonly my $SELF         => shift;
    Readonly my $LIST_REF    => shift;
    Readonly my @LIST        => @{$LIST_REF};
    Readonly my $LIST_LENGTH => scalar @LIST;
    my $counter_ref = AdventOfCode::Day10->prepare_counter();
    $counter_ref = AdventOfCode::Day10->add_difference_for_builtin_adapter($counter_ref);

    for my $i ( 0 .. $LIST_LENGTH ) {
        $counter_ref = AdventOfCode::Day10->get_counter( $LIST_REF, $i, $counter_ref );
    }

    return $counter_ref;
}

sub get_differences_product {
    Readonly my $INPUT_REF       => shift;
    Readonly my $NUMBER_LIST_REF => AdventOfCode::Day10->get_marked_list($INPUT_REF);
    Readonly my $COUNTERS_REF    => AdventOfCode::Day10->get_difference_counters($NUMBER_LIST_REF);
    Readonly my $DIFFERENCE_1    => 1;
    Readonly my $DIFFERENCE_3    => 3;
    return $COUNTERS_REF->{$DIFFERENCE_1} * $COUNTERS_REF->{$DIFFERENCE_3};
}

1;
