#!/usr/bin/perl

package AdventOfCode::Day08;

use warnings;
use strict;
use Readonly;
use version; our $VERSION = qv('1.0.3');

sub solve_part_1 {
    Readonly my $SELF                 => shift;
    Readonly my $INSTRUCTIONS_REF     => shift;
    Readonly my $FIRST_RUN_RESULT_REF => get_run_result($INSTRUCTIONS_REF);

    return $FIRST_RUN_RESULT_REF->{'acc_value'};
}

sub solve_part_2 {
    Readonly my $SELF                   => shift;
    Readonly my $INSTRUCTIONS_REF       => shift;
    Readonly my $TERMINATING_RUN_RESULT =>
        get_terminating_run_result($INSTRUCTIONS_REF);

    return $TERMINATING_RUN_RESULT;
}

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

sub increment_by_value {
    Readonly my $INPUT_VALUE => shift;
    Readonly my $INCREMENT   => shift;
    Readonly my $NEW_VALUE   => $INPUT_VALUE + $INCREMENT;

    return $NEW_VALUE;
}

sub get_acc_action {
    Readonly my $ACCUMULATOR => 'acc';

    return $ACCUMULATOR;
}

sub get_jmp_action {
    Readonly my $JUMP => 'jmp';

    return $JUMP;
}

sub get_nop_action {
    Readonly my $NO_OPERATION => 'nop';

    return $NO_OPERATION;
}

sub increment {
    Readonly my $INPUT => shift;
    my $output = $INPUT + 1;

    return $output;
}

sub get_i_acc_value {
    Readonly my $INSTRUCTION     => shift;
    Readonly my $INPUT_ACC_VALUE => shift;
    Readonly my $ITERATOR        => shift;
    Readonly my $ACTION          => get_instruction_action($INSTRUCTION);
    Readonly my $VALUE           => get_instruction_value($INSTRUCTION);
    my $i         = $ITERATOR;
    my $acc_value = $INPUT_ACC_VALUE;

    if ( $ACTION eq get_jmp_action() ) {
        $i = increment_by_value( $i, $VALUE );
    }
    elsif ( $ACTION eq get_acc_action() ) {
        $acc_value = increment_by_value( $acc_value, $VALUE );
        $i         = increment($i);
    }
    else {
        $i = increment($i);
    }

    return ( { 'iterator' => $i, 'acc_value' => $acc_value } );
}

sub set_executed {
    Readonly my $EXECUTED => 1;

    return $EXECUTED;
}

sub set_terminated {
    Readonly my $TERMINATED => 1;

    return $TERMINATED;
}

sub get_list_count {
    Readonly my $LIST_REF   => shift;
    Readonly my $LIST_COUNT => scalar @{$LIST_REF};

    return $LIST_COUNT;
}

sub get_filled_fixed_list {
    Readonly my $FILL   => shift;
    Readonly my $LENGTH => shift;
    Readonly my @LIST   => ($FILL) x $LENGTH;

    return \@LIST;
}

sub get_iterator {
    Readonly my $EXECUTION_RESULT => shift;
    Readonly my $ITERATOR         => $EXECUTION_RESULT->{'iterator'};

    return $ITERATOR;
}

sub get_acc_value {
    Readonly my $EXECUTION_RESULT => shift;
    Readonly my $ACC_VALUE        => $EXECUTION_RESULT->{'acc_value'};

    return $ACC_VALUE;
}

sub get_run_result {
    Readonly my $INSTRUCTIONS_REF  => shift;
    Readonly my @INSTRUCTIONS      => @{$INSTRUCTIONS_REF};
    Readonly my $INSTRUCTION_COUNT => get_list_count( \@INSTRUCTIONS );
    Readonly my $ZERO              => 0;
    Readonly my $FIXED_LIST_REF    =>
        get_filled_fixed_list( $ZERO, $INSTRUCTION_COUNT );
    Readonly my $FIXED_LIST_COUNT => get_list_count($FIXED_LIST_REF);
    my @execution_list = @{$FIXED_LIST_REF};
    my $acc_value      = $ZERO;
    my $i              = $ZERO;
    my $is_terminated  = $ZERO;

    while ($execution_list[$i] == $ZERO
        && $i < $FIXED_LIST_COUNT )
    {
        Readonly my $INSTRUCTION          => $INSTRUCTIONS[$i];
        Readonly my $EXECUTION_RESULT_REF =>
            get_i_acc_value( $INSTRUCTION, $acc_value, $i );
        $execution_list[$i] = set_executed();
        $i                  = get_iterator($EXECUTION_RESULT_REF);
        $acc_value          = get_acc_value($EXECUTION_RESULT_REF);
    }

    if ( $i == $INSTRUCTION_COUNT ) {
        $is_terminated = set_terminated();
    }
    else {
        #
    }

    return { 'acc_value' => $acc_value, 'is_terminating' => $is_terminated };
}

