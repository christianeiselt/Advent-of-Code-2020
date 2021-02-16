#!/usr/bin/perl

package AOC2020::Day03;

use warnings;
use strict;
use version; our $VERSION = qv('1.0.4');
use lib '../../lib/';
use AOC2020::Common;

sub get_tree_count_for_slope {
  my ( $self, $map, $slope, $startPos ) = @_;
  my $fullMap   = get_full_map( $map, $slope );
  my $treeCount = count_trees_on_slope( $fullMap, $slope, $startPos );

  return $treeCount;
}

sub get_product_of_tree_counts {
  my ( $self, $map, $slopes, $startPos ) = @_;
  my $treeCountProduct = 1;

  foreach my $slope ( keys %{$slopes} ) {
    $treeCountProduct
        *= AOC2020::Day03->get_tree_count_for_slope( $map, $slopes->{$slope},
      $startPos );
  }

  return $treeCountProduct;
}

sub get_length_of_first_line {
  my $map     = shift;
  my @content = @{$map};
  my $length  = length( $content[0] );

  return $length;
}

sub get_number_of_columns_needed {
  my ( $rows, $slope ) = @_;
  my $columnsNeeded = $rows * $slope->{'right'} / $slope->{'down'};

  return $columnsNeeded;
}

sub calculate_multiplier {
  my ( $neededColumns, $lineLength ) = @_;

  my $multiplier = int( $neededColumns / $lineLength + 1 );

  return $multiplier;
}

sub get_number_of_rows {
  my $map          = shift;
  my $numberOfRows = AOC2020::Common->get_number_of_elements($map);

  return $numberOfRows;
}

sub get_multiplier {
  my ( $map, $slope ) = @_;
  my $lineLength            = get_length_of_first_line($map);
  my $rows                  = get_number_of_rows($map);
  my $numberOfColumnsNeeded = get_number_of_columns_needed( $rows, $slope );

  my $multiplier = calculate_multiplier( $numberOfColumnsNeeded, $lineLength );

  return $multiplier;
}

sub get_expanded_line {
  my ( $line, $multiplier ) = @_;
  my $expandedLine = '';

  for ( my $i = 0; $i < $multiplier; $i++ ) {
    $expandedLine .= $line;
  }

  return $expandedLine;
}

sub expand_map {
  my ( $map, $multiplier ) = @_;
  my @fullMap;

  foreach my $line ( @{$map} ) {
    my $newLine = get_expanded_line( $line, $multiplier );
    push( @fullMap, $newLine );
  }

  return \@fullMap;
}

sub get_full_map {
  my ( $map, $slope ) = @_;
  my $multiplier  = get_multiplier( $map, $slope );
  my @expandedMap = @{ expand_map( $map, $multiplier ) };
  my @fullMap;

  foreach ( my $line = 0; $line < scalar(@expandedMap); $line++ ) {
    my @lineChars = @{ AOC2020::Common->get_chars( $expandedMap[$line] ) };

    foreach ( my $char = 0; $char < scalar(@lineChars); $char++ ) {
      $fullMap[$line][$char] = $lineChars[$char];
    }
  }

  return \@fullMap;
}

sub is_tree {
  my ( $fullMap, $position ) = @_;
  my $charOnPos =
      AOC2020::Common->get_character_on_position( $fullMap, $position );
  my $isTree = 0;

  if ( $charOnPos eq '#' ) {
    $isTree = 1;
  }
  else {
    #
  }

  return $isTree;
}

sub increment_if_tree {
  my ( $treeCount, $isTree ) = @_;

  if ($isTree) {
    $treeCount++;
  }
  else {
    #
  }

  return $treeCount;
}

sub get_next_x_position {
  my ( $position, $slope ) = @_;
  my $nextX = $position->{'x'} + $slope->{'right'};

  return $nextX;
}

sub get_next_y_position {
  my ( $position, $slope ) = @_;
  my $nextY = $position->{'y'} + $slope->{'down'};

  return $nextY;
}

sub get_next_position {
  my ( $position, $slope ) = @_;
  my $newX = get_next_x_position( $position, $slope );
  my $newY = get_next_y_position( $position, $slope );

  return ( { 'x' => $newX, 'y' => $newY } );
}

sub count_trees_on_slope {
  my ( $map, $slope, $startPos ) = @_;
  my $position  = { 'x' => $startPos->{'x'}, 'y' => $startPos->{'y'} };
  my $rows      = scalar( @{$map} );
  my $treeCount = 0;

  while ( $position->{'y'} < $rows ) {
    my $isTree = is_tree( $map, $position );
    $treeCount = increment_if_tree( $treeCount, $isTree );
    $position  = get_next_position( $position, $slope );
  }

  return $treeCount;
}

1;
