#!/usr/bin/perl

package AOC2020::Day03;

use warnings;
use strict;
use lib '../../lib/';
use AOC2020::Common;

sub GetTreeCountForSlope
{
  my ($self, $map, $slope, $startPos) = @_;
  my $fullMap = getFullMap($map, $slope);
  my $treeCount = countTreesOnSlope($fullMap, $slope, $startPos);

  return $treeCount;
}

sub GetProductOfTreeCounts
{
  my ($self, $map, $slopes, $startPos) = @_;
  my $treeCountProduct = 1;

  foreach my $slope (keys %{$slopes})
  {
    $treeCountProduct *= AOC2020::Day03->GetTreeCountForSlope($map, $slopes->{$slope}, $startPos);
  }

  return $treeCountProduct;
}

sub getLengthOfFirstLine
{
  my $map = shift;
  my @content = @{$map};
  my $length = length($content[0]);

  return $length;
}

sub getNumberOfColumnsNeeded
{
  my ($rows, $slope) = @_;
  my $columnsNeeded = $rows * $slope->{'right'} / $slope->{'down'};

  return $columnsNeeded;
}

sub calculateMultiplier
{
  my ($neededColumns, $lineLength) = @_;

  my $multiplier = int($neededColumns / $lineLength + 1);

  return $multiplier;
}

sub getNumberOfRows
{
  my $map = shift;
  my $numberOfRows = AOC2020::Common->getNumberOfElements($map);

  return $numberOfRows;
}

sub getMultiplier
{
  my ($map, $slope) = @_;
  my $lineLength = getLengthOfFirstLine($map);
  my $rows = getNumberOfRows($map);
  my $numberOfColumnsNeeded = getNumberOfColumnsNeeded($rows, $slope);

  my $multiplier = calculateMultiplier($numberOfColumnsNeeded, $lineLength);

  return $multiplier;
}

sub getExpandedLine
{
  my ($line, $multiplier) = @_;
  my $expandedLine = '';

  for (my $i = 0; $i < $multiplier; $i++)
  {
    $expandedLine .= $line;
  }

  return $expandedLine;
}

sub expandMap
{
  my ($map, $multiplier) = @_;
  my @fullMap;

  foreach my $line (@{$map})
  {
    my $newLine = getExpandedLine($line, $multiplier);
    push(@fullMap, $newLine);
  }

  return \@fullMap;
}

sub getFullMap
{
  my ($map, $slope) = @_;
  my $multiplier = getMultiplier($map, $slope);
  my @expandedMap = @{expandMap($map, $multiplier)};
  my @fullMap;

  foreach (my $line = 0; $line < scalar(@expandedMap); $line++)
  {
    my @lineChars = @{AOC2020::Common->getChars($expandedMap[$line])};

    foreach (my $char = 0; $char < scalar(@lineChars); $char++)
    {
      $fullMap[$line][$char] = $lineChars[$char];
    }
  }

  return \@fullMap;
}

sub isTree
{
  my ($fullMap, $position) = @_;
  my $charOnPos = AOC2020::Common->getCharacterOnPosition($fullMap, $position);
  my $isTree = 0;

  if ($charOnPos eq '#')
  {
    $isTree = 1;
  }
  else
  {
    #
  }

  return $isTree;
}

sub incrementIfTree
{
  my ($treeCount, $isTree) = @_;

  if ($isTree)
  {
    $treeCount++;
  }
  else
  {
    #
  }

  return $treeCount;
}

sub getNextXPosition
{
  my ($position, $slope) = @_;
  my $nextX = $position->{'x'} + $slope->{'right'};

  return $nextX;
}

sub getNextYPosition
{
  my ($position, $slope) = @_;
  my $nextY = $position->{'y'} + $slope->{'down'};

  return $nextY;
}

sub getNextPosition
{
  my ($position, $slope) = @_;
  my $newX = getNextXPosition($position, $slope);
  my $newY = getNextYPosition($position, $slope);

  return ({'x' => $newX, 'y' => $newY});
}

sub countTreesOnSlope
{
  my ($map, $slope, $startPos) = @_;
  my $position = {'x' => $startPos->{'x'}, 'y' => $startPos->{'y'}};
  my $rows = scalar(@{$map});
  my $treeCount = 0;

  while ($position->{'y'} < $rows)
  {
    my $isTree = isTree($map, $position);
    $treeCount = incrementIfTree($treeCount, $isTree);
    $position = getNextPosition($position, $slope);
  }

  return $treeCount;  
}

1;
