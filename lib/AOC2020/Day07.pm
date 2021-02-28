#!/usr/bin/perl

package AOC2020::Day07;

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.0');
use Data::Dumper;

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

sub get_bag_name_for_rule {
    Readonly my $INPUT_BAG_RULE => shift;
    my $bag_name = get_cleaned_rule($INPUT_BAG_RULE);
    $bag_name = ( split /\d\s/xms, $bag_name )[1];

    return $bag_name;
}

sub add_bag_rule {
    Readonly my $INPUT_BAG_RULES_REF => shift;
    Readonly my $BAG_RULE            => shift;
    Readonly my $BAG_NAME            => shift;
    Readonly my $NO_OTHER_BAGS       => 'no other bags.';
    my $bag_rules_ref = $INPUT_BAG_RULES_REF;

    if ( $BAG_RULE eq $NO_OTHER_BAGS ) {
        $bag_rules_ref->{$BAG_NAME} = undef;
    }
    else {
        Readonly my $CONTAIN_BAG_NAME => get_bag_name_for_rule($BAG_RULE);
        Readonly my $COUNT    => get_bag_count_for_rule($BAG_RULE);
        $bag_rules_ref->{$BAG_NAME}->{$CONTAIN_BAG_NAME} = $COUNT;
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

sub can_contain_bag {
    Readonly my $BAG           => shift;
    Readonly my $BAG_NAME      => shift;
    Readonly my $BAG_RULES_REF => shift;

    if ( defined $BAG_RULES_REF->{$BAG}->{$BAG_NAME} ) {
        return 1;
    }
    else {
        #
    }

    foreach my $bag_rule ( keys %{ $BAG_RULES_REF->{$BAG} } ) {
        if ( can_contain_bag( $bag_rule, $BAG_NAME, $BAG_RULES_REF ) ) {
            return 1;
        }
        else {
            #
        }
    }

    return 0;
}

sub get_bags_that_can_contain {
    Readonly my $BAG_NAME      => shift;
    Readonly my $BAG_RULES_REF => shift;
    Readonly my @BAGS          => keys %{$BAG_RULES_REF};
    my $bag_count = 0;

    foreach my $bag (@BAGS) {
        if ( can_contain_bag( $bag, $BAG_NAME, $BAG_RULES_REF ) ) {
            $bag_count++;
        }
        else {
            #
        }
    }

    return $bag_count;
}

sub get_bag_color_count {
    Readonly my $SELF           => shift;
    Readonly my $RULES_TEXT_REF => shift;
    Readonly my $BAG_NAME       => shift;
    Readonly my $BAG_RULES_REF  => get_bag_rules($RULES_TEXT_REF);
    Readonly my $BAG_COUNT      =>
        get_bags_that_can_contain( $BAG_NAME, $BAG_RULES_REF );

    return $BAG_COUNT;
}

sub get_inside_bags_count_helper {
    Readonly my $BAG_NAME      => shift;
    Readonly my $BAG_RULES_REF => shift;
    my $count = 1;

    foreach my $bag ( keys %{ $BAG_RULES_REF->{$BAG_NAME} } ) {
        $count += $BAG_RULES_REF->{$BAG_NAME}->{$bag}
            * get_inside_bags_count_helper( $bag, $BAG_RULES_REF );
    }

    return $count;
}

sub get_inside_bags_count {
    Readonly my $SELF              => shift;
    Readonly my $RULES_TEXT_REF    => shift;
    Readonly my $BAG_NAME          => shift;
    Readonly my $BAG_RULES_REF     => get_bag_rules($RULES_TEXT_REF);
    Readonly my $BAG_COUNT_ITSELF  => 1;
    Readonly my $INSIDE_BAGS_COUNT =>
        get_inside_bags_count_helper( $BAG_NAME, $BAG_RULES_REF )
        - $BAG_COUNT_ITSELF;

    return $INSIDE_BAGS_COUNT;
}

1;
