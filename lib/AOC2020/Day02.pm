#!/usr/bin/perl

package AOC2020::Day02;

use warnings;
use strict;
use version; our $VERSION = qv('1.0.3');

# Based on trim function from Gabor Szabo (www.perlmaven.com)
sub trim { my $s = shift; $s =~ s/^\s+|\s+$//gmsx; return $s }

sub get_valid_password_count_for_part {
  my $self            = shift;
  my $part            = shift;
  my $input           = shift;
  my $count           = 0;
  my @passwordEntries = @{$input};

  for my $entry (@passwordEntries) {
    $count = increment_if_valid_password_for_part( $part, $entry, $count );
  }

  return $count;
}

sub get_password_entry_components {
  my $passwordEntry = shift;
  my ( $policyComponent, $passwordComponent ) = split( /:/msx, $passwordEntry );

  return ( $policyComponent, $passwordComponent );
}

sub get_password {
  my $passwordEntry     = shift;
  my $passwordComponent = ( get_password_entry_components($passwordEntry) )[1];
  my $password          = trim($passwordComponent);

  return $password;
}

sub get_letter {
  my $passwordEntry   = shift;
  my $policyComponent = ( get_password_entry_components($passwordEntry) )[0];
  my $letter          = ( get_policy_components($policyComponent) )[0];

  return $letter;
}

sub get_first_number {
  my $passwordEntry   = shift;
  my $policyComponent = ( get_password_entry_components($passwordEntry) )[0];
  my $firstNumber     = ( get_policy_components($policyComponent) )[1];

  return $firstNumber;
}

sub get_second_number {
  my $passwordEntry   = shift;
  my $policyComponent = ( get_password_entry_components($passwordEntry) )[0];
  my $secondNumber    = ( get_policy_components($policyComponent) )[2];

  return $secondNumber;
}

sub get_policy_components {
  my $policy = shift;
  my ( $numbers,     $letter )       = split( /\s/msx, $policy );
  my ( $firstNumber, $secondNumber ) = get_number_components($numbers);

  return ( $letter, $firstNumber, $secondNumber );
}

sub get_number_components {
  my $numbers = shift;
  my ( $firstNumber, $secondNumber ) = split( /-/msx, $numbers );

  return ( $firstNumber, $secondNumber );
}

sub get_letters_of_password {
  my $password = shift;
  my @letters  = split( //msx, $password );

  return \@letters;
}

sub increment_count_if_letter {
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

sub get_count_for_letter {
  my $letter      = shift;
  my $password    = shift;
  my $letterCount = 0;
  my @letters     = @{ get_letters_of_password($password) };

  for my $l (@letters) {
    $letterCount = increment_count_if_letter( $l, $letter, $letterCount );
  }

  return $letterCount;
}

sub count_is_in_range {
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

sub is_valid_password_a {
  my $passwordEntry   = shift;
  my $password        = get_password($passwordEntry);
  my $policyComponent = ( get_password_entry_components($passwordEntry) )[0];
  my ( $letter, $min, $max ) = get_policy_components($policyComponent);
  my $letterCount = get_count_for_letter( $letter, $password );

  if ( count_is_in_range( $letterCount, $min, $max ) ) {
    return 1;
  }
  else {
    return 0;
  }
}

sub increment_if_valid_password_for_part_one {
  my $passwordEntry = shift;
  my $count         = shift;

  if ( is_valid_password_a($passwordEntry) ) {
    $count++;
  }
  else {
    #
  }

  return $count;
}

sub increment_if_valid_password_for_part_two {
  my $passwordEntry = shift;
  my $count         = shift;

  if ( is_valid_password_b($passwordEntry) ) {
    $count++;
  }
  else {
    #
  }

  return $count;
}

sub increment_if_valid_password_for_part {
  my $part          = shift;
  my $passwordEntry = shift;
  my $count         = shift;

  if ( $part == 1 ) {
    $count = increment_if_valid_password_for_part_one( $passwordEntry, $count );
  }
  elsif ( $part == 2 ) {
    $count = increment_if_valid_password_for_part_two( $passwordEntry, $count );
  }

  return $count;
}

sub letter_is_on_position {
  my $password = shift;
  my $letter   = shift;
  my $position = shift;

  my @letters = @{ get_letters_of_password($password) };

  unshift( @letters, 'undef' );

  if ( $letters[$position] eq $letter ) {
    return 1;
  }
  else {
    return 0;
  }
}

sub letter_is_exactly_on_one_position_of {
  my $passwordEntry = shift;
  my $password      = get_password($passwordEntry);
  my $letter        = get_letter($passwordEntry);
  my $posOne        = get_first_number($passwordEntry);
  my $posTwo        = get_second_number($passwordEntry);

  my $isOnPosOne = letter_is_on_position( $password, $letter, $posOne );
  my $isOnPosTwo = letter_is_on_position( $password, $letter, $posTwo );

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

sub is_valid_password_b {
  my $passwordEntry = shift;
  my $isValid       = letter_is_exactly_on_one_position_of($passwordEntry);

  return $isValid;
}

1;
