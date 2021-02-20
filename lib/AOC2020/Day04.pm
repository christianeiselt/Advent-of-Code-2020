#!/usr/bin/perl

package AOC2020::Day04;

use warnings;
use strict;
use version; our $VERSION = qv('1.0.5');
use Readonly;
use List::MoreUtils qw(any);

sub get_valid_count_part_one {
    my $self         = shift;
    my $passportList = shift;
    my @passports    = @{ get_passports($passportList) };
    my $validPassports =
        get_valid_passports_by_mandatory_fields_defined( \@passports );

    return scalar( @{$validPassports} );
}

sub get_valid_count_part_two {
    my $self         = shift;
    my $passportList = shift;
    my @passports    = @{ get_passports($passportList) };
    my $potentialValidPassports =
        get_valid_passports_by_mandatory_fields_defined( \@passports );
    my $validPassports =
        get_valid_passports_by_valid_values($potentialValidPassports);

    return scalar( @{$validPassports} );
}

sub get_fields_from_line {
    my $line   = shift;
    my @fields = split( q{ }, $line );

    return \@fields;
}

sub get_fields_for_passport {
    my ( $line, $passport ) = @_;
    my @fields = @{ get_fields_from_line($line) };
    foreach my $field (@fields) {
        my @fieldInfo = split( /:/msx, $field );
        $passport->{"$fieldInfo[0]"} = $fieldInfo[1];
    }

    return $passport;
}

sub get_passports {
    my $passportList = shift;
    my @passports;
    my $passportIndex = 0;

    foreach my $line ( @{$passportList} ) {
        if ( $line eq q{} ) {
            $passportIndex++;
        }
        else {
            $passports[$passportIndex] =
                get_fields_for_passport( $line, $passports[$passportIndex] );
        }
    }

    return \@passports;
}

sub has_all_mandatory_fields_defined {
    my $passport                     = shift;
    my $hasAllMandatoryFieldsDefined = 0;
    my $score                        = 0;
    Readonly my $CORRECT_SCORE => 7;
    $score += defined( $passport->{"ecl"} );
    $score += defined( $passport->{"pid"} );
    $score += defined( $passport->{"eyr"} );
    $score += defined( $passport->{"byr"} );
    $score += defined( $passport->{"hcl"} );
    $score += defined( $passport->{"iyr"} );
    $score += defined( $passport->{"hgt"} );

    if ( $score == $CORRECT_SCORE ) {
        $hasAllMandatoryFieldsDefined = 1;
    }
    else {
        #
    }

    return $hasAllMandatoryFieldsDefined;
}

sub is_valid_passport_by_mandatory_fields_defined {
    my $passport = shift;
    my $isValid  = 0;

    if ( has_all_mandatory_fields_defined($passport) ) {
        $isValid = 1;
    }
    else {
        #
    }

    return $isValid;
}

sub add_if_valid_passport {
    my ( $validPassports, $passport ) = @_;
    my @validPassports;
    if ( defined $validPassports ) {
        @validPassports = @{$validPassports};
    }
    else {
        #
    }

    if ( is_valid_passport_by_mandatory_fields_defined($passport) ) {
        push( @validPassports, $passport );
    }
    else {
        #
    }

    return \@validPassports;
}

sub get_valid_passports_by_mandatory_fields_defined {
    my $passports = shift;
    my $validPassports;

    foreach my $passport ( @{$passports} ) {
        $validPassports = add_if_valid_passport( $validPassports, $passport );
    }

    return $validPassports;
}

sub has_valid_ecl {
    my $ecl      = shift;
    my @validECL = ( "amb", "blu", "brn", "gry", "grn", "hzl", "oth" );
    my $validECL = 0;

    if ( defined($ecl) ) {
        if ( $ecl !~ m/^\#/msx ) {
            if ( any {m{^$ecl$}msx} @validECL ) {
                $validECL = 1;
            }
            else {
                #
            }
        }
        else {
            #
        }
    }
    else {
        #
    }

    return $validECL;
}

sub has_valid_hcl {
    my $hcl      = shift;
    my $validHCL = 0;

    if ( !defined($hcl) ) {
        return $validHCL;
    }
    else {
        #
    }

    if ( $hcl =~ m/^\#[A-F0-9]{6}$/imsx ) {
        $validHCL = 1;
    }
    else {
        #
    }

    return $validHCL;
}

sub get_height_from_chars {
    my $characters = shift;
    my @characters = @{$characters};
    my $value      = q{};
    my $unit       = q{};

    foreach my $char (@characters) {
        if ( $char =~ m/\d/msx ) {
            $value .= $char;
        }
        elsif ( $char =~ m/[a-zA-Z]/imsx ) {
            $unit .= $char;
        }
        else {
            #
        }
    }

    return ( $value, $unit );
}

