#!/usr/bin/perl

package AOC2020::Day01;

use warnings;
use strict;
use version; our $VERSION = qv('1.0.4');
use Readonly;
my %number = ();

sub get_product_two_numbers_adding_to_2020_helper {
    my ( $number_one, $number_two ) = @_;
    my $not_found = 0;

    if ( $number_two != $number_one ) {
        if ( adds_to_2020( $number_one, $number_two ) ) {
            $number{'NUMBER_ONE'} = $number_one;
            $number{'NUMBER_TWO'} = $number_two;
            return $number_one * $number_two;
        }
        else {
        }
    }
    else {
    }

    return $not_found;
}

sub get_product_two_numbers_adding_to_2020 {
    my $input     = shift;
    my @input     = @{$input};
    my $not_found = 0;
    foreach my $number_one (@input) {
        foreach my $number_two (@input) {
            my $product =
                get_product_two_numbers_adding_to_2020_helper( $number_one,
                $number_two );
            if ( $product != 0 ) {
                return $product;
            }
            else {
            }
        }
    }

    return $not_found;
}

sub get_product_three_numbers_adding_to_2020_helper {
    my ( $number_one, $number_two, $number_three ) = @_;
    my $not_found = 0;

    if ( $number_three != $number_one && $number_three != $number_two ) {
        if ( adds_to_2020( $number_one, $number_two, $number_three ) ) {
            $number{'NUMBER_ONE'}   = $number_one;
            $number{'NUMBER_TWO'}   = $number_two;
            $number{'NUMBER_THREE'} = $number_three;
            return $number_one * $number_two * $number_three;
        }
        else {
        }
    }
    else {
    }

    return $not_found;
}

sub get_product_three_numbers_adding_to_2020 {
    my $input     = shift;
    my @input     = @{$input};
    my $not_found = 0;

    foreach my $number_one (@input) {
        foreach my $number_two (@input) {
            if ( $number_two != $number_one ) {
                foreach my $number_three (@input) {
                    my $product =
                        get_product_three_numbers_adding_to_2020_helper(
                        $number_one, $number_two, $number_three );
                    if ( $product != 0 ) {
                        return $product;
                    }
                    else {
                    }
                }
            }
            else {
            }
        }
    }

    return $not_found;
}

sub adds_to_2020 {
    my @input        = @_;
    my $adds_to_2020 = 0;
    Readonly my $NEEDED_SUM => 2020;

    if ( get_sum( \@input ) == $NEEDED_SUM ) {
        $adds_to_2020 = 1;
    }
    else {
    }

    return $adds_to_2020;
}

sub get_sum {
    my $numbers_ref = shift;
    my @numbers     = @{$numbers_ref};
    my $sum         = 0;

    foreach (@numbers) {
        $sum += $_;
    }

    return $sum;
}

sub get_number_a {
    my $self       = shift;
    my $get_number = shift;
    get_product_two_numbers_adding_to_2020(shift);
    return $number{$get_number};
}

sub get_number_b {
    my $self       = shift;
    my $get_number = shift;
    get_product_three_numbers_adding_to_2020(shift);
    return $number{$get_number};
}

sub get_solution_a {
    my $self  = shift;
    my $input = shift;
    return get_product_two_numbers_adding_to_2020($input);
}

sub get_solution_b {
    my $self  = shift;
    my $input = shift;
    return get_product_three_numbers_adding_to_2020($input);
}

1;
