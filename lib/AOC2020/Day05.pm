#!/usr/bin/perl

package AOC2020::Day05;

use warnings;
use strict;
use Readonly;
use List::MoreUtils qw(any);
use version; our $VERSION = qv('1.0.1');

sub solve_part_1 {
    Readonly my $SELF      => shift;
    Readonly my $INPUT_REF => shift;
    Readonly my $RESULT    => get_highest_seat_id($INPUT_REF);

    return $RESULT;
}

sub solve_part_2 {
    Readonly my $SELF      => shift;
    Readonly my $INPUT_REF => shift;
    Readonly my $RESULT    => get_my_seat_id($INPUT_REF);

    return $RESULT;
}

sub get_binary_row_id {
    Readonly my $BOARDING_PASS     => shift;
    Readonly my $BINARY_ROW_START  => 0;
    Readonly my $BINARY_ROW_LENGTH => 7;

    return substr $BOARDING_PASS, $BINARY_ROW_START, $BINARY_ROW_LENGTH;
}

sub get_range {
    Readonly my $INPUT_REF  => shift;
    Readonly my $CHAR_FRONT => 'F';
    Readonly my $CHAR_BACK  => 'B';
    Readonly my $CHAR_LEFT  => 'L';
    Readonly my $CHAR_RIGHT => 'R';

    if (   $INPUT_REF->{'char'} =~ m/$CHAR_FRONT/msx
        || $INPUT_REF->{'char'} =~ m/$CHAR_LEFT/msx )
    {
        return $INPUT_REF->{'min'},
            $INPUT_REF->{'min'} + $INPUT_REF->{'count'};
    }
    elsif ($INPUT_REF->{'char'} =~ m/$CHAR_BACK/msx
        || $INPUT_REF->{'char'} =~ m/$CHAR_RIGHT/msx )
    {
        return $INPUT_REF->{'min'} + $INPUT_REF->{'count'},
            $INPUT_REF->{'max'};
    }
    else {
        return;
    }
}

sub calculate_row {
    Readonly my $BINARY_ROW       => shift;
    Readonly my @BINARY_ROW_CHARS => split //msx, $BINARY_ROW;
    Readonly my $NUMBER_OF_ROWS   => 128;
    Readonly my $DEFAULT_ROW_MAX  => 127;
    Readonly my $DEFAULT_ROW_MIN  => 0;
    my $available_row_count = $NUMBER_OF_ROWS;
    my $row_min             = $DEFAULT_ROW_MIN;
    my $row_max             = $DEFAULT_ROW_MAX;

    foreach my $char (@BINARY_ROW_CHARS) {
        $available_row_count = $available_row_count / 2;
        ( $row_min, $row_max ) = get_range(
            {   'char'  => $char,
                'min'   => $row_min,
                'max'   => $row_max,
                'count' => $available_row_count,
            }
        );
    }

    return $row_min;
}

sub get_row {
    Readonly my $BOARDING_PASS => shift;
    Readonly my $BINARY_ROW    => get_binary_row_id($BOARDING_PASS);
    Readonly my $ROW           => calculate_row($BINARY_ROW);

    return $ROW;
}

sub get_binary_column {
    Readonly my $BOARDING_PASS        => shift;
    Readonly my $BINARY_COLUMN_START  => 7;
    Readonly my $BINARY_COLUMN_LENGTH => 3;

    return substr $BOARDING_PASS, $BINARY_COLUMN_START, $BINARY_COLUMN_LENGTH;
}

sub calculate_column {
    Readonly my $BINARY_COLUMN       => shift;
    Readonly my @BINARY_COLUMN_CHARS => split //msx, $BINARY_COLUMN;
    Readonly my $NUMBER_OF_COLUMNS   => 8;
    Readonly my $DEFAULT_COLUMN_MAX  => 7;
    Readonly my $DEFAULT_COLUMN_MIN  => 0;
    my $available_column_count = $NUMBER_OF_COLUMNS;
    my $column_min             = $DEFAULT_COLUMN_MIN;
    my $column_max             = $DEFAULT_COLUMN_MAX;

    foreach my $char (@BINARY_COLUMN_CHARS) {
        $available_column_count = $available_column_count / 2;
        ( $column_min, $column_max ) = get_range(
            {   'char'  => $char,
                'min'   => $column_min,
                'max'   => $column_max,
                'count' => $available_column_count,
            }
        );
    }

    return $column_min;

}

sub get_column {
    Readonly my $BOARDING_PASS => shift;
    Readonly my $BINARY_COLUMN => get_binary_column($BOARDING_PASS);
    Readonly my $COLUMN        => calculate_column($BINARY_COLUMN);

    return $COLUMN;
}

