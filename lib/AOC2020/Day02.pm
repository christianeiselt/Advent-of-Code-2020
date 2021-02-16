#!/usr/bin/perl

package AOC2020::Day02;

use warnings;
use strict;
use version; our $VERSION = qv('1.0.2');

# Based on trim function from Gabor Szabo (www.perlmaven.com)
sub trim { my $s = shift; $s =~ s/^\s+|\s+$//gx; return $s }

sub getValidPasswordCountForPart {
  my $self            = shift;
  my $part            = shift;
  my $input           = shift;
  my $count           = 0;
  my @passwordEntries = @{$input};

  for my $entry (@passwordEntries) {
    $count = incrementIfValidPasswordForPart( $part, $entry, $count );
  }

  return $count;
}

sub getPasswordEntryComponents {
  my $passwordEntry = shift;
  my ( $policyComponent, $passwordComponent ) = split( ':', $passwordEntry );

  return ( $policyComponent, $passwordComponent );
}

sub getPassword {
  my $passwordEntry     = shift;
  my $passwordComponent = ( getPasswordEntryComponents($passwordEntry) )[1];
  my $password          = trim($passwordComponent);

  return $password;
}

sub getLetter {
  my $passwordEntry   = shift;
  my $policyComponent = ( getPasswordEntryComponents($passwordEntry) )[0];
  my $letter          = ( getPolicyComponents($policyComponent) )[0];

  return $letter;
}

sub getFirstNumber {
  my $passwordEntry   = shift;
  my $policyComponent = ( getPasswordEntryComponents($passwordEntry) )[0];
  my $firstNumber     = ( getPolicyComponents($policyComponent) )[1];

  return $firstNumber;
}

sub getSecondNumber {
  my $passwordEntry   = shift;
  my $policyComponent = ( getPasswordEntryComponents($passwordEntry) )[0];
  my $secondNumber    = ( getPolicyComponents($policyComponent) )[2];

  return $secondNumber;
}

sub getPolicyComponents {
  my $policy = shift;
  my ( $numbers,     $letter )       = split( ' ', $policy );
  my ( $firstNumber, $secondNumber ) = getNumberComponents($numbers);

  return ( $letter, $firstNumber, $secondNumber );
}

sub getNumberComponents {
  my $numbers = shift;
  my ( $firstNumber, $secondNumber ) = split( '-', $numbers );

  return ( $firstNumber, $secondNumber );
}

sub getLettersOfPassword {
  my $password = shift;
  my @letters  = split( '', $password );

  return \@letters;
}

sub incrementCountIfLetter {
  my $inputLetter = shift;
  my $matchLetter = shift;
  my $count       = shift;

  if ( $inputLetter eq $matchLetter ) {
    $count++;
  }
  else {
    #
  }

  return $count;
}

sub getCountForLetter {
  my $letter      = shift;
  my $password    = shift;
  my $letterCount = 0;
  my @letters     = @{ getLettersOfPassword($password) };

  for my $l (@letters) {
    $letterCount = incrementCountIfLetter( $l, $letter, $letterCount );
  }

  return $letterCount;
}

sub countIsInRange {
  my $letterCount = shift;
  my $min         = shift;
  my $max         = shift;

  if ( $letterCount >= $min && $letterCount <= $max ) {
    return 1;
  }
  else {
    return 0;
  }
}

sub isValidPasswordA {
  my $passwordEntry   = shift;
  my $password        = getPassword($passwordEntry);
  my $policyComponent = ( getPasswordEntryComponents($passwordEntry) )[0];
  my ( $letter, $min, $max ) = getPolicyComponents($policyComponent);
  my $letterCount = getCountForLetter( $letter, $password );

  if ( countIsInRange( $letterCount, $min, $max ) ) {
    return 1;
  }
  else {
    return 0;
  }
}

sub getValuesForValidation {
  my $passwordEntry = shift;

  my ( $policy, $passwordComponent ) =
      getPasswordEntryComponents($passwordEntry);
  my $password = getPassword($passwordEntry);

  return ( $policy, $password );
}

sub incrementIfValidPasswordForPartOne {
  my $passwordEntry = shift;
  my $count         = shift;

  if ( isValidPasswordA($passwordEntry) ) {
    $count++;
  }
  else {
    #
  }

  return $count;
}

sub incrementIfValidPasswordForPartTwo {
  my $passwordEntry = shift;
  my $count         = shift;

  if ( isValidPasswordB($passwordEntry) ) {
    $count++;
  }
  else {
    #
  }

  return $count;
}

sub incrementIfValidPasswordForPart {
  my $part          = shift;
  my $passwordEntry = shift;
  my $count         = shift;

  if ( $part == 1 ) {
    $count = incrementIfValidPasswordForPartOne( $passwordEntry, $count );
  }
  elsif ( $part == 2 ) {
    $count = incrementIfValidPasswordForPartTwo( $passwordEntry, $count );
  }

  return $count;
}

sub letterIsOnPosition {
  my $password = shift;
  my $letter   = shift;
  my $position = shift;

  my @letters = @{ getLettersOfPassword($password) };

  unshift( @letters, 'undef' );

  if ( $letters[$position] eq $letter ) {
    return 1;
  }
  else {
    return 0;
  }
}

sub letterIsExactlyOnOnePositionOf {
  my $passwordEntry = shift;
  my $password      = getPassword($passwordEntry);
  my $letter        = getLetter($passwordEntry);
  my $posOne        = getFirstNumber($passwordEntry);
  my $posTwo        = getSecondNumber($passwordEntry);

  my $isOnPosOne = letterIsOnPosition( $password, $letter, $posOne );
  my $isOnPosTwo = letterIsOnPosition( $password, $letter, $posTwo );

  if ( $isOnPosOne && $isOnPosTwo ) {
    return 0;
  }
  elsif ( !$isOnPosOne && !$isOnPosTwo ) {
    return 0;
  }
  else {
    return 1;
  }
}

sub isValidPasswordB {
  my $passwordEntry = shift;
  my $isValid       = letterIsExactlyOnOnePositionOf($passwordEntry);

  return $isValid;
}

1;
