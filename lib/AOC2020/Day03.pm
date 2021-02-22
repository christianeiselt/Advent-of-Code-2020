#!/usr/bin/perl

package AOC2020::Day03;

use warnings;
use strict;
use Readonly;
use lib '../../lib/';
use AOC2020::Common;
use version; our $VERSION = qv('1.0.7');

sub get_tree_count_for_slope {
    Readonly my $SELF          => shift;
    Readonly my $MAP_REF       => shift;
    Readonly my $SLOPE_REF     => shift;
    Readonly my $START_POS_REF => shift;
    Readonly my $FULL_MAP_REF  => get_full_map( $MAP_REF, $SLOPE_REF );
    Readonly my $TREE_COUNT    =>
        count_trees_on_slope( $FULL_MAP_REF, $SLOPE_REF, $START_POS_REF );

    return $TREE_COUNT;
}

sub get_product_of_tree_counts {
    Readonly my $SELF          => shift;
    Readonly my $MAP_REF       => shift;
    Readonly my $SLOPE_REFS    => shift;
    Readonly my $START_POS_REF => shift;
    my $tree_count_product = 1;

    foreach my $slope ( keys %{$SLOPE_REFS} ) {
        $tree_count_product
            *= AOC2020::Day03->get_tree_count_for_slope( $MAP_REF,
            $SLOPE_REFS->{$slope}, $START_POS_REF );
    }

    return $tree_count_product;
}

sub get_length_of_first_line {
    Readonly my $MAP_REF => shift;
    Readonly my @CONTENT => @{$MAP_REF};
    Readonly my $LENGTH  => length $CONTENT[0];

    return $LENGTH;
}

sub get_number_of_columns_needed {
    Readonly my $ROWS           => shift;
    Readonly my $SLOPE_REF      => shift;
    Readonly my $COLUMNS_NEEDED =>
        $ROWS * $SLOPE_REF->{'right'} / $SLOPE_REF->{'down'};

    return $COLUMNS_NEEDED;
}

sub calculate_multiplier {
    Readonly my $NEEDED_COLUMNS => shift;
    Readonly my $LINE_LENGTH    => shift;
    Readonly my $MULTIPLIER     => int( $NEEDED_COLUMNS / $LINE_LENGTH + 1 );
    return $MULTIPLIER;
}

sub get_number_of_rows {
    Readonly my $MAP_REF        => shift;
    Readonly my $NUMBER_OF_ROWS => scalar @{$MAP_REF};

    return $NUMBER_OF_ROWS;
}

sub get_multiplier {
    Readonly my $MAP_REF     => shift;
    Readonly my $SLOPE_REF   => shift;
    Readonly my $LINE_LENGTH => get_length_of_first_line($MAP_REF);
    Readonly my $ROWS        => get_number_of_rows($MAP_REF);
    Readonly my $NUMBER_OF_COLUMNS_NEEDED =>
        get_number_of_columns_needed( $ROWS, $SLOPE_REF );

    Readonly my $MULTIPLIER =>
        calculate_multiplier( $NUMBER_OF_COLUMNS_NEEDED, $LINE_LENGTH );

    return $MULTIPLIER;
}

sub get_expanded_line {
    Readonly my $LINE       => shift;
    Readonly my $MULTIPLIER => shift;
    Readonly my $EMPTY      => q{};
    my $expanded_line = $EMPTY;

    for ( 0 .. $MULTIPLIER ) {
        $expanded_line .= $LINE;
    }

    return $expanded_line;
}

sub expand_map {
    Readonly my $MAP_REF    => shift;
    Readonly my $MULTIPLIER => shift;
    my @full_map;

    foreach my $line ( @{$MAP_REF} ) {
        my $new_line = get_expanded_line( $line, $MULTIPLIER );
        push @full_map, $new_line;
    }

    return \@full_map;
}

sub get_full_map {
    Readonly my $MAP_REF      => shift;
    Readonly my $SLOPE_REF    => shift;
    Readonly my $MULTIPLIER   => get_multiplier( $MAP_REF, $SLOPE_REF );
    Readonly my @EXPANDED_MAP => @{ expand_map( $MAP_REF, $MULTIPLIER ) };
    my @full_map;

    for ( 0 .. scalar @EXPANDED_MAP ) {
        my $line = $_;
        my @line_chars =
            @{ AOC2020::Common->get_chars( $EXPANDED_MAP[$line] ) };

        foreach ( 0 .. scalar @line_chars ) {
            my $char = $_;
            $full_map[$line][$char] = $line_chars[$char];
        }
    }

    return \@full_map;
}

sub is_tree {
    Readonly my $FULL_MAP_REF => shift;
    Readonly my $POSITION     => shift;
    Readonly my $CHAR_ON_POS  =>
        AOC2020::Common->get_character_on_position( $FULL_MAP_REF,
        $POSITION );
    my $is_tree = 0;

    if ( defined $CHAR_ON_POS && $CHAR_ON_POS eq q{#} ) {
        $is_tree = 1;
    }
    else {
        #
    }

    return $is_tree;
}

sub increment_if_tree {
    my $tree_count = shift;
    Readonly my $IS_TREE => shift;

    if ($IS_TREE) {
        $tree_count++;
    }
    else {
        #
    }

    return $tree_count;
}

sub get_next_x_position {
    Readonly my $POSITION_REF  => shift;
    Readonly my $SLOPE_REF => shift;
    Readonly my $NEXT_X    => $POSITION_REF->{'x'} + $SLOPE_REF->{'right'};

    return $NEXT_X;
}

sub get_next_y_position {
    Readonly my $POSITION_REF  => shift;
    Readonly my $SLOPE_REF => shift;
    Readonly my $NEXT_Y    => $POSITION_REF->{'y'} + $SLOPE_REF->{'down'};

    return $NEXT_Y;
}

sub get_next_position {
    Readonly my $POSITION_REF  => shift;
    Readonly my $SLOPE_REF => shift;
    Readonly my $NEW_X     => get_next_x_position( $POSITION_REF, $SLOPE_REF );
    Readonly my $NEW_Y     => get_next_y_position( $POSITION_REF, $SLOPE_REF );

    return { 'x' => $NEW_X, 'y' => $NEW_Y };
}

sub count_trees_on_slope {
    Readonly my $MAP_REF       => shift;
    Readonly my $SLOPE_REF     => shift;
    Readonly my $START_POS_REF => shift;
    Readonly my $ROWS          => scalar @{$MAP_REF};
    my $position_ref =
        { 'x' => $START_POS_REF->{'x'}, 'y' => $START_POS_REF->{'y'} };
    my $tree_count = 0;

    while ( $position_ref->{'y'} < $ROWS ) {
        Readonly my $IS_TREE => is_tree( $MAP_REF, $position_ref );
        $tree_count = increment_if_tree( $tree_count, $IS_TREE );
        $position_ref   = get_next_position( $position_ref, $SLOPE_REF );
    }

    return $tree_count;
}

1;
