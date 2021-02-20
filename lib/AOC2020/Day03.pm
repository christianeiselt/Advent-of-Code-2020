#!/usr/bin/perl

package AOC2020::Day03;

use warnings;
use strict;
use lib '../../lib/';
use AOC2020::Common;
use version; our $VERSION = qv('1.0.6');

sub get_tree_count_for_slope {
    my ( $self, $map, $slope, $start_pos ) = @_;
    my $full_map   = get_full_map( $map, $slope );
    my $tree_count = count_trees_on_slope( $full_map, $slope, $start_pos );

    return $tree_count;
}

sub get_product_of_tree_counts {
    my ( $self, $map, $slopes, $start_pos ) = @_;
    my $tree_count_product = 1;

    foreach my $slope ( keys %{$slopes} ) {
        $tree_count_product
            *= AOC2020::Day03->get_tree_count_for_slope( $map,
            $slopes->{$slope}, $start_pos );
    }

    return $tree_count_product;
}

sub get_length_of_first_line {
    my $map     = shift;
    my @content = @{$map};
    my $length  = length $content[0];

    return $length;
}

sub get_number_of_columns_needed {
    my ( $rows, $slope ) = @_;
    my $columns_needed = $rows * $slope->{'right'} / $slope->{'down'};

    return $columns_needed;
}

sub calculate_multiplier {
    my ( $needed_columns, $line_length ) = @_;

    my $multiplier = int( $needed_columns / $line_length + 1 );
    return $multiplier;
}

sub get_number_of_rows {
    my $map            = shift;
    my $number_of_rows = AOC2020::Common->get_number_of_elements($map);

    return $number_of_rows;
}

sub get_multiplier {
    my ( $map, $slope ) = @_;
    my $line_length = get_length_of_first_line($map);
    my $rows        = get_number_of_rows($map);
    my $number_of_columns_needed =
        get_number_of_columns_needed( $rows, $slope );

    my $multiplier =
        calculate_multiplier( $number_of_columns_needed, $line_length );

    return $multiplier;
}

sub get_expanded_line {
    my ( $line, $multiplier ) = @_;
    my $EMPTY         = q{};
    my $expanded_line = $EMPTY;

    for ( 0 .. $multiplier ) {
        $expanded_line .= $line;
    }

    return $expanded_line;
}

sub expand_map {
    my ( $map, $multiplier ) = @_;
    my @full_map;

    foreach my $line ( @{$map} ) {
        my $new_line = get_expanded_line( $line, $multiplier );
        push @full_map, $new_line;
    }

    return \@full_map;
}

sub get_full_map {
    my ( $map, $slope ) = @_;
    my $multiplier   = get_multiplier( $map, $slope );
    my @expanded_map = @{ expand_map( $map, $multiplier ) };
    my @full_map;

    for ( my $line = 0; $line < scalar @expanded_map; $line++ ) {
        my @line_chars =
            @{ AOC2020::Common->get_chars( $expanded_map[$line] ) };

        foreach ( my $char = 0; $char < scalar @line_chars; $char++ ) {
            $full_map[$line][$char] = $line_chars[$char];
        }
    }

    return \@full_map;
}

sub is_tree {
    my ( $full_map, $position ) = @_;
    my $char_on_pos =
        AOC2020::Common->get_character_on_position( $full_map, $position );
    my $is_tree = 0;

    if ( $char_on_pos eq q{#} ) {
        $is_tree = 1;
    }
    else {
        #
    }

    return $is_tree;
}

sub increment_if_tree {
    my ( $tree_count, $is_tree ) = @_;

    if ($is_tree) {
        $tree_count++;
    }
    else {
        #
    }

    return $tree_count;
}

sub get_next_x_position {
    my ( $position, $slope ) = @_;
    my $next_x = $position->{'x'} + $slope->{'right'};

    return $next_x;
}

sub get_next_y_position {
    my ( $position, $slope ) = @_;
    my $next_y = $position->{'y'} + $slope->{'down'};

    return $next_y;
}

sub get_next_position {
    my ( $position, $slope ) = @_;
    my $new_x = get_next_x_position( $position, $slope );
    my $new_y = get_next_y_position( $position, $slope );

    return { 'x' => $new_x, 'y' => $new_y };
}

sub count_trees_on_slope {
    my ( $map, $slope, $start_pos ) = @_;
    my $position   = { 'x' => $start_pos->{'x'}, 'y' => $start_pos->{'y'} };
    my $rows       = scalar @{$map};
    my $tree_count = 0;

    while ( $position->{'y'} < $rows ) {
        my $is_tree = is_tree( $map, $position );
        $tree_count = increment_if_tree( $tree_count, $is_tree );
        $position   = get_next_position( $position, $slope );
    }

    return $tree_count;
}

1;
