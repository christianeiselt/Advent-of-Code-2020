#!/usr/bin/perl

package AdventOfCode::Day02;
use strict;
use warnings;
use Readonly;
use version; our $VERSION = qv('1.0.10');

# Based on trim function from Gabor Szabo (www.perlmaven.com)
sub trim { my $s = shift; $s =~ s/^\s+|\s+$//gmsx; return $s }

sub solve_part_1 {
    Readonly my $SELF      => shift;
    Readonly my $INPUT_REF => shift;
    Readonly my $PART      => 1;
    Readonly my $RESULT    => get_valid_password_count_for_part( $PART, $INPUT_REF );

    return $RESULT;
}

sub solve_part_2 {
    Readonly my $SELF      => shift;
    Readonly my $INPUT_REF => shift;
    Readonly my $PART      => 2;
    Readonly my $RESULT    => get_valid_password_count_for_part( $PART, $INPUT_REF );

    return $RESULT;
}

sub get_valid_password_count_for_part {
    Readonly my $PART             => shift;
    Readonly my $INPUT            => shift;
    Readonly my @PASSWORD_ENTRIES => @{$INPUT};
    my $count = 0;

    for my $entry (@PASSWORD_ENTRIES) {
        $count = increment_if_valid_password_for_part( $PART, $entry, $count );
    }

    return $count;
}

sub get_password_entry_components {
    Readonly my $PASSWORD_ENTRY => shift;
    my ( $policy_component, $password_component ) =
        split /:/msx, $PASSWORD_ENTRY;

    return ( $policy_component, $password_component );
}

sub get_password {
    Readonly my $PASSWORD_ENTRY     => shift;
    Readonly my $PASSWORD_COMPONENT => ( get_password_entry_components($PASSWORD_ENTRY) )[1];
    Readonly my $PASSWORD           => trim($PASSWORD_COMPONENT);

    return $PASSWORD;
}

sub get_letter {
    Readonly my $PASSWORD_ENTRY   => shift;
    Readonly my $POLICY_COMPONENT => ( get_password_entry_components($PASSWORD_ENTRY) )[0];
    Readonly my $LETTER           => ( get_policy_components($POLICY_COMPONENT) )[0];

    return $LETTER;
}

sub get_first_number {
    Readonly my $PASSWORD_ENTRY   => shift;
    Readonly my $POLICY_COMPONENT => ( get_password_entry_components($PASSWORD_ENTRY) )[0];
    Readonly my $FIRST_NUMBER     => ( get_policy_components($POLICY_COMPONENT) )[1];

    return $FIRST_NUMBER;
}

sub get_second_number {
    Readonly my $PASSWORD_ENTRY   => shift;
    Readonly my $POLICY_COMPONENT => ( get_password_entry_components($PASSWORD_ENTRY) )[0];
    Readonly my $SECOND_NUMBER    => ( get_policy_components($POLICY_COMPONENT) )[2];

    return $SECOND_NUMBER;
}

sub get_policy_components {
    Readonly my $POLICY => shift;
    my ( $numbers, $letter ) = split /\s/msx, $POLICY;
    my ( $first_number, $second_number ) = get_number_components($numbers);

    return ( $letter, $first_number, $second_number );
}

sub get_number_components {
    Readonly my $NUMBERS => shift;
    my ( $first_number, $second_number ) = split /-/msx, $NUMBERS;

    return ( $first_number, $second_number );
}

sub get_letters_of_password {
    Readonly my $PASSWORD => shift;
    Readonly my @LETTERS => split //msx, $PASSWORD;

    return \@LETTERS;
}

sub increment_count_if_letter {
    Readonly my $INPUT_LETTER => shift;
    Readonly my $MATCH_LETTER => shift;
    my $count = shift;

    if ( $INPUT_LETTER eq $MATCH_LETTER ) {
        $count++;
    }
    else {
        #
    }

    return $count;
}

sub get_count_for_letter {
    Readonly my $LETTER   => shift;
    Readonly my $PASSWORD => shift;
    Readonly my @LETTERS  => @{ get_letters_of_password($PASSWORD) };
    my $letter_count = 0;

    for my $l (@LETTERS) {
        $letter_count = increment_count_if_letter( $l, $LETTER, $letter_count );
    }

    return $letter_count;
}

sub count_is_in_range {
    Readonly my $LETTER_COUNT => shift;
    Readonly my $MIN          => shift;
    Readonly my $MAX          => shift;

    if ( $LETTER_COUNT >= $MIN && $LETTER_COUNT <= $MAX ) {
        return 1;
    }
    else {
        return 0;
    }
}

sub is_valid_password_a {
    my $password_entry = shift;
    my $password       = get_password($password_entry);
    my $policy_component =
        ( get_password_entry_components($password_entry) )[0];
    my ( $letter, $min, $max ) = get_policy_components($policy_component);
    my $letter_count = get_count_for_letter( $letter, $password );

    if ( count_is_in_range( $letter_count, $min, $max ) ) {
        return 1;
    }
    else {
        return 0;
    }
}

sub increment_if_valid_password_for_part_one {
    Readonly my $PASSWORD_ENTRY => shift;
    Readonly my $INPUT_COUNT    => shift;
    my $count = $INPUT_COUNT;

    if ( is_valid_password_a($PASSWORD_ENTRY) ) {
        $count++;
    }
    else {
        #
    }

    return $count;
}

sub increment_if_valid_password_for_part_two {
    Readonly my $PASSWORD_ENTRY => shift;
    Readonly my $INPUT_COUNT    => shift;
    my $count = $INPUT_COUNT;

    if ( is_valid_password_b($PASSWORD_ENTRY) ) {
        $count++;
    }
    else {
        #
    }

    return $count;
}

sub increment_if_valid_password_for_part {
    Readonly my $PART           => shift;
    Readonly my $PASSWORD_ENTRY => shift;
    Readonly my $INPUT_COUNT    => shift;
    Readonly my $PART_ONE       => 1;
    Readonly my $PART_TWO       => 2;
    my $count = $INPUT_COUNT;

    if ( $PART == $PART_ONE ) {
        $count = increment_if_valid_password_for_part_one( $PASSWORD_ENTRY, $count );
    }
    elsif ( $PART == $PART_TWO ) {
        $count = increment_if_valid_password_for_part_two( $PASSWORD_ENTRY, $count );
    }

    return $count;
}

sub letter_is_on_position {
    Readonly my $PASSWORD => shift;
    Readonly my $LETTER   => shift;
    Readonly my $POSITION => shift;

    my @letters = @{ get_letters_of_password($PASSWORD) };

    unshift @letters, 'undef';

    if ( $letters[$POSITION] eq $LETTER ) {
        return 1;
    }
    else {
        return 0;
    }
}

sub letter_is_exactly_on_one_position_of {
    Readonly my $PASSWORD_ENTRY => shift;
    Readonly my $PASSWORD       => get_password($PASSWORD_ENTRY);
    Readonly my $LETTER         => get_letter($PASSWORD_ENTRY);
    Readonly my $POS_1          => get_first_number($PASSWORD_ENTRY);
    Readonly my $POS_2          => get_second_number($PASSWORD_ENTRY);
    Readonly my $IS_ON_POS_1    => letter_is_on_position( $PASSWORD, $LETTER, $POS_1 );
    Readonly my $IS_ON_POS_2    => letter_is_on_position( $PASSWORD, $LETTER, $POS_2 );

    if ( $IS_ON_POS_1 && $IS_ON_POS_2 ) {
        return 0;
    }
    elsif ( !$IS_ON_POS_1 && !$IS_ON_POS_2 ) {
        return 0;
    }
    else {
        return 1;
    }
}

sub is_valid_password_b {
    Readonly my $PASSWORD_ENTRY => shift;
    Readonly my $IS_VALID       => letter_is_exactly_on_one_position_of($PASSWORD_ENTRY);

    return $IS_VALID;
}

1;
