#!/usr/bin/perl

package AOC2020::Day04;

use warnings;
use strict;
use version; our $VERSION = qv('1.0.3');

sub getValidCountPartOne {
  my $self         = shift;
  my $passportList = shift;
  my @passports    = @{ getPassports($passportList) };
  my $validPassports =
      getValidPassportsByMandatoryFieldsDefined( \@passports );

  return scalar( @{$validPassports} );
}

sub getValidCountPartTwo {
  my $self         = shift;
  my $passportList = shift;
  my @passports    = @{ getPassports($passportList) };
  my $potentialValidPassports =
      getValidPassportsByMandatoryFieldsDefined( \@passports );
  my $validPassports =
      getValidPassportsByValidValues($potentialValidPassports);

  return scalar( @{$validPassports} );
}

sub getFieldsFromLine {
  my $line   = shift;
  my @fields = split( ' ', $line );

  return \@fields;
}

sub getFieldsForPassport {
  my ( $line, $passport ) = @_;
  my @fields = @{ getFieldsFromLine($line) };
  foreach my $field (@fields) {
    my @fieldInfo = split( ':', $field );
    $passport->{"$fieldInfo[0]"} = $fieldInfo[1];
  }

  return $passport;
}

sub getPassports {
  my $passportList = shift;
  my @passports;
  my $passportIndex = 0;

  foreach my $line ( @{$passportList} ) {
    if ( $line eq '' ) {
      $passportIndex++;
    }
    else {
      $passports[$passportIndex] =
          getFieldsForPassport( $line, $passports[$passportIndex] );
    }
  }

  return \@passports;
}

sub hasAllMandatoryFieldsDefined {
  my $passport                     = shift;
  my $hasAllMandatoryFieldsDefined = 0;
  my $score                        = 0;
  $score += defined( $passport->{"ecl"} );
  $score += defined( $passport->{"pid"} );
  $score += defined( $passport->{"eyr"} );
  $score += defined( $passport->{"byr"} );
  $score += defined( $passport->{"hcl"} );
  $score += defined( $passport->{"iyr"} );
  $score += defined( $passport->{"hgt"} );

  if ( $score == 7 ) {
    $hasAllMandatoryFieldsDefined = 1;
  }
  else {
    #
  }

  return $hasAllMandatoryFieldsDefined;
}

sub isValidPassportByMandatoryFieldsDefined {
  my $passport = shift;
  my $isValid  = 0;

  if ( hasAllMandatoryFieldsDefined($passport) ) {
    $isValid = 1;
  }

  return $isValid;
}

sub addIfValidPassport {
  my ( $validPassports, $passport ) = @_;
  my @validPassports;
  @validPassports = @{$validPassports} if defined $validPassports;

  if ( isValidPassportByMandatoryFieldsDefined($passport) ) {
    push( @validPassports, $passport );
  }
  else {
    #
  }

  return \@validPassports;
}

sub getValidPassportsByMandatoryFieldsDefined {
  my $passports = shift;
  my $validPassports;

  foreach my $passport ( @{$passports} ) {
    $validPassports = addIfValidPassport( $validPassports, $passport );
  }

  return $validPassports;
}

