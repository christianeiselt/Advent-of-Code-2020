#!/usr/bin/perl

package AOC2020::Day01;

use warnings;
use strict;
use version; our $VERSION = qv('1.0.3');
my %number = ();

sub get_product_two_numbers_adding_to_2020_helper {
  my ( $numberOne, $numberTwo ) = @_;
  my $notFound = 0;

  if ( $numberTwo != $numberOne ) {
    if ( adds_to_2020( $numberOne, $numberTwo ) ) {
      $number{1} = $numberOne;
      $number{2} = $numberTwo;
      return $numberOne * $numberTwo;
    }
    else {
    }
  }
  else {
  }

  return $notFound;
}

sub get_product_two_numbers_adding_to_2020 {
  my $input    = shift;
  my @input    = @{$input};
  my $notFound = 0;

  foreach my $numberOne (@input) {
    foreach my $numberTwo (@input) {
      my $product =
          get_product_two_numbers_adding_to_2020_helper( $numberOne, $numberTwo );
      if ( $product != 0 ) {
        return $product;
      }
      else {
      }
    }
  }

  return $notFound;
}

sub get_product_three_numbers_adding_to_2020_helper
{
  my ( $numberOne, $numberTwo, $numberThree ) = @_;
  my $notFound = 0;

  if ( $numberThree != $numberOne && $numberThree != $numberTwo ) {
    if ( adds_to_2020( $numberOne, $numberTwo, $numberThree ) ) {
      $number{1} = $numberOne;
      $number{2} = $numberTwo;
      $number{3} = $numberThree;
      return $numberOne * $numberTwo * $numberThree;
    }
    else {
    }
  }
  else {
  }

  return $notFound;
}

sub get_product_three_numbers_adding_to_2020 {
  my $input    = shift;
  my @input    = @{$input};
  my $notFound = 0;

  foreach my $numberOne (@input) {
    foreach my $numberTwo (@input) {
      if ( $numberTwo != $numberOne ) {
        foreach my $numberThree (@input) {
          my $product =
              get_product_three_numbers_adding_to_2020_helper( $numberOne, $numberTwo, $numberThree );
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

  return $notFound;
}

sub adds_to_2020 {
  my @input      = @_;
  my $addsTo2020 = 0;

  if ( get_sum( \@input ) == 2020 ) {
    $addsTo2020 = 1;
  }
  else {
  }

  return $addsTo2020;
}

sub get_sum {
  my $numbersRef = shift;
  my @numbers    = @{$numbersRef};
  my $sum        = 0;

  foreach (@numbers) {
    $sum += $_;
  }

  return $sum;
}

sub get_number_a {
  my $self      = shift;
  my $getNumber = shift;
  get_product_two_numbers_adding_to_2020(shift);
  return $number{$getNumber};
}

sub get_number_b {
  my $self      = shift;
  my $getNumber = shift;
  get_product_three_numbers_adding_to_2020(shift);
  return $number{$getNumber};
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
