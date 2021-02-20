#!/usr/bin/perl

package AOC2020::Day04;

use warnings;
use strict;
use Readonly;
use List::MoreUtils qw(any);
use version; our $VERSION = qv('1.0.6');

sub get_valid_count_part_one {
    my $self          = shift;
    my $passport_list = shift;
    my @passports     = @{ get_passports($passport_list) };
    my $valid_passports =
        get_valid_passports_by_mandatory_fields_defined( \@passports );

    return scalar @{$valid_passports};
}

sub get_valid_count_part_two {
    my $self          = shift;
    my $passport_list = shift;
    my @passports     = @{ get_passports($passport_list) };
    my $potential_valid_passports =
        get_valid_passports_by_mandatory_fields_defined( \@passports );
    my $valid_passports =
        get_valid_passports_by_valid_values($potential_valid_passports);

    return scalar @{$valid_passports};
}

sub get_fields_from_line {
    my $line   = shift;
    my @fields = split /\s/msx, $line;

    return \@fields;
}

sub get_fields_for_passport {
    my ( $line, $passport ) = @_;
    my @fields = @{ get_fields_from_line($line) };
    foreach my $field (@fields) {
        my @field_info = split /:/msx, $field;
        $passport->{"$field_info[0]"} = $field_info[1];
    }

    return $passport;
}

