#!/usr/bin/perl

package AOC2020::Day07;

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.0');

sub split_into_name_and_rule {
    Readonly my $BAG_RULE => shift;

    return split /\sbags\scontain\s/xms, $BAG_RULE;
}

sub get_bag_name {
    Readonly my $RULE => shift;

    return ( split_into_name_and_rule($RULE) )[0];
}

sub get_bag_rule {
    Readonly my $RULE => shift;

    return ( split_into_name_and_rule($RULE) )[1];
}

sub split_rules_for_bag {
    Readonly my $BAG_RULES => shift;

    return split /,\s/xms, $BAG_RULES;
}

sub get_cleaned_rule {
    Readonly my $INPUT_BAG_RULE => shift;
    my $cleaned_bag_rule = $INPUT_BAG_RULE;

    $cleaned_bag_rule =~ s/\sbags.*//xms;
    $cleaned_bag_rule =~ s/\sbag.*//xms;

    return $cleaned_bag_rule;
}

sub get_bag_count_for_rule {
    Readonly my $INPUT_BAG_RULE => shift;
    my $count = get_cleaned_rule($INPUT_BAG_RULE);
    $count = ( split /\s/xms, $count )[0];

    return $count;
}

sub get_bag_type_for_rule {
    Readonly my $INPUT_BAG_RULE => shift;
    my $bag_type = get_cleaned_rule($INPUT_BAG_RULE);
    $bag_type = ( split /\d\s/xms, $bag_type )[1];

    return $bag_type;
}

sub add_bag_rule {
    Readonly my $INPUT_BAG_RULES_REF => shift;
    Readonly my $BAG_RULE            => shift;
    Readonly my $BAG_NAME            => shift;
    Readonly my $NO_OTHER_BAGS       => 'no other bags.';
    my $bag_rules_ref = $INPUT_BAG_RULES_REF;

    if ( $BAG_RULE eq $NO_OTHER_BAGS ) {
        $bag_rules_ref->{$BAG_NAME} = 'none';
    }
    else {
        Readonly my $BAG_TYPE => get_bag_type_for_rule($BAG_RULE);
        Readonly my $COUNT    => get_bag_count_for_rule($BAG_RULE);
        $bag_rules_ref->{$BAG_NAME}->{$BAG_TYPE} = $COUNT;
    }

    return $bag_rules_ref;
}

sub add_bag_rules {
    Readonly my $BAG_RULES_REF      => shift;
    Readonly my $BAG_RULES_LIST_REF => shift;
    Readonly my $BAG_NAME           => shift;
    my $bag_rules = $BAG_RULES_REF;

    foreach my $br ( @{$BAG_RULES_LIST_REF} ) {
        $bag_rules = add_bag_rule( $bag_rules, $br, $BAG_NAME );
    }

    return $bag_rules;
}

sub get_bag_rules {
    Readonly my $RULES_TEXT_REF => shift;
    Readonly my @RULES          => @{$RULES_TEXT_REF};
    my $bag_rules_ref = {};

    foreach my $rule (@RULES) {
        Readonly my $BAG_NAME       => get_bag_name($rule);
        Readonly my $BAG_RULE       => get_bag_rule($rule);
        Readonly my @BAG_RULES_LIST => split_rules_for_bag($BAG_RULE);
        $bag_rules_ref =
            add_bag_rules( $bag_rules_ref, \@BAG_RULES_LIST, $BAG_NAME );
    }

    return $bag_rules_ref;
}

sub solve_part_1 {
    Readonly my $SELF           => shift;
    Readonly my $RULES_TEXT_REF => shift;
    Readonly my $BAG_RULES_REF  => get_bag_rules($RULES_TEXT_REF);

    return $BAG_RULES_REF->{'light red'}->{'muted yellow'};
}

1;
