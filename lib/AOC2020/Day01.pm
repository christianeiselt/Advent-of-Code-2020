#!/usr/bin/perl

package AOC2020::Day01;

use warnings;
use strict;
use Readonly;
use List::MoreUtils qw(any);
use version; our $VERSION = qv('1.0.5');

my $numbers_ref = {};

sub get_product_of_numbers_adding_to {
    Readonly my $SELF                  => shift;
    Readonly my $TARGET_SUM            => shift;
    Readonly my $INPUT_REF             => shift;
    Readonly my $COUNT                 => shift;
    Readonly my $NUMBER_COUNT_PART_ONE => 2;
    Readonly my $NUMBER_COUNT_PART_TWO => 3;

    if ( $COUNT == $NUMBER_COUNT_PART_ONE ) {
        my ( $number_1, $number_2 ) =
            get_two_numbers_adding_to( $TARGET_SUM, $INPUT_REF );
        return $number_1 * $number_2;
    }
    elsif ( $COUNT == $NUMBER_COUNT_PART_TWO ) {
        my ( $number_1, $number_2, $number_3 ) =
            get_three_numbers_adding_to( $TARGET_SUM, $INPUT_REF );
        return $number_1 * $number_2 * $number_3;
    }

    return;
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

sub get_two_numbers_adding_to {
    Readonly my $TARGET_SUM => shift;
    Readonly my $INPUT_REF  => shift;
    Readonly my @INPUT      => @{$INPUT_REF};
    Readonly my $NUMBER_1   => 0;
    Readonly my $NUMBER_2   => 0;

    foreach my $number_1 (@INPUT) {
        Readonly my $TARGET_NUMBER => $TARGET_SUM - $number_1;
        if ( input_contains_number( $TARGET_NUMBER, $INPUT_REF )
            && $number_1 != $TARGET_NUMBER )
        {
            return $number_1, $TARGET_NUMBER;
        }
        else {
        }
    }

    return $NUMBER_1, $NUMBER_2;
}

sub get_three_numbers_adding_to {
    Readonly my $TARGET_SUM => shift;
    Readonly my $INPUT_REF  => shift;
    Readonly my @INPUT      => @{$INPUT_REF};
    Readonly my $NUMBER_1   => 0;
    Readonly my $NUMBER_2   => 0;
    Readonly my $NUMBER_3   => 0;

    foreach my $number_1 (@INPUT) {
        Readonly my $TARGET_NUMBER => $TARGET_SUM - $number_1;
        my ( $number_2, $number_3 ) =
            get_two_numbers_adding_to( $TARGET_NUMBER, $INPUT_REF );
        Readonly my @NUMBERS => [ $number_1, $number_2, $number_3 ];
        if ( $number_1 != $number_2
            && $number_2 != $number_3
            && $number_3 != $number_1 ) {
            return $number_1, $number_2, $number_3;
        }
    }

    return $NUMBER_1, $NUMBER_2, $NUMBER_3;
}

1;