sub get_passports {
    my $passport_list = shift;
    my @passports;
    my $passport_index = 0;

    foreach my $line ( @{$passport_list} ) {
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
    my $passport                         = shift;
    my $has_all_mandatory_fields_defined = 0;
    my $score                            = 0;
    Readonly my $CORRECT_SCORE => 7;
    $score += defined( $passport->{'ecl'} );
    $score += defined( $passport->{'pid'} );
    $score += defined( $passport->{'eyr'} );
    $score += defined( $passport->{'byr'} );
    $score += defined( $passport->{'hcl'} );
    $score += defined( $passport->{'iyr'} );
    $score += defined( $passport->{'hgt'} );

    if ( $score == $CORRECT_SCORE ) {
        $has_all_mandatory_fields_defined = 1;
    }
    else {
        #
    }

    return $has_all_mandatory_fields_defined;
}

sub is_valid_passport_by_mandatory_fields_defined {
    my $passport          = shift;
    my $is_valid_passport = 0;

    if ( has_all_mandatory_fields_defined($passport) ) {
        $is_valid_passport = 1;
    }
    else {
        #
    }

    return $is_valid_passport;
}

sub add_if_valid_passport {
    my ( $valid_passports, $passport ) = @_;
    my @valid_passports;
    if ( defined $valid_passports ) {
        @valid_passports = @{$valid_passports};
    }
    else {
        #
    }

    if ( is_valid_passport_by_mandatory_fields_defined($passport) ) {
        push @valid_passports, $passport;
    }
    else {
        #
    }

    return \@valid_passports;
}

sub get_valid_passports_by_mandatory_fields_defined {
    my $passports = shift;
    my $valid_passports;

    foreach my $passport ( @{$passports} ) {
        $valid_passports =
            add_if_valid_passport( $valid_passports, $passport );
    }

    return $valid_passports;
}

sub has_valid_ecl {
    my $ecl          = shift;
    my @valid_ecl    = qw( amb blu brn gry grn hzl oth );
    my $is_valid_ecl = 0;

    if ( defined $ecl ) {
        if ( $ecl !~ m/^\#/msx ) {
            if ( any {m{^$ecl$}msx} @valid_ecl ) {
                $is_valid_ecl = 1;
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

    return $is_valid_ecl;
}

sub has_valid_hcl {
    my $hcl          = shift;
    my $is_valid_hcl = 0;

    if ( !defined $hcl ) {
        return $is_valid_hcl;
    }
    else {
        #
    }

    if ( $hcl =~ m/^\#[A-F\d]{6}$/imsx ) {
        $is_valid_hcl = 1;
    }
    else {
        #
    }

    return $is_valid_hcl;
}

sub get_height_from_chars {
    my $characters = shift;
    my @characters = @{$characters};
    my $EMPTY      = q{};
    my $value      = $EMPTY;
    my $unit       = $EMPTY;

    foreach my $char (@characters) {
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
    my $value = shift;
    my $unit  = shift;
    my ( $cm, $min_height, $max_height ) = get_centimeter_constraints();
    my $is_valid_cm_height = 0;

    if ( $unit eq $cm && ( $value >= $min_height && $value <= $max_height ) )
    {
        $is_valid_cm_height = 1;
    }
    else {
        #
    }

    return $is_valid_cm_height;
}

sub get_inch_constraints {
    Readonly my $INCH       => 'in';
    Readonly my $MIN_HEIGHT => 59;
    Readonly my $MAX_HEIGHT => 76;

    return $INCH, $MIN_HEIGHT, $MAX_HEIGHT;
}

sub is_valid_inch_height {
    my $value = shift;
    my $unit  = shift;
    my ( $inch, $min_height, $max_height ) = get_inch_constraints();
    my $is_valid_inch_height = 0;

    if ( $unit eq $inch
        && ( $value >= $min_height && $value <= $max_height ) )
    {
        $is_valid_inch_height = 1;
    }
    else {
        #
    }

    return $is_valid_inch_height;
}

sub has_valid_height {
    my $height          = shift;
    my $is_valid_height = 0;

    if ( !defined $height ) {
        return 0;
    }
    else {
        #
    }

    my @characters = split //msx, $height;
    my ( $value, $unit ) = get_height_from_chars( \@characters );
    my $is_valid_cm_height   = is_valid_cm_height( $value, $unit );
    my $is_valid_inch_height = is_valid_inch_height( $value, $unit );

    if ( $is_valid_cm_height || $is_valid_inch_height ) {
        $is_valid_height = 1;
    }
    else {
        #
    }

    return $is_valid_height;
}

sub has_valid_passport_id {
    my $pid          = shift;
    my $is_valid_pid = 0;

    if ( $pid =~ m/^[\d]{9}$/msx ) {
        $is_valid_pid = 1;
    }
    else {
        #
    }

    return $is_valid_pid;
}

sub is_year {
    my $number  = shift;
    my $is_year = 0;

    if ( $number =~ m/[\d]{4}/msx ) {
        $is_year = 1;
    }
    else {
        #
    }

    return $is_year;
}

sub is_valid_year {
    my $check_date    = shift;
    my $is_valid_year = 1;

    if ( !is_year( $check_date->{'year'} ) ) {
        return 0;
    }
    else {
        #
    }

    if (   $check_date->{'year'} < $check_date->{'min'}
        || $check_date->{'year'} > $check_date->{'max'} )
    {
        return 0;
    }
    else {
        #
    }

    return $is_valid_year;
}

sub has_only_valid_values {
    my $passport = shift;

    if ( !has_valid_ecl( $passport->{'ecl'} ) ) {
        return 0;
    }
    else {
        #
    }

    if ( !has_valid_hcl( $passport->{'hcl'} ) ) {
        return 0;
    }
    else {
        #
    }

    if ( !has_valid_height( $passport->{'hgt'} ) ) {
        return 0;
    }
    else {
        #
    }

    if ( !has_valid_passport_id( $passport->{'pid'} ) ) {
        return 0;
    }
    else {
        #
    }

    if (!is_valid_year(
            { 'year' => $passport->{'byr'}, 'min' => 1920, 'max' => 2002 }
        )
        )
    {
        return 0;
    }
    else {
        #
    }

    if (!is_valid_year(
            { 'year' => $passport->{'iyr'}, 'min' => 2010, 'max' => 2020 }
        )
        )
    {
        return 0;
    }
    else {
        #
    }

    if (!is_valid_year(
            { 'year' => $passport->{'eyr'}, 'min' => 2020, 'max' => 2030 }
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
    my $passport          = shift;
    my $is_valid_passport = 0;

    if ( has_only_valid_values($passport) ) {
        $is_valid_passport = 1;
    }
    else {
        #
    }

    return $is_valid_passport;
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
        push @passports, $passport;
    }
    else {
        #
    }

    return \@passports;
}

sub get_valid_passports_by_valid_values {
    my $passports = shift;
    my $valid_passports;

    foreach my $passport ( @{$passports} ) {
        $valid_passports =
            add_passport_if_valid_by_values( $valid_passports, $passport );
    }

    return $valid_passports;
}

1;
