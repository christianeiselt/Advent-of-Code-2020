#!/usr/bin/perl

package AOC2020::Day01;

use warnings;
use strict;
use version; our $VERSION = qv('1.0.2');
my %number = ();

sub getProductTwoNumbersAddingTo2020Helper {
  my ( $numberOne, $numberTwo ) = @_;
  my $notFound = 0;

  if ( $numberTwo != $numberOne ) {
    if ( addsTo2020( $numberOne, $numberTwo ) ) {
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

sub getProductTwoNumbersAddingTo2020 {
  my $input    = shift;
  my @input    = @{$input};
  my $notFound = 0;

  foreach my $numberOne (@input) {
    foreach my $numberTwo (@input) {
      my $product =
          getProductTwoNumbersAddingTo2020Helper( $numberOne, $numberTwo );
      if ( $product != 0 ) {
        return $product;
      }
      else {
      }
    }
  }

  return $notFound;
}

sub getProductThreeNumbersAddingTo2020Helper
{
  my ( $numberOne, $numberTwo, $numberThree ) = @_;
  my $notFound = 0;

  if ( $numberThree != $numberOne && $numberThree != $numberTwo ) {
    if ( addsTo2020( $numberOne, $numberTwo, $numberThree ) ) {
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

sub getProductThreeNumbersAddingTo2020 {
  my $input    = shift;
  my @input    = @{$input};
  my $notFound = 0;

  foreach my $numberOne (@input) {
    foreach my $numberTwo (@input) {
      if ( $numberTwo != $numberOne ) {
        foreach my $numberThree (@input) {
          my $product =
              getProductThreeNumbersAddingTo2020Helper( $numberOne, $numberTwo, $numberThree );
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

sub addsTo2020 {
  my @input      = @_;
  my $addsTo2020 = 0;

  if ( getSum( \@input ) == 2020 ) {
    $addsTo2020 = 1;
  }
  else {
  }

  return $addsTo2020;
}

sub getSum {
  my $numbersRef = shift;
  my @numbers    = @{$numbersRef};
  my $sum        = 0;

  foreach (@numbers) {
    $sum += $_;
  }

  return $sum;
}

sub getNumberA {
  my $self      = shift;
  my $getNumber = shift;
  getProductTwoNumbersAddingTo2020(shift);
  return $number{$getNumber};
}

sub getNumberB {
  my $self      = shift;
  my $getNumber = shift;
  getProductThreeNumbersAddingTo2020(shift);
  return $number{$getNumber};
}

sub getSolutionA {
  my $self  = shift;
  my $input = shift;
  return getProductTwoNumbersAddingTo2020($input);
}

sub getSolutionB {
  my $self  = shift;
  my $input = shift;
  return getProductThreeNumbersAddingTo2020($input);
}

1;
