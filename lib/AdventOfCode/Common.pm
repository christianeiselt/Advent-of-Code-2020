#!/usr/bin/perl

package AdventOfCode::Common;

use warnings;
use strict;
use Carp;
use English qw( -no_match_vars );
use List::MoreUtils qw(any);
use Readonly;
use version; our $VERSION = qv('1.0.13');

# Based on trim function from Gabor Szabo (www.perlmaven.com)
sub trim { my $s = shift; $s =~ s/^\s+|\s+$//gmsx; return $s }


sub get_chars {
	Readonly my $SELF => shift;
	Readonly my $LINE => shift;
	my @characters;

	if ( defined $LINE ) {
		@characters = split //ms, $LINE;
	}else {
	}

	return \@characters;
}


sub get_character_on_position {
	Readonly my $SELF         => shift;
	Readonly my $FULL_MAP_REF => shift;
	Readonly my $POSITION_REF => shift;
	Readonly my $X            => $POSITION_REF->{'x'};
	Readonly my $Y            => $POSITION_REF->{'y'};
	my @character_map = @{$FULL_MAP_REF};
	Readonly my $CHAR => $character_map[$Y][$X];

	return $CHAR;
}


sub get_file_content {
	Readonly my $SELF      => shift;
	Readonly my $FILE_NAME => shift;
	my @content = ();

	open my $FILE, '<', $FILE_NAME
	  or croak "open failed: $OS_ERROR $FILE_NAME";

	while (<$FILE>) {
		push @content, trim($_);
	}

	close $FILE or croak "close failed: $CHILD_ERROR, $OS_ERROR $FILE_NAME";

	return \@content;
}


sub list_contains_number {
	Readonly my $SELF     => shift;
	Readonly my $LIST_REF => shift;
	Readonly my $NUMBER   => shift;
	Readonly my @LIST     => @{$LIST_REF};

	if ( any {m{^$NUMBER$}msx} @LIST ) {
		return 1;
	}else {
		return 0;
	}

	return;
}

1;