sub hasValidECL {
  my $ecl      = shift;
  my @validECL = ( "amb", "blu", "brn", "gry", "grn", "hzl", "oth" );
  my $validECL = 0;

  if ( defined($ecl) ) {
    if ( grep {/^$ecl/x} @validECL ) {
      $validECL = 1;
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

sub hasValidHCL {
  my $hcl      = shift;
  my $validHCL = 0;

  if ( !defined($hcl) ) {
    return $validHCL;
  }

  if ( $hcl =~ m/^#[A-F0-9]{6}$/ix ) {
    $validHCL = 1;
  }
  else {
    #
  }

  return $validHCL;
}

sub getHeightFromChars {
  my $characters = shift;
  my @characters = @{$characters};
  my $value      = '';
  my $unit       = '';

  foreach my $char (@characters) {
    if ( $char =~ m/\d/x ) {
      $value .= $char;
    }
    elsif ( $char =~ m/[a-zA-Z]/ix ) {
      $unit .= $char;
    }
    else {
      #
    }
  }

  return ( $value, $unit );
}

sub getCentimeterConstraints {
  my $cm        = 'cm';
  my $minHeight = 150;
  my $maxHeight = 193;

  return ( $cm, $minHeight, $maxHeight );
}

sub isValidCMHeight {
  my $value = shift;
  my $unit  = shift;
  my ( $cm, $minHeight, $maxHeight ) = getCentimeterConstraints();
  my $validCMHeight = 0;

  if ( $unit eq $cm && ( $value >= $minHeight && $value <= $maxHeight ) ) {
    $validCMHeight = 1;
  }
  else {
    #
  }

  return $validCMHeight;
}

sub getInchConstraints {
  my $inch      = 'in';
  my $minHeight = 59;
  my $maxHeight = 76;

  return ( $inch, $minHeight, $maxHeight );
}

sub isValidINHeight {
  my $value = shift;
  my $unit  = shift;
  my ( $inch, $minHeight, $maxHeight ) = getInchConstraints();
  my $validINHeight = 0;

  if ( $unit eq $inch && ( $value >= $minHeight && $value <= $maxHeight ) ) {
    $validINHeight = 1;
  }
  else {
    #
  }

  return $validINHeight;
}

sub hasValidHeight {
  my $height      = shift;
  my $validHeight = 0;

  if ( !defined $height ) {
    return 0;
  }

  my @characters = split( '', $height );
  my ( $value, $unit ) = getHeightFromChars( \@characters );
  my $isValidCMHeight = isValidCMHeight( $value, $unit );
  my $isValidINHeight = isValidINHeight( $value, $unit );

  if ( $isValidCMHeight || $isValidINHeight ) {
    $validHeight = 1;
  }
  else {
    #
  }

  return $validHeight;
}

sub hasValidPassportId {
  my $pid      = shift;
  my $validPID = 0;

  if ( $pid =~ m/^[0-9]{9}$/x ) {
    $validPID = 1;
  }
  else {
    #
  }

  return $validPID;
}

sub isYear {
  my $number = shift;
  my $isYear = 0;

  if ( $number =~ m/[0-9]{4}/x ) {
    $isYear = 1;
  }
  else {
    #
  }

  return $isYear;
}

sub isValidYear {
  my $checkDate = shift;
  my $isValid   = 1;

  if ( !isYear( $checkDate->{'year'} ) ) {
    return 0;
  }

  if ( $checkDate->{'year'} < $checkDate->{'min'}
    || $checkDate->{'year'} > $checkDate->{'max'} )
  {
    return 0;
  }

  return $isValid;
}

sub hasOnlyValidValues {
  my $passport = shift;

  if ( !hasValidECL( $passport->{"ecl"} ) ) {
    return 0;
  }

  if ( !hasValidHCL( $passport->{"hcl"} ) ) {
    return 0;
  }

  if ( !hasValidHeight( $passport->{"hgt"} ) ) {
    return 0;
  }

  if ( !hasValidPassportId( $passport->{"pid"} ) ) {
    return 0;
  }

  if (
    !isValidYear(
      { 'year' => $passport->{"byr"}, 'min' => 1920, 'max' => 2002 }
    )
      )
  {
    return 0;
  }

  if (
    !isValidYear(
      { 'year' => $passport->{"iyr"}, 'min' => 2010, 'max' => 2020 }
    )
      )
  {
    return 0;
  }

  if (
    !isValidYear(
      { 'year' => $passport->{"eyr"}, 'min' => 2020, 'max' => 2030 }
    )
      )
  {
    return 0;
  }

  return 1;
}

sub isValidPassportByValidValues {
  my $passport = shift;
  my $isValid  = 0;

  if ( hasOnlyValidValues($passport) ) {
    $isValid = 1;
  }
  else {
    #
  }

  return $isValid;
}

sub addPassportIfValidByValues {
  my ( $passports, $passport ) = @_;
  my @passports;
  @passports = @{$passports} if defined $passports;

  if ( isValidPassportByValidValues($passport) ) {
    push( @passports, $passport );
  }
  else {
    #
  }

  return \@passports;
}

sub getValidPassportsByValidValues {
  my $passports = shift;
  my $validPassports;

  foreach my $passport ( @{$passports} ) {
    $validPassports =
        addPassportIfValidByValues( $validPassports, $passport );
  }

  return $validPassports;
}

1;
