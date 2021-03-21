#!/usr/bin/perl

package AdventOfCode;

use warnings;
use strict;

use Readonly;
use version; our $VERSION = 0.0.3;

use lib '../lib';
use AdventOfCode::Day01;

sub new {
    my $class = shift;
    my $self  = bless {}, $class;
    return $self;
}

sub get_solutions_for_day {
    Readonly my $DAY       => shift;
    Readonly my $SOLUTIONS => AdventOfCode::Day01->solve_part_1();
    return $SOLUTIONS;
}

1;

__END__

=head1 NAME

AdventOfCode - 2020 Advent of Code solutions in Perl

=head1 SYNOPSIS

    use AdventOfCode;
    my $advent_of_code = AdventOfCode->new;
    my $solutions = $advent_of_code->get_solutions_for_day("1"); #1-25
    print $solutions->{'part_one'}.'\n';
    print $solutions->{'part_two'}.'\n';

=head1 DESCRIPTION

=head1 USAGE

=head1 REQUIRED ARGUMENTS

=head1 OPTIONS

=head1 DIAGNOSTICS

=head1 EXIT STATUS

=head1 CONFIGURATION

=head1 DEPENDENCIES

=head1 INCOMPATIBILITIES

=head1 BUGS AND LIMITATIONS

=head1 AUTHOR

=head1 LICENSE AND COPYRIGHT

Copyright 2021 Christian Eiselt L<https://christianeiselt.github.io/>

=cut

# Copyright 2021 Christian Eiselt https://christianeiselt.github.io/
