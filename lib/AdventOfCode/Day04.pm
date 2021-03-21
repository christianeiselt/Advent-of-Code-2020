#!/usr/bin/perl

package AdventOfCode::Day04;

use warnings;
use strict;
use Readonly;
use List::MoreUtils qw(any);
use version; our $VERSION = qv('1.0.9');

sub solve_part_1 {
    Readonly my $SELF              => shift;
    Readonly my $PASSPORT_LIST_REF => shift;
    Readonly my @PASSPORTS         => @{ get_passports($PASSPORT_LIST_REF) };
    Readonly my $VALID_PASSPORTS_REF =>
        get_valid_passports_by_mandatory_fields_defined( \@PASSPORTS );

    return scalar @{$VALID_PASSPORTS_REF};
}

sub solve_part_2 {
    Readonly my $SELF              => shift;
    Readonly my $PASSPORT_LIST_REF => shift;
    Readonly my @PASSPORTS         => @{ get_passports($PASSPORT_LIST_REF) };
    Readonly my $POTENTIAL_VALID_PASSPORTS_REF =>
        get_valid_passports_by_mandatory_fields_defined( \@PASSPORTS );
    Readonly my $VALID_PASSPORTS_REF =>
        get_valid_passports_by_valid_values($POTENTIAL_VALID_PASSPORTS_REF);

    return scalar @{$VALID_PASSPORTS_REF};
}

sub get_fields_from_line {
    Readonly my $LINE => shift;
    my @fields = split /\s/msx, $LINE;

    return \@fields;
}

sub get_fields_for_passport {
    Readonly my $LINE               => shift;
    Readonly my $INPUT_PASSPORT_REF => shift;
    Readonly my @FIELDS             => @{ get_fields_from_line($LINE) };
    my $passport_ref = $INPUT_PASSPORT_REF;

    foreach my $field (@FIELDS) {
        Readonly my @FIELD_INFO => split /[:]/msx, $field;
        $passport_ref->{"$FIELD_INFO[0]"} = $FIELD_INFO[1];
    }

    return $passport_ref;
}

sub get_passports {
    Readonly my $PASSPORT_LIST => shift;
    my $passport_index = 0;
    my @passports;

    foreach my $line ( @{$PASSPORT_LIST} ) {
        if ( $line eq q{} ) {
            $passport_index++;
        }
        else {
            $passports[$passport_index] =
                get_fields_for_passport( $line, $passports[$passport_index] );
        }
    }

    return \@passports;
}

sub has_all_mandatory_fields_defined {
    Readonly my $PASSPORT_REF => shift;

    if (   defined $PASSPORT_REF->{'ecl'}
        && defined $PASSPORT_REF->{'pid'}
        && defined $PASSPORT_REF->{'eyr'}
        && defined $PASSPORT_REF->{'byr'}
        && defined $PASSPORT_REF->{'hcl'}
        && defined $PASSPORT_REF->{'iyr'}
        && defined $PASSPORT_REF->{'hgt'} )
    {
        return 1;
    }
    else {
        return 0;
    }
}

sub is_valid_passport_by_mandatory_fields_defined {
    Readonly my $PASSPORT_REF => shift;

    if ( has_all_mandatory_fields_defined($PASSPORT_REF) ) {
        return 1;
    }
    else {
        return 0;
    }
}

sub add_if_valid_passport {
    Readonly my $VALID_PASSPORTS_REF => shift;
    Readonly my $PASSPORT_REF        => shift;
    my @valid_passports;

    if ( defined $VALID_PASSPORTS_REF ) {
        @valid_passports = @{$VALID_PASSPORTS_REF};
    }
    else {
        # First passport, therefore empty valid_passports_list
    }

    if ( is_valid_passport_by_mandatory_fields_defined($PASSPORT_REF) ) {
        push @valid_passports, $PASSPORT_REF;
    }
    else {
        # No valid passport, therefore no change to valid_passports_list
    }

    return \@valid_passports;
}

sub get_valid_passports_by_mandatory_fields_defined {
    Readonly my $PASSPORTS_REF => shift;
    my $valid_passports;

    foreach my $passport ( @{$PASSPORTS_REF} ) {
        $valid_passports =
            add_if_valid_passport( $valid_passports, $passport );
    }

    return $valid_passports;
}

sub has_valid_ecl {
    Readonly my $INPUT_ECL            => shift;
    Readonly my @VALID_ECLS           => qw( amb blu brn gry grn hzl oth );
    Readonly my $ECL_BEGINS_WITH_HASH => $INPUT_ECL !~ m/^\#/msx;
    Readonly my $IS_VALID_ECL         => any {m{^$INPUT_ECL}msx} @VALID_ECLS;

    if ( $ECL_BEGINS_WITH_HASH && $IS_VALID_ECL ) {
        return 1;
    }
    else {
        return 0;
    }
}

sub has_valid_hcl {
    Readonly my $INPUT_HCL => shift;

    if ( $INPUT_HCL =~ m/^\#[A-F\d]{6}$/imsx ) {
        return 1;
    }
    else {
        return 0;
    }
}

sub get_height_from_chars {
    Readonly my $CHARACTERS_REF => shift;
    Readonly my @CHARACTERS     => @{$CHARACTERS_REF};
    Readonly my $EMPTY          => q{};
    my $value = $EMPTY;
    my $unit  = $EMPTY;

    foreach my $char (@CHARACTERS) {
        if ( $char =~ m/\d/msx ) {
            $value .= $char;
        }
        elsif ( $char =~ m/[[:alpha:]]/imsx ) {
            $unit .= $char;
        }
        else {
            #
        }
    }

    return ( $value, $unit );
}

