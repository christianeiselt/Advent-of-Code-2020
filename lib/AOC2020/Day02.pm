#!/usr/bin/perl

package AOC2020::Day02;

use warnings;
use strict;
use version; our $VERSION = qv('1.0.5');

# Based on trim function from Gabor Szabo (www.perlmaven.com)
sub trim { my $s = shift; $s =~ s/^\s+|\s+$//gmsx; return $s }

sub get_valid_password_count_for_part {
  my $self             = shift;
  my $part             = shift;
  my $input            = shift;
  my $count            = 0;
  my @password_entries = @{$input};

  for my $entry (@password_entries) {
    $count = increment_if_valid_password_for_part( $part, $entry, $count );
  }

  return $count;
}

sub get_password_entry_components {
  my $password_entry = shift;
  my ( $policy_component, $password_component ) =
      split( /:/msx, $password_entry );

  return ( $policy_component, $password_component );
}

sub get_password {
  my $password_entry = shift;
  my $password_component =
      ( get_password_entry_components($password_entry) )[1];
  my $password = trim($password_component);

  return $password;
}

sub get_letter {
  my $password_entry = shift;
  my $policy_component =
      ( get_password_entry_components($password_entry) )[0];
  my $letter = ( get_policy_components($policy_component) )[0];

  return $letter;
}

sub get_first_number {
  my $password_entry = shift;
  my $policy_component =
      ( get_password_entry_components($password_entry) )[0];
  my $first_number = ( get_policy_components($policy_component) )[1];

  return $first_number;
}

sub get_second_number {
  my $password_entry   = shift;
  my $policy_component = ( get_password_entry_components($password_entry) )[0];
  my $second_number    = ( get_policy_components($policy_component) )[2];

  return $second_number;
}

sub get_policy_components {
  my $policy = shift;
  my ( $numbers,     $letter )       = split( /\s/msx, $policy );
  my ( $first_number, $second_number ) = get_number_components($numbers);

  return ( $letter, $first_number, $second_number );
}

sub get_number_components {
  my $numbers = shift;
  my ( $first_number, $second_number ) = split( /-/msx, $numbers );

  return ( $first_number, $second_number );
}

sub get_letters_of_password {
  my $password = shift;
  my @letters  = split( //msx, $password );

  return \@letters;
}

sub increment_count_if_letter {
  my $input_letter = shift;
  my $match_letter = shift;
  my $count       = shift;

  if ( $input_letter eq $match_letter ) {
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
  my $letter_count = 0;
  my @letters     = @{ get_letters_of_password($password) };

  for my $l (@letters) {
    $letter_count = increment_count_if_letter( $l, $letter, $letter_count );
  }

  return $letter_count;
}

sub count_is_in_range {
  my $letter_count = shift;
  my $min         = shift;
  my $max         = shift;

  if ( $letter_count >= $min && $letter_count <= $max ) {
    return 1;
  }
  else {
    return 0;
  }
}

sub is_valid_password_a {
  my $password_entry   = shift;
  my $password        = get_password($password_entry);
  my $policy_component = ( get_password_entry_components($password_entry) )[0];
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
  my $password_entry = shift;
  my $count         = shift;

  if ( is_valid_password_a($password_entry) ) {
    $count++;
  }
  else {
    #
  }

  return $count;
}

sub increment_if_valid_password_for_part_two {
  my $password_entry = shift;
  my $count         = shift;

  if ( is_valid_password_b($password_entry) ) {
    $count++;
  }
  else {
    #
  }

  return $count;
}

sub increment_if_valid_password_for_part {
  my $part          = shift;
  my $password_entry = shift;
  my $count         = shift;

  if ( $part == 1 ) {
    $count =
        increment_if_valid_password_for_part_one( $password_entry, $count );
  }
  elsif ( $part == 2 ) {
    $count =
        increment_if_valid_password_for_part_two( $password_entry, $count );
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
  my $password_entry = shift;
  my $password      = get_password($password_entry);
  my $letter        = get_letter($password_entry);
  my $pos_one        = get_first_number($password_entry);
  my $pos_two        = get_second_number($password_entry);

  my $is_on_pos_one = letter_is_on_position( $password, $letter, $pos_one );
  my $is_on_pos_two = letter_is_on_position( $password, $letter, $pos_two );

  if ( $is_on_pos_one && $is_on_pos_two ) {
    return 0;
  }
  elsif ( !$is_on_pos_one && !$is_on_pos_two ) {
    return 0;
  }
  else {
    return 1;
  }
}

sub is_valid_password_b {
  my $password_entry = shift;
  my $is_valid       = letter_is_exactly_on_one_position_of($password_entry);

  return $is_valid;
}

1;
