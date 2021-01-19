#!/usr/bin/perl

package AOC2020::Common;

use warnings;
use strict;

# Thanks to Gabor Szabo (www.perlmaven.com)
sub ltrim { my $s = shift; $s =~ s/^\s+//;       return $s };
sub rtrim { my $s = shift; $s =~ s/\s+$//;       return $s };
sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

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

1;