sub get_centimeter_constraints {
    Readonly my $CM         => 'cm';
    Readonly my $MIN_HEIGHT => 150;
    Readonly my $MAX_HEIGHT => 193;

    return $CM, $MIN_HEIGHT, $MAX_HEIGHT;
}

sub is_valid_cm_height {
    Readonly my $VALUE => shift;
    Readonly my $UNIT  => shift;
    my ( $cm, $min_height, $max_height ) = get_centimeter_constraints();

    if ( $UNIT eq $cm && ( $VALUE >= $min_height && $VALUE <= $max_height ) )
    {
        return 1;
    }
    else {
        return 0;
    }
}

sub get_inch_constraints {
    Readonly my $INCH       => 'in';
    Readonly my $MIN_HEIGHT => 59;
    Readonly my $MAX_HEIGHT => 76;

    return $INCH, $MIN_HEIGHT, $MAX_HEIGHT;
}

sub is_valid_inch_height {
    Readonly my $VALUE => shift;
    Readonly my $UNIT  => shift;
    my ( $inch, $min_height, $max_height ) = get_inch_constraints();

    if ( $UNIT eq $inch
        && ( $VALUE >= $min_height && $VALUE <= $max_height ) )
    {
        return 1;
    }
    else {
        return 0;
    }
}

sub has_valid_height {
    Readonly my $HEIGHT => shift;
    Readonly my @CHARACTERS => split //msx, $HEIGHT;
    my ( $value, $unit ) = get_height_from_chars( \@CHARACTERS );
    Readonly my $IS_VALID_CM_HEIGHT   => is_valid_cm_height( $value, $unit );
    Readonly my $IS_VALID_INCH_HEIGHT =>
        is_valid_inch_height( $value, $unit );

    if ( $IS_VALID_CM_HEIGHT || $IS_VALID_INCH_HEIGHT ) {
        return 1;
    }
    else {
        return 0;
    }
}

sub has_valid_passport_id {
    Readonly my $PID => shift;

    if ( $PID =~ m/^[\d]{9}$/msx ) {
        return 1;
    }
    else {
        return 0;
    }
}

sub is_year {
    Readonly my $NUMBER => shift;

    if ( $NUMBER =~ m/[\d]{4}/msx ) {
        return 1;
    }
    else {
        return 0;
    }
}

sub is_valid_year {
    Readonly my $CHECK_DATE_REF => shift;

    if ( !is_year( $CHECK_DATE_REF->{'year'} ) ) {
        return 0;
    }
    else {
        #
    }

    if (   $CHECK_DATE_REF->{'year'} < $CHECK_DATE_REF->{'min'}
        || $CHECK_DATE_REF->{'year'} > $CHECK_DATE_REF->{'max'} )
    {
        return 0;
    }
    else {
        return 1;
    }
}

sub has_only_valid_values {
    Readonly my $PASSPORT_REF => shift;

    if ( !has_valid_ecl( $PASSPORT_REF->{'ecl'} ) ) {
        return 0;
    }
    else {
        #
    }

    if ( !has_valid_hcl( $PASSPORT_REF->{'hcl'} ) ) {
        return 0;
    }
    else {
        #
    }

    if ( !has_valid_height( $PASSPORT_REF->{'hgt'} ) ) {
        return 0;
    }
    else {
        #
    }

    if ( !has_valid_passport_id( $PASSPORT_REF->{'pid'} ) ) {
        return 0;
    }
    else {
        #
    }

    if (!is_valid_year(
            {   'year' => $PASSPORT_REF->{'byr'},
                'min'  => 1920,
                'max'  => 2002
            }
        )
        )
    {
        return 0;
    }
    else {
        #
    }

    if (!is_valid_year(
            {   'year' => $PASSPORT_REF->{'iyr'},
                'min'  => 2010,
                'max'  => 2020
            }
        )
        )
    {
        return 0;
    }
    else {
        #
    }

    if (!is_valid_year(
            {   'year' => $PASSPORT_REF->{'eyr'},
                'min'  => 2020,
                'max'  => 2030
            }
        )
        )
    {
        return 0;
    }
    else {
        #
    }

    return 1;
}

sub is_valid_passport_by_valid_values {
    Readonly my $PASSPORT_REF => shift;

    if ( has_only_valid_values($PASSPORT_REF) ) {
        return 1;
    }
    else {
        return 0;
    }
}

sub add_passport_if_valid_by_values {
    Readonly my $PASSPORTS_REF => shift;
    Readonly my $PASSPORT_REF  => shift;
    my @passports;

    if ( defined $PASSPORTS_REF ) {
        @passports = @{$PASSPORTS_REF};
    }
    else {
        #
    }

    if ( is_valid_passport_by_valid_values($PASSPORT_REF) ) {
        push @passports, $PASSPORT_REF;
    }
    else {
        #
    }

    return \@passports;
}

sub get_valid_passports_by_valid_values {
    Readonly my $PASSPORTS_REF => shift;
    my $valid_passports_ref = [];

    foreach my $passport ( @{$PASSPORTS_REF} ) {
        $valid_passports_ref =
            add_passport_if_valid_by_values( $valid_passports_ref,
            $passport );
    }

    return $valid_passports_ref;
}

1;
