#!/usr/bin/perl

package AOC2020::Day06;

use warnings;
use strict;
use Readonly;
use List::MoreUtils qw(any);
use version; our $VERSION = qv('1.0.0');

sub get_answer_characters {
    Readonly my $PASSENGER_ANSWER => shift;
    Readonly my @ANSWER => split //msx, $PASSENGER_ANSWER;

    return \@ANSWER;
}

sub is_empty_string {
    Readonly my $INPUT_STRING => shift;
    Readonly my $EMPTY        => q{};

    if ( $INPUT_STRING eq $EMPTY ) {
        return 1;
    }
    else {
        return 0;
    }
}

sub set_question_for_group {
    Readonly my $INPUT_GROUP_ANSWERS_REF => shift;
    Readonly my $INDEX                   => shift;
    Readonly my $QUESTION                => shift;
    my $group_answers_ref = $INPUT_GROUP_ANSWERS_REF;
    $group_answers_ref->{$INDEX}->{$QUESTION} = 'yes';

    return $group_answers_ref;
}

sub add_to_group_answers_part_1_helper {
    Readonly my $INPUT_GROUP_ANSWERS_REF => shift;
    Readonly my $PASSENGER_ANSWER        => shift;
    Readonly my $INDEX                   => shift;
    my $group_answers_ref = $INPUT_GROUP_ANSWERS_REF;

    Readonly my @ANSWER => @{ get_answer_characters($PASSENGER_ANSWER) };
    foreach (@ANSWER) {
        Readonly my $QUESTION => $_;
        $group_answers_ref =
            set_question_for_group( $group_answers_ref, $INDEX, $QUESTION );
    }

    return $group_answers_ref;
}

sub add_to_group_answers_part_1 {
    Readonly my $INPUT_GROUP_ANSWERS_REF => shift;
    Readonly my $PASSENGER_ANSWER        => shift;
    Readonly my $INPUT_INDEX             => shift;
    my $group_answers_ref = $INPUT_GROUP_ANSWERS_REF;
    my $index             = $INPUT_INDEX;

    if ( !is_empty_string($PASSENGER_ANSWER) ) {
        $group_answers_ref =
            add_to_group_answers_part_1_helper( $group_answers_ref,
            $PASSENGER_ANSWER, $index );
    }
    else {
        $index++;
    }

    return $group_answers_ref, $index;
}

sub increment_member_count {
    Readonly my $INPUT_GROUP_ANSWERS_REF => shift;
    Readonly my $INDEX                   => shift;
    my $group_answers_ref = $INPUT_GROUP_ANSWERS_REF;
    $group_answers_ref->{$INDEX}->{'member_count'}++;

    return $group_answers_ref;
}

sub increment_question_count {
    Readonly my $INPUT_GROUP_ANSWERS_REF => shift;
    Readonly my $INDEX                   => shift;
    Readonly my $QUESTION                => shift;
    my $group_answers_ref = $INPUT_GROUP_ANSWERS_REF;
    $group_answers_ref->{$INDEX}->{'questions'}->{$QUESTION}++;

    return $group_answers_ref;
}

sub add_to_group_answers_part_2_helper {
    Readonly my $INPUT_GROUP_ANSWERS_REF => shift;
    Readonly my $PASSENGER_ANSWER        => shift;
    Readonly my $INDEX                   => shift;
    my $group_answers_ref = $INPUT_GROUP_ANSWERS_REF;

    Readonly my @ANSWER => @{ get_answer_characters($PASSENGER_ANSWER) };
    $group_answers_ref = increment_member_count( $group_answers_ref, $INDEX );
    foreach (@ANSWER) {
        Readonly my $QUESTION => $_;
        $group_answers_ref =
            increment_question_count( $group_answers_ref, $INDEX, $QUESTION );
    }

    return $group_answers_ref;
}

sub add_to_group_answers_part_2 {
    Readonly my $INPUT_GROUP_ANSWERS_REF => shift;
    Readonly my $PASSENGER_ANSWER        => shift;
    Readonly my $INPUT_INDEX             => shift;
    my $group_answers_ref = $INPUT_GROUP_ANSWERS_REF;
    my $index             = $INPUT_INDEX;

    if ( !is_empty_string($PASSENGER_ANSWER) ) {
        $group_answers_ref =
            add_to_group_answers_part_2_helper( $group_answers_ref,
            $PASSENGER_ANSWER, $index );
    }
    else {
        $index++;
    }

    return $group_answers_ref, $index;
}

