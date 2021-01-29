#!/usr/bin/perl

package AOC2020::Common;

use warnings;
use strict;

# Thanks to Gabor Szabo (www.perlmaven.com)
sub ltrim { my $s = shift; $s =~ s/^\s+//;       return $s };
sub rtrim { my $s = shift; $s =~ s/\s+$//;       return $s };
sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

sub getChars
{
  my $self = shift;
  my $line = shift;
  my @characters = split(//,$line);

  return \@characters;
}

sub getCharacterOnPosition
{
  my $self = shift;
  my $fullMap = shift;
  my $position = shift;
  my $x = $position->{'x'};
  my $y = $position->{'y'};
  my @characterMap = @{$fullMap};
  my $char = $characterMap[$y][$x];

  return $char;
}

sub getFileContent
{
  my $self = shift;
  my $filename = shift;
  my @content = ();

  open(FH, '<', $filename) or die $!;

  while(<FH>){
     push(@content, trim($_));
  }

  close(FH);

  return \@content;
}

sub getNumberOfElements
{
  my $self = shift;
  my $list = shift;
  my $numberOfElements = scalar(@{$list});

  return $numberOfElements;
}

1;