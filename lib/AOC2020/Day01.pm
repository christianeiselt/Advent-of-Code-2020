#!/usr/bin/perl

package AOC2020::Day01;

use warnings;
use strict;

my %number = ();

sub getSolutionA
{
  my $self = shift;
  my $input = shift;
  return getProductOfTwo($input);
}

sub getSolutionB
{
  my $self = shift;
  my $input = shift;
  return getProductOfThree($input);
}

sub getNumberA
{
  my $self = shift;
  my $getNumber = shift;
  getProductOfTwo(shift);
  return $number{$getNumber};
}

sub getNumberB
{
  my $self = shift;
  my $getNumber = shift;
  getProductOfThree(shift);
  return $number{$getNumber};
}

sub getProductOfTwo
{
  my $input = shift;
  my @input = @{$input};

  foreach my $i (@input)
  {
    foreach my $j (@input)
    {
      if ($j != $i)
      {
	      if (addsTo2020($i,$j))
	      {
          $number{1} = $i;
          $number{2} = $j;
	        return $i*$j;
	      }
	      else
	      {
	        #
	      }
      }
    }
  }
}

sub getProductOfThree
{
  my $input = shift;
  my @input = @{$input};

  foreach my $i (@input)
  {
    foreach my $j (@input)
    {
      if ($j != $i)
      {
	      foreach my $k (@input)
	      {
          if ($k != $i && $k != $j)
          {
			      if (addsTo2020($i,$j,$k))
			      {
              $number{1} = $i;
              $number{2} = $j;
              $number{3} = $k;
              return $i*$j*$k;
			      }
			      else
			      {
			        #
			      }
          }
	      }
      }
    }
  }
}

sub addsTo2020
{
  my @input = @_;
  my $addsTo2020 = 0;

  if (getSum(\@input) == 2020)
  {
    $addsTo2020 = 1;
  }
  else
  {
    #
  }

  return $addsTo2020;
}

sub getSum
{
  my $numbersRef = shift;
  my @numbers = @{$numbersRef};
  my $sum = 0;

  foreach (@numbers)
  {
    $sum += $_;
  }

  return $sum;
}

1;
