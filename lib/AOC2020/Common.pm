#!/usr/bin/perl

package AOC2020::Common;

use warnings;
use strict;
use Carp;
use version; our $VERSION = qv('1.0.2');

# Based on trim function from Gabor Szabo (www.perlmaven.com)
sub trim { my $s = shift; $s =~ s/^\s+|\s+$//gx; return $s }

sub getChars {
  my $self       = shift;
  my $line       = shift;
  my @characters = split( //, $line );

  return \@characters;
}

sub getCharacterOnPosition {
  my $self         = shift;
  my $fullMap      = shift;
  my $position     = shift;
  my $x            = $position->{'x'};
  my $y            = $position->{'y'};
  my @characterMap = @{$fullMap};
  my $char         = $characterMap[$y][$x];

  return $char;
}

sub getFileContent {
  my $self     = shift;
  my $filename = shift;
  my @content  = ();

  open( my $FILE, '<', $filename ) or croak "$! $filename";

  while (<$FILE>) {
    push( @content, trim($_) );
  }

  close($FILE);

  return \@content;
}

sub getNumberOfElements {
  my $self             = shift;
  my $list             = shift;
  my $numberOfElements = scalar( @{$list} );

  return $numberOfElements;
}

1;