sub get_jmp_nop {
    Readonly my $INSTRUCTIONS_REF    => shift;
    Readonly my $ACTION_JUMP         => get_jmp_action();
    Readonly my $ACTION_NO_OPERATION => get_nop_action();
    Readonly my $LOOP_END            => get_list_count($INSTRUCTIONS_REF) - 1;
    Readonly my @INSTRUCTIONS        => @{$INSTRUCTIONS_REF};
    my $jmp_nop_ref = {};

    for my $i ( 0 .. $LOOP_END ) {
        Readonly my $ACTION => get_instruction_action( $INSTRUCTIONS[$i] );
        if ( $ACTION eq $ACTION_JUMP ) {
            $jmp_nop_ref->{$i} = $ACTION_NO_OPERATION;
        }
        elsif ( $ACTION eq $ACTION_NO_OPERATION ) {
            $jmp_nop_ref->{$i} = $ACTION_JUMP;
        }
        else {
            #
        }
    }
    return $jmp_nop_ref;
}

sub replace_action_with {
    Readonly my $INPUT_INSTRUCTION => shift;
    Readonly my $REPLACING_ACTION  => shift;
    Readonly my $ACTION => get_instruction_action($INPUT_INSTRUCTION);
    my $replaced_instruction = $INPUT_INSTRUCTION;
    $replaced_instruction =~ s/$ACTION/$REPLACING_ACTION/xms;

    return $replaced_instruction;
}

sub switch_action {
    Readonly my $INPUT_INSTRUCTION   => shift;
    Readonly my $ACTION_JUMP         => get_jmp_action();
    Readonly my $ACTION_NO_OPERATION => get_nop_action();
    Readonly my $ACTION => get_instruction_action($INPUT_INSTRUCTION);
    my $instruction = $INPUT_INSTRUCTION;

    if ( $ACTION eq $ACTION_JUMP ) {
        $instruction =
            replace_action_with( $instruction, $ACTION_NO_OPERATION );
    }
    elsif ( $ACTION eq $ACTION_NO_OPERATION ) {
        $instruction = replace_action_with( $instruction, $ACTION_JUMP );
    }
    else {
        #
    }

    return $instruction;
}

sub get_replaced_instructions {
    Readonly my $INPUT_REF        => shift;
    Readonly my $INSTRUCTIONS_REF => $INPUT_REF->{'instructions'};
    Readonly my $POSITION         => $INPUT_REF->{'position'};
    Readonly my $ACTION           => $INPUT_REF->{'new_action'};
    Readonly my @INSTRUCTIONS     => @{$INSTRUCTIONS_REF};
    my @instructions = @INSTRUCTIONS;
    $instructions[$POSITION] =
        replace_action_with( $INSTRUCTIONS[$POSITION], $ACTION );

    return \@instructions;
}

sub get_terminating_run_result {
    Readonly my $INSTRUCTIONS_REF      => shift;
    Readonly my $JMP_NOP_REF           => get_jmp_nop($INSTRUCTIONS_REF);
    Readonly my $CHANGE_COUNT          => scalar keys %{$JMP_NOP_REF};
    Readonly my $BEGINNING_LINE_NUMBER => -1;
    my $acc_value      = 0;
    my $is_terminating = 0;

    for my $i ( sort keys %{$JMP_NOP_REF} ) {
        my $instruction_list_ref = get_replaced_instructions(
            {   'instructions' => $INSTRUCTIONS_REF,
                'position'     => $i,
                'new_action'   => $JMP_NOP_REF->{$i},
            }
        );
        my $RUN_RESULT_REF = get_run_result($instruction_list_ref);

        if ( $RUN_RESULT_REF->{'is_terminating'} == 1 ) {
            return $RUN_RESULT_REF->{'acc_value'};
        }
        else {
            #
        }
    }

    return $acc_value;
}

1;