sub add_to_group_answers {
    Readonly my $INPUT_GROUP_ANSWERS_REF => shift;
    Readonly my $PASSENGER_ANSWER        => shift;
    Readonly my $INPUT_INDEX             => shift;
    Readonly my $PART                    => shift;
    Readonly my $PART_1                  => 1;
    Readonly my $PART_2                  => 2;
    my $group_answers_ref = $INPUT_GROUP_ANSWERS_REF;
    my $index             = $INPUT_INDEX;

    if ( $PART == $PART_1 ) {
        ( $group_answers_ref, $index ) =
            add_to_group_answers_part_1( $group_answers_ref,
            $PASSENGER_ANSWER, $index );
    }
    elsif ( $PART == $PART_2 ) {
        ( $group_answers_ref, $index ) =
            add_to_group_answers_part_2( $group_answers_ref,
            $PASSENGER_ANSWER, $index );
    }
    else {
        return;
    }

    return $group_answers_ref, $index;
}

sub get_group_answers_part_1 {
    Readonly my $GROUP_ANSWERS_LIST_REF => shift;
    Readonly my $PART                   => shift;
    Readonly my @GROUP_ANSWERS_LIST     => @{$GROUP_ANSWERS_LIST_REF};
    Readonly my $START_INDEX            => 0;
    my $index             = $START_INDEX;
    my $group_answers_ref = {};

    foreach (@GROUP_ANSWERS_LIST) {
        Readonly my $PASSENGER_ANSWER => $_;

        ( $group_answers_ref, $index ) =
            add_to_group_answers( $group_answers_ref, $PASSENGER_ANSWER,
            $index, $PART );
    }

    return $group_answers_ref;
}

sub get_group_count_part_1 {
    Readonly my $SELF              => shift;
    Readonly my $ANSWERS_LIST_REF  => shift;
    Readonly my $PART_1            => 1;
    Readonly my $GROUP_ANSWERS_REF =>
        get_group_answers_part_1( $ANSWERS_LIST_REF, $PART_1 );
    Readonly my $GROUP_COUNT => scalar keys %{$GROUP_ANSWERS_REF};
    Readonly my $START_SUM   => 0;
    my $sum = $START_SUM;

    for ( 0 .. $GROUP_COUNT ) {
        $sum += scalar keys %{ $GROUP_ANSWERS_REF->{$_} };
    }

    return $sum;
}

sub get_group_answers_part_2 {
    Readonly my $GROUP_ANSWERS_LIST_REF => shift;
    Readonly my $PART                   => shift;
    Readonly my @GROUP_ANSWERS_LIST     => @{$GROUP_ANSWERS_LIST_REF};
    Readonly my $START_INDEX            => 0;
    my $index             = $START_INDEX;
    my $group_answers_ref = {};

    foreach (@GROUP_ANSWERS_LIST) {
        Readonly my $PASSENGER_ANSWER => $_;

        ( $group_answers_ref, $index ) =
            add_to_group_answers( $group_answers_ref, $PASSENGER_ANSWER,
            $index, $PART );
    }

    return $group_answers_ref;
}

sub get_group_member_count {
    Readonly my $GROUP_ANSWERS_REF => shift;
    Readonly my $GROUP             => shift;

    return $GROUP_ANSWERS_REF->{$GROUP}->{'member_count'};
}

sub get_question_count {
    Readonly my $GROUP_ANSWERS_REF => shift;
    Readonly my $GROUP             => shift;
    Readonly my $QUESTION          => shift;

    return $GROUP_ANSWERS_REF->{$GROUP}->{'questions'}->{$QUESTION};
}

sub get_group_count_part_2_helper {
    Readonly my $GROUP_ANSWERS_REF => shift;
    Readonly my $GROUP             => shift;
    Readonly my $INPUT_SUM         => shift;
    Readonly my $MEMBER_COUNT =>
        get_group_member_count( $GROUP_ANSWERS_REF, $GROUP );
    Readonly my @QUESTIONS =>
        keys %{ $GROUP_ANSWERS_REF->{$GROUP}->{'questions'} };
    my $sum = $INPUT_SUM;

    foreach my $question (@QUESTIONS) {
        Readonly my $QUESTION_COUNT =>
            get_question_count( $GROUP_ANSWERS_REF, $GROUP, $question );

        if ( $QUESTION_COUNT == $MEMBER_COUNT ) {
            $sum++;
        }
        else {
            #
        }
    }

    return $sum;
}

sub get_group_count_part_2 {
    Readonly my $SELF              => shift;
    Readonly my $ANSWERS_LIST_REF  => shift;
    Readonly my $PART_2            => 2;
    Readonly my $GROUP_ANSWERS_REF =>
        get_group_answers_part_2( $ANSWERS_LIST_REF, $PART_2 );
    Readonly my $GROUP_COUNT => scalar keys %{$GROUP_ANSWERS_REF};
    Readonly my $START_INDEX => 0;
    Readonly my $START_SUM   => 0;
    my $sum = $START_SUM;

    for ( $START_INDEX .. $GROUP_COUNT ) {
        Readonly my $GROUP => $_;
        $sum =
            get_group_count_part_2_helper( $GROUP_ANSWERS_REF, $GROUP, $sum );
    }

    return $sum;
}

1;
