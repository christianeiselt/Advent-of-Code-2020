#!/usr/bin/perl

package AdventOfCode::Day01;

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.10');

my $numbers_ref = {};


sub solve_part_1 {
	Readonly my $SELF         => shift;
	Readonly my $INPUT_REF    => shift;
	Readonly my $NUMBER_COUNT => 2;
	Readonly my $RESULT       =>get_product_of_numbers_adding_to( $INPUT_REF, $NUMBER_COUNT );

	return $RESULT;
}


sub solve_part_2 {
	Readonly my $SELF         => shift;
	Readonly my $INPUT_REF    => shift;
	Readonly my $NUMBER_COUNT => 3;
	Readonly my $RESULT       =>get_product_of_numbers_adding_to( $INPUT_REF, $NUMBER_COUNT );

	return $RESULT;
}


sub get_product_of_numbers_adding_to {
	Readonly my $INPUT_REF             => shift;
	Readonly my $COUNT                 => shift;
	Readonly my $TARGET_SUM            => 2_020;
	Readonly my $NUMBER_COUNT_PART_ONE => 2;
	Readonly my $NUMBER_COUNT_PART_TWO => 3;

	if ( $COUNT == $NUMBER_COUNT_PART_ONE ) {
		my ( $number_1, $number_2 ) =get_two_numbers_adding_to( $TARGET_SUM, $INPUT_REF );
		return $number_1 * $number_2;
	}elsif ( $COUNT == $NUMBER_COUNT_PART_TWO ) {
		my ( $number_1, $number_2, $number_3 ) =get_three_numbers_adding_to( $TARGET_SUM, $INPUT_REF );
		return $number_1 * $number_2 * $number_3;
	}

	return;
}


sub get_two_numbers_adding_to {
	Readonly my $TARGET_SUM => shift;
	Readonly my $INPUT_REF  => shift;
	Readonly my @INPUT      => sort @{$INPUT_REF};
	Readonly my $NUMBER_1   => 0;
	Readonly my $NUMBER_2   => 0;

	foreach my $number_1 (@INPUT) {
		Readonly my $TARGET_NUMBER => $TARGET_SUM - $number_1;
		if ( AdventOfCode::Common->list_contains_number($INPUT_REF,  $TARGET_NUMBER)
			&& $number_1 != $TARGET_NUMBER ){
			return $number_1, $TARGET_NUMBER;
		}else {
		}
	}

	return $NUMBER_1, $NUMBER_2;
}


sub get_three_numbers_adding_to {
	Readonly my $TARGET_SUM => shift;
	Readonly my $INPUT_REF  => shift;
	Readonly my @INPUT      => sort @{$INPUT_REF};
	Readonly my $NUMBER_1   => 0;
	Readonly my $NUMBER_2   => 0;
	Readonly my $NUMBER_3   => 0;

	foreach my $number_1 (@INPUT) {
		Readonly my $TARGET_NUMBER => $TARGET_SUM - $number_1;
		my ( $number_2, $number_3 ) =get_two_numbers_adding_to( $TARGET_NUMBER, $INPUT_REF );
		Readonly my @NUMBERS => [ $number_1, $number_2, $number_3 ];
		if (   $number_1 != $number_2
			&& $number_2 != $number_3
			&& $number_3 != $number_1 ){
			return $number_1, $number_2, $number_3;
		}
	}

	return $NUMBER_1, $NUMBER_2, $NUMBER_3;
}

1;
