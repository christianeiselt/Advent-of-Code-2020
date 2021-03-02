#!/usr/bin/perl

package AOC2020::Day08;

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.0');

sub get_instruction_action {
    Readonly my $INSTRUCTION => shift;
    Readonly my $SPACE       => q{\s};
    Readonly my $ACTION      => ( split /$SPACE/xms, $INSTRUCTION )[0];

    return $ACTION;
}

sub get_instruction_value {
    Readonly my $INSTRUCTION => shift;
    Readonly my $SPACE       => q{\s};
    Readonly my $VALUE       => ( split /$SPACE/xms, $INSTRUCTION )[1];

    return $VALUE;
}

sub get_acc_value_after_first_run {
    Readonly my $INSTRUCTIONS_REF => shift;
    Readonly my @INSTRUCTIONS     => @{$INSTRUCTIONS_REF};
    Readonly my $DEFAULT_VALUE    => 0;
    my @instruction_list = ($DEFAULT_VALUE) x scalar @INSTRUCTIONS;
    my $acc_value        = $DEFAULT_VALUE;
    my $i                = $DEFAULT_VALUE;

    while ( $instruction_list[$i] == $DEFAULT_VALUE ) {
        $instruction_list[$i] = 1;

        Readonly my $INSTRUCTION => $INSTRUCTIONS[$i];
        Readonly my $ACTION      => get_instruction_action($INSTRUCTION);
        Readonly my $VALUE       => get_instruction_value($INSTRUCTION);

        Readonly my $ACCUMULATOR => 'acc';
        Readonly my $JUMP        => 'jmp';

        if ( $ACTION eq $JUMP ) {
            $i += $VALUE;
        }
        elsif ( $ACTION eq $ACCUMULATOR ) {
            $acc_value += $VALUE;
            $i++;
        }
        else {
            $i++;
        }
    }

    return $acc_value;
}

sub get_value {
    Readonly my $SELF             => shift;
    Readonly my $INSTRUCTIONS_REF => shift;
    Readonly my $VALUE => get_acc_value_after_first_run($INSTRUCTIONS_REF);

    return $VALUE;
}

1;
