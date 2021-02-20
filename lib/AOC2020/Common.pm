#!/usr/bin/perl

package AOC2020::Common;

use warnings;
use strict;
use Carp;
use English qw( -no_match_vars );
use version; our $VERSION = qv('1.0.4');

# Based on trim function from Gabor Szabo (www.perlmaven.com)
sub trim { my $s = shift; $s =~ s/^\s+|\s+$//gmsx; return $s }

sub get_chars {
    my $self       = shift;
    my $line       = shift;
    my @characters = split //ms, $line;

    return \@characters;
}

sub get_character_on_position {
    my $self          = shift;
    my $full_map      = shift;
    my $position      = shift;
    my $x             = $position->{'x'};
    my $y             = $position->{'y'};
    my @character_map = @{$full_map};
    my $char          = $character_map[$y][$x];

    return $char;
}

sub get_file_content {
    my $self     = shift;
    my $filename = shift;
    my @content  = ();

    open my $FILE, '<', $filename
        or croak "open failed: $OS_ERROR $filename";

    while (<$FILE>) {
        push @content, trim($_);
    }

    close $FILE or croak "close failed: $CHILD_ERROR, $OS_ERROR $filename";

    return \@content;
}

sub get_number_of_elements {
    my $self               = shift;
    my $list               = shift;
    my $number_of_elements = scalar @{$list};

    return $number_of_elements;
}

1;
