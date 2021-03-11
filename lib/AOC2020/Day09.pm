#!/usr/bin/perl

package AOC2020::Day09;

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.2');

sub solve_part_1 {
    Readonly my $SELF      => shift;
    Readonly my $INPUT_REF => shift;
    Readonly my $RESULT    => get_weak_number($INPUT_REF);

    return $RESULT;
}

sub solve_part_2 {
    Readonly my $SELF      => shift;
    Readonly my $INPUT_REF => shift;
    Readonly my $RESULT    => solve($INPUT_REF);

    return $RESULT;
}

sub solve {
    return "";

}

sub input_contains_number {
    Readonly my $NUMBER    => shift;
    Readonly my $INPUT_REF => shift;
    Readonly my @INPUT     => @{$INPUT_REF};

    if ( any {m{^$NUMBER$}msx} @INPUT ) {
        return 1;
    }
    else {
        return 0;
    }

    return;
}

sub contains_two_numbers_adding_to_sum {
    Readonly my $INPUT_REF  => shift;
    Readonly my $TARGET_SUM => shift;
    Readonly my @INPUT      => sort @{$INPUT_REF};

    foreach my $number_1 (@INPUT) {
        Readonly my $TARGET_NUMBER => $TARGET_SUM - $number_1;
        if (AOC2020::Common->list_contains_number( $INPUT_REF,
                $TARGET_NUMBER )
            && $number_1 != $TARGET_NUMBER
            )
        {
            return 1;
        }
        else {
        }
    }

    return 0;
}

sub get_weak_number {
    Readonly my $INPUT_REF       => shift;
    Readonly my $DATA_REF        => $INPUT_REF->{'data_ref'};
    Readonly my $BATCH_SIZE      => $INPUT_REF->{'batch_size'};
    Readonly my $PREAMBLE_LENGTH => $INPUT_REF->{'preamble_length'};
    Readonly my @DATA            => @{$DATA_REF};

    foreach my $i ( 0 .. scalar @DATA - 1 ) {
        if ( $i >= $PREAMBLE_LENGTH ) {
            my $target_sum = $DATA[$i];
            my @batch;

            foreach my $j ( $i - $BATCH_SIZE .. $i - 1 ) {
                push @batch, $DATA[$j];
            }

            if ( !contains_two_numbers_adding_to_sum( \@batch, $target_sum ) )
            {
                return $DATA[$i];
            }
            else {
            }
        }
    }

    return;
}

1;