sub get_centimeter_constraints {
    my $cm = 'cm';
    Readonly my $MIN_HEIGHT => 150;
    Readonly my $MAX_HEIGHT => 193;

    return ( $cm, $MIN_HEIGHT, $MAX_HEIGHT );
}

sub is_valid_cm_height {
    my $value = shift;
    my $unit  = shift;
    my ( $cm, $minHeight, $maxHeight ) = get_centimeter_constraints();
    my $validCMHeight = 0;

    if ( $unit eq $cm && ( $value >= $minHeight && $value <= $maxHeight ) ) {
        $validCMHeight = 1;
    }
    else {
        #
    }

    return $validCMHeight;
}

sub get_inch_constraints {
    my $inch = 'in';
    Readonly my $MIN_HEIGHT => 59;
    Readonly my $MAX_HEIGHT => 76;

    return ( $inch, $MIN_HEIGHT, $MAX_HEIGHT );
}

sub is_valid_inch_height {
    my $value = shift;
    my $unit  = shift;
    my ( $inch, $minHeight, $maxHeight ) = get_inch_constraints();
    my $validINHeight = 0;

    if ( $unit eq $inch && ( $value >= $minHeight && $value <= $maxHeight ) )
    {
        $validINHeight = 1;
    }
    else {
        #
    }

    return $validINHeight;
}

sub has_valid_height {
    my $height      = shift;
    my $validHeight = 0;

    if ( !defined $height ) {
        return 0;
    }
    else {
        #
    }

    my @characters = split //msx, $height;
    my ( $value, $unit ) = get_height_from_chars( \@characters );
    my $isValidCMHeight = is_valid_cm_height( $value, $unit );
    my $isValidINHeight = is_valid_inch_height( $value, $unit );

    if ( $isValidCMHeight || $isValidINHeight ) {
        $validHeight = 1;
    }
    else {
        #
    }

    return $validHeight;
}

sub has_valid_passport_id {
    my $pid      = shift;
    my $validPID = 0;

    if ( $pid =~ m/^[0-9]{9}$/msx ) {
        $validPID = 1;
    }
    else {
        #
    }

    return $validPID;
}

sub is_year {
    my $number = shift;
    my $isYear = 0;

    if ( $number =~ m/[0-9]{4}/msx ) {
        $isYear = 1;
    }
    else {
        #
    }

    return $isYear;
}

sub is_valid_year {
    my $checkDate = shift;
    my $isValid   = 1;

    if ( !is_year( $checkDate->{'year'} ) ) {
        return 0;
    }
    else {
        #
    }

    if (   $checkDate->{'year'} < $checkDate->{'min'}
        || $checkDate->{'year'} > $checkDate->{'max'} )
    {
        return 0;
    }
    else {
        #
    }

    return $isValid;
}

sub has_only_valid_values {
    my $passport = shift;

    if ( !has_valid_ecl( $passport->{"ecl"} ) ) {
        return 0;
    }
    else {
        #
    }

    if ( !has_valid_hcl( $passport->{"hcl"} ) ) {
        return 0;
    }
    else {
        #
    }

    if ( !has_valid_height( $passport->{"hgt"} ) ) {
        return 0;
    }
    else {
        #
    }

    if ( !has_valid_passport_id( $passport->{"pid"} ) ) {
        return 0;
    }
    else {
        #
    }

    if (!is_valid_year(
            { 'year' => $passport->{"byr"}, 'min' => 1920, 'max' => 2002 }
        )
        )
    {
        return 0;
    }
    else {
        #
    }

    if (!is_valid_year(
            { 'year' => $passport->{"iyr"}, 'min' => 2010, 'max' => 2020 }
        )
        )
    {
        return 0;
    }
    else {
        #
    }

    if (!is_valid_year(
            { 'year' => $passport->{"eyr"}, 'min' => 2020, 'max' => 2030 }
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
    my $passport = shift;
    my $isValid  = 0;

    if ( has_only_valid_values($passport) ) {
        $isValid = 1;
    }
    else {
        #
    }

    return $isValid;
}

sub add_passport_if_valid_by_values {
    my ( $passports, $passport ) = @_;
    my @passports;

    if ( defined $passports ) {
        @passports = @{$passports};
    }
    else {
        #
    }

    if ( is_valid_passport_by_valid_values($passport) ) {
        push( @passports, $passport );
    }
    else {
        #
    }

    return \@passports;
}

sub get_valid_passports_by_valid_values {
    my $passports = shift;
    my $validPassports;

    foreach my $passport ( @{$passports} ) {
        $validPassports =
            add_passport_if_valid_by_values( $validPassports, $passport );
    }

    return $validPassports;
}

1;