sub get_seat_id {
    Readonly my $ROW           => shift;
    Readonly my $COLUMN        => shift;
    Readonly my $MULTIPLICATOR => 8;

    return $ROW * $MULTIPLICATOR + $COLUMN;
}

sub get_boarding_passes {
    Readonly my $BINARY_BOARDING_PASSES_REF => shift;
    Readonly my @BOARDING_PASSES            => @{$BINARY_BOARDING_PASSES_REF};
    my $boarding_passes_ref = {};

    foreach my $boarding_pass (@BOARDING_PASSES) {
        Readonly my $ROW     => get_row($boarding_pass);
        Readonly my $COLUMN  => get_column($boarding_pass);
        Readonly my $SEAT_ID => get_seat_id( $ROW, $COLUMN );

        $boarding_passes_ref->{$boarding_pass} = {
            'row'     => $ROW,
            'column'  => $COLUMN,
            'seat_id' => $SEAT_ID,
        };
    }

    return $boarding_passes_ref;
}

sub get_highest_seat_id {
    Readonly my $BINARY_BOARDING_PASSES_REF => shift;
    Readonly my $BOARDING_PASSES_REF        =>
        get_boarding_passes($BINARY_BOARDING_PASSES_REF);
    my $highest_seat_id = 0;

    for my $boarding_pass ( keys %{$BOARDING_PASSES_REF} ) {

       #        print "$BOARDING_PASSES_REF->{$boarding_pass}->{'seat_id'}\n";
        if ( $BOARDING_PASSES_REF->{$boarding_pass}->{'seat_id'}
            > $highest_seat_id )
        {
            $highest_seat_id =
                $BOARDING_PASSES_REF->{$boarding_pass}->{'seat_id'};
        }
        else {
            #
        }
    }

    return $highest_seat_id;
}

sub get_seat_occupation_list {
    Readonly my $BINARY_BOARDING_PASSES_REF => shift;
    Readonly my $BOARDING_PASSES_REF        =>
        get_boarding_passes($BINARY_BOARDING_PASSES_REF);
    Readonly my $INDEX_OF_LAST_SEAT => 1023;
    my @seat_occupation_list = [];

    for ( 0 .. $INDEX_OF_LAST_SEAT ) {
        my $seat_id = $_;
        $seat_occupation_list[$seat_id] = 0;
        for my $boarding_pass ( keys %{$BOARDING_PASSES_REF} ) {
            if ( $seat_id
                == $BOARDING_PASSES_REF->{$boarding_pass}->{'seat_id'} )
            {
                $seat_occupation_list[$seat_id] = 1;
            }
            else {
                #
            }
        }
    }

    return \@seat_occupation_list;
}

sub is_occupied {
    Readonly my $SEAT_ID                  => shift;
    Readonly my $SEAT_OCCUPATION_LIST_REF => shift;

    if ( @{$SEAT_OCCUPATION_LIST_REF}[$SEAT_ID] == 1 ) {
        return 1;
    }
    else {
        #
    }

    return 0;
}

sub get_my_seat_id_helper {
    Readonly my $SEAT_OCCUPATION_LIST_REF => shift;
    Readonly my $INDEX_OF_LAST_SEAT       => 1023;

    for ( 0 .. $INDEX_OF_LAST_SEAT ) {
        my $seat_id = $_;
        Readonly my $SEAT_IS_OCCUPIED =>
            is_occupied( $seat_id, $SEAT_OCCUPATION_LIST_REF );
        if ( !$SEAT_IS_OCCUPIED ) {
            Readonly my $PREVIOUS_SEAT_OCCUPIED =>
                is_occupied( $seat_id - 1, $SEAT_OCCUPATION_LIST_REF );
            Readonly my $NEXT_SEAT_OCCUPIED =>
                is_occupied( $seat_id + 1, $SEAT_OCCUPATION_LIST_REF );
            if ( $PREVIOUS_SEAT_OCCUPIED && $NEXT_SEAT_OCCUPIED ) {
                return $seat_id;
            }
            else {
                #
            }
        }
        else {
            #
        }
    }

    return;
}

sub get_my_seat_id {
    Readonly my $BINARY_BOARDING_PASSES_REF => shift;
    Readonly my $SEAT_OCCUPATION_LIST_REF   =>
        get_seat_occupation_list($BINARY_BOARDING_PASSES_REF);

    return get_my_seat_id_helper($SEAT_OCCUPATION_LIST_REF);
}

1;
