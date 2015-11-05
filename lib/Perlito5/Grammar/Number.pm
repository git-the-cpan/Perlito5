# Do not edit this file - Generated by Perlito5 9.008
{
    package main;
    package Perlito5::Grammar::Number;
    use strict;
    {
        {
            package main;
            package Perlito5::Grammar::Precedence;
            {
                {
                    package main;
                    package feature;
                    sub feature::import {}
                    sub feature::unimport {}
                    1
                }
            }
            sub Perlito5::Grammar::Precedence::new {
                my $class = shift;
                bless({@_}, $class)
            }
            my $Operator = {};
            my $Precedence = {};
            my $PrefixPrecedence = {};
            my $Assoc = {};
            sub Perlito5::Grammar::Precedence::is_assoc_type {
                my $assoc_type = shift;
                my $op_name = shift;
                return $Assoc->{$assoc_type}->{$op_name}
            }
            sub Perlito5::Grammar::Precedence::is_fixity_type {
                my $fixity_type = shift;
                my $op_name = shift;
                return $Operator->{$fixity_type}->{$op_name}
            }
            sub Perlito5::Grammar::Precedence::is_term {
                my $token = shift;
                ($token->[0] eq 'term') || ($token->[0] eq 'postfix_or_term') || ($token->[0] eq 'postfix')
            }
            sub Perlito5::Grammar::Precedence::is_num {
                $_[0] ge 0 && $_[0] le 9
            }
            sub Perlito5::Grammar::Precedence::is_ident_middle {
                my $c = shift;
                ($c ge 'a' && $c le 'z') || ($c ge 0 && $c le 9) || ($c eq '_')
            }
            my @Parsed_op_chars = (2, 1);
            my %Parsed_op = ('?' => sub {
                Perlito5::Grammar::Expression::term_ternary($_[0], $_[1])
            }, '(' => sub {
                Perlito5::Grammar::Expression::term_paren($_[0], $_[1])
            }, '[' => sub {
                Perlito5::Grammar::Expression::term_square($_[0], $_[1])
            }, '{' => sub {
                Perlito5::Grammar::Expression::term_curly($_[0], $_[1])
            }, '->' => sub {
                Perlito5::Grammar::Expression::term_arrow($_[0], $_[1])
            });
            my @Term_chars;
            my %Term;
            sub Perlito5::Grammar::Precedence::add_term {
                my $name = shift;
                my $param = shift;
                $Term{$name} = $param;
                unshift(@Term_chars, scalar(@Term_chars) + 1)
                    while @Term_chars < length($name)
            }
            my $End_token;
            my $End_token_chars;
            my %Op;
            my @Op_chars = (3, 2, 1);
            sub Perlito5::Grammar::Precedence::op_parse {
                my $str = shift;
                my $pos = shift;
                my $last_is_term = shift;
                for my $len (@{$End_token_chars}) {
                    my $term = substr($str, $pos, $len);
                    if (exists($End_token->{$term})) {
                        my $c1 = substr($str, $pos + $len - 1, 1);
                        my $c2 = substr($str, $pos + $len, 1);
                        if (!(is_ident_middle($c1) && is_ident_middle($c2)) && !($c1 eq '<' && $c2 eq '<')) {
                            return {'str' => $str, 'from' => $pos, 'to' => $pos, 'capture' => ['end', $term]}
                        }
                    }
                }
                if (!$last_is_term) {
                    for my $len (@Term_chars) {
                        my $term = substr($str, $pos, $len);
                        if (exists($Term{$term})) {
                            my $c1 = substr($str, $pos + $len - 1, 1);
                            my $c2 = substr($str, $pos + $len, 1);
                            if (is_num($c1) || !is_ident_middle($c1) || !is_ident_middle($c2)) {
                                my $m = $Term{$term}->($str, $pos);
                                $m && return $m
                            }
                        }
                    }
                }
                for my $len (@Parsed_op_chars) {
                    my $op = substr($str, $pos, $len);
                    if (exists($Parsed_op{$op})) {
                        my $m = $Parsed_op{$op}->($str, $pos);
                        $m && return $m
                    }
                }
                for my $len (@Op_chars) {
                    my $op = substr($str, $pos, $len);
                    if (exists($Op{$op})) {
                        my $c1 = substr($str, $pos + $len - 1, 1);
                        my $c2 = substr($str, $pos + $len, 1);
                        if ((!(is_ident_middle($c1) && is_ident_middle($c2)) && !($c1 eq '&' && $c2 eq '&')) || ($c1 eq 'x' && $c2 ge 0 && $c2 le 9)) {
                            if (exists($Operator->{'infix'}->{$op}) && !exists($Operator->{'prefix'}->{$op}) && !$last_is_term) {}
                            else {
                                return {'str' => $str, 'from' => $pos, 'to' => $pos + $len, 'capture' => ['op', $op]}
                            }
                        }
                    }
                }
                return Perlito5::Grammar::Bareword::term_bareword($str, $pos)
            }
            sub Perlito5::Grammar::Precedence::add_op {
                my($fixity, $names, $precedence, $param) = @_;
                $param //= {};
                my $assoc = $param->{'assoc'} || 'left';
                for my $name (@{$names}) {
                    $Operator->{$fixity}->{$name} = 1;
                    $Precedence->{$name} = $precedence;
                    $fixity eq 'prefix' && ($PrefixPrecedence->{$name} = $precedence);
                    $Assoc->{$assoc}->{$name} = 1;
                    $Op{$name} = 1
                }
            }
            my $prec = 100;
            add_op('postfix', ['.( )', '.[ ]', '.{ }', '( )', '[ ]', 'funcall', 'funcall_no_params', 'methcall', 'methcall_no_params', 'block', 'hash'], $prec);
            $prec = $prec - 1;
            add_op('prefix', ['++', '--'], $prec);
            add_op('postfix', ['++', '--'], $prec);
            $prec = $prec - 1;
            add_op('infix', ['**'], $prec, {'assoc' => 'right'});
            $prec = $prec - 1;
            add_op('prefix', [chr(92), '+', '-', '~', '!'], $prec);
            $prec = $prec - 1;
            add_op('infix', ['=~', '!~'], $prec);
            $prec = $prec - 1;
            add_op('infix', ['*', '/', '%', 'x'], $prec);
            $prec = $prec - 1;
            add_op('infix', ['+', '-'], $prec);
            add_op('infix', ['.'], $prec, {'assoc' => 'list'});
            $prec = $prec - 1;
            add_op('infix', ['<<', '>>'], $prec);
            $prec = $prec - 1;
            add_op('prefix', ['-r', '-w', '-x', '-o', '-R', '-W', '-X', '-O', '-e', '-z', '-s', '-f', '-d', '-l', '-p', '-S', '-b', '-c', '-t', '-u', '-g', '-k', '-T', '-B', '-M', '-A', '-C'], $prec);
            $prec = $prec - 1;
            add_op('infix', ['lt', 'le', 'gt', 'ge', '<=', '>=', '<', '>'], $prec, {'assoc' => 'chain'});
            $prec = $prec - 1;
            add_op('infix', ['<=>', 'cmp', '==', '!=', 'ne', 'eq'], $prec, {'assoc' => 'chain'});
            $prec = $prec - 1;
            add_op('infix', ['&'], $prec);
            $prec = $prec - 1;
            add_op('infix', ['|', '^'], $prec);
            $prec = $prec - 1;
            add_op('infix', ['..', '...'], $prec);
            add_op('infix', ['~~'], $prec, {'assoc' => 'chain'});
            $prec = $prec - 1;
            add_op('infix', ['&&'], $prec, {'assoc' => 'right'});
            $prec = $prec - 1;
            add_op('infix', ['||'], $prec, {'assoc' => 'right'});
            add_op('infix', ['//'], $prec);
            $prec = $prec - 1;
            add_op('ternary', ['? :'], $prec, {'assoc' => 'right'});
            $prec = $prec - 1;
            add_op('infix', ['=', '**=', '+=', '-=', '*=', '/=', 'x=', '|=', '&=', '.=', '<<=', '>>=', '%=', '||=', '&&=', '^=', '//='], $prec, {'assoc' => 'right'});
            $prec = $prec - 1;
            add_op('infix', ['=>'], $prec);
            $prec = $prec - 1;
            add_op('list', [','], $prec, {'assoc' => 'list'});
            $prec = $prec - 1;
            add_op('prefix', ['not'], $prec);
            $prec = $prec - 1;
            add_op('infix', ['and'], $prec);
            $prec = $prec - 1;
            add_op('infix', ['or', 'xor'], $prec);
            $prec = $prec - 1;
            add_op('infix', ['*start*'], $prec);
            sub Perlito5::Grammar::Precedence::get_token_precedence {
                my $token = $_[0];
                if ($token->[0] eq 'prefix') {
                    return $PrefixPrecedence->{$token->[1]}
                }
                return $Precedence->{$token->[1]}
            }
            sub Perlito5::Grammar::Precedence::precedence_parse {
                my $self = shift;
                my $get_token = $self->{'get_token'};
                my $reduce = $self->{'reduce'};
                my $last_end_token = $End_token;
                my $last_end_token_chars = $End_token_chars;
                $End_token = $self->{'end_token'};
                $End_token_chars = $self->{'end_token_chars'};
                my $op_stack = [];
                my $num_stack = [];
                my $last = ['op', '*start*'];
                my $last_is_term = 0;
                my $token = $get_token->($last_is_term);
                if ($token->[0] eq 'space') {
                    $token = $get_token->($last_is_term)
                }
                while ((defined($token)) && ($token->[0] ne 'end')) {
                    my $token_is_term = is_term($token);
                    if (($token->[1] eq ',') && (($last->[1] eq '*start*') || ($last->[1] eq ','))) {
                        push(@{$num_stack}, ['term', undef])
                    }
                    if ($Operator->{'prefix'}->{$token->[1]} && (($last->[1] eq '*start*') || !$last_is_term)) {
                        $token->[0] = 'prefix';
                        unshift(@{$op_stack}, $token)
                    }
                    elsif ($Operator->{'postfix'}->{$token->[1]} && $last_is_term) {
                        my $pr = $Precedence->{$token->[1]};
                        while (scalar(@{$op_stack}) && ($pr <= get_token_precedence($op_stack->[0]))) {
                            $reduce->($op_stack, $num_stack)
                        }
                        if ($token->[0] ne 'postfix_or_term') {
                            $token->[0] = 'postfix'
                        }
                        unshift(@{$op_stack}, $token);
                        $token_is_term = 1
                    }
                    elsif ($token_is_term) {
                        if ($last_is_term) {
                            print('#      last:  ', Data::Dumper::Dumper($last));
                            print('#      token: ', Data::Dumper::Dumper($token));
                            die('Value tokens must be separated by an operator')
                        }
                        $token->[0] = 'term';
                        push(@{$num_stack}, $token)
                    }
                    elsif ($Precedence->{$token->[1]}) {
                        my $pr = $Precedence->{$token->[1]};
                        if ($Assoc->{'right'}->{$token->[1]}) {
                            while (scalar(@{$op_stack}) && ($pr < get_token_precedence($op_stack->[0]))) {
                                $reduce->($op_stack, $num_stack)
                            }
                        }
                        else {
                            while (scalar(@{$op_stack}) && ($pr <= get_token_precedence($op_stack->[0]))) {
                                $reduce->($op_stack, $num_stack)
                            }
                        }
                        if ($Operator->{'ternary'}->{$token->[1]}) {
                            $token->[0] = 'ternary'
                        }
                        else {
                            $token->[0] = 'infix'
                        }
                        unshift(@{$op_stack}, $token)
                    }
                    else {
                        die('Unknown token: ' . chr(39), $token->[1], chr(39))
                    }
                    $last = $token;
                    $last_is_term = $token_is_term;
                    $token = $get_token->($last_is_term);
                    if ($token->[0] eq 'space') {
                        $token = $get_token->($last_is_term)
                    }
                }
                if (defined($token) && ($token->[0] ne 'end')) {
                    die('Unexpected end token: ', $token)
                }
                while (scalar(@{$op_stack})) {
                    $reduce->($op_stack, $num_stack)
                }
                $End_token = $last_end_token;
                $End_token_chars = $last_end_token_chars;
                return $num_stack
            }
            1
        }
    }
    sub Perlito5::Grammar::Number::term_digit {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ((do {
                    my $m2 = Perlito5::Grammar::Number::val_octal($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'Perlito5::Grammar::Number::val_octal'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = ['term', Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Number::val_octal'})];
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    my $m2 = Perlito5::Grammar::Number::val_vstring($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'Perlito5::Grammar::Number::val_vstring'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = ['term', Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Number::val_vstring'})];
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    my $m2 = Perlito5::Grammar::Number::val_num($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'Perlito5::Grammar::Number::val_num'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = ['term', Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Number::val_num'})];
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    my $m2 = Perlito5::Grammar::Number::val_int($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'Perlito5::Grammar::Number::val_int'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = ['term', Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Number::val_int'})];
                    1
                }))
            })
        }));
        $tmp ? $MATCH : 0
    }
    Perlito5::Grammar::Precedence::add_term($_ => \&term_digit)
        for '.', 0 .. 9;
    sub Perlito5::Grammar::Number::digit {
        substr($_[0], $_[1], 1) =~ m!\d! ? {'str' => $_[0], 'from' => $_[1], 'to' => $_[1] + 1} : 0
    }
    sub Perlito5::Grammar::Number::exponent {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ('e' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ('E' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
            })
        }) && (do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ('+' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ('-' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                1
            })
        }) && (do {
            my $last_match_null = 0;
            my $m = $MATCH;
            my $to = $MATCH->{'to'};
            my $count = 0;
            while ((do {
                my $pos1 = $MATCH->{'to'};
                (do {
                    ('_' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                }) || (do {
                    $MATCH->{'to'} = $pos1;
                    (do {
                        my $m2 = digit($str, $MATCH->{'to'});
                        if ($m2) {
                            $MATCH->{'to'} = $m2->{'to'};
                            1
                        }
                        else {
                            0
                        }
                    })
                })
            }) && ($last_match_null < 2)) {
                if ($to == $MATCH->{'to'}) {
                    $last_match_null = $last_match_null + 1
                }
                else {
                    $last_match_null = 0
                }
                $m = $MATCH;
                $to = $MATCH->{'to'};
                $count = $count + 1
            }
            $MATCH = $m;
            $MATCH->{'to'} = $to;
            $count > 0
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Number::val_num {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $pos1 = $MATCH->{'to'};
            (do {
                (('.' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    my $m2 = digit($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    my $last_match_null = 0;
                    my $m = $MATCH;
                    my $to = $MATCH->{'to'};
                    while ((do {
                        my $pos1 = $MATCH->{'to'};
                        (do {
                            ('_' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                        }) || (do {
                            $MATCH->{'to'} = $pos1;
                            (do {
                                my $m2 = digit($str, $MATCH->{'to'});
                                if ($m2) {
                                    $MATCH->{'to'} = $m2->{'to'};
                                    1
                                }
                                else {
                                    0
                                }
                            })
                        })
                    }) && ($last_match_null < 2)) {
                        if ($to == $MATCH->{'to'}) {
                            $last_match_null = $last_match_null + 1
                        }
                        else {
                            $last_match_null = 0
                        }
                        $m = $MATCH;
                        $to = $MATCH->{'to'}
                    }
                    $MATCH = $m;
                    $MATCH->{'to'} = $to;
                    1
                }) && (do {
                    my $m = $MATCH;
                    if (!(do {
                        my $m2 = exponent($str, $MATCH->{'to'});
                        if ($m2) {
                            $MATCH->{'to'} = $m2->{'to'};
                            1
                        }
                        else {
                            0
                        }
                    })) {
                        $MATCH = $m
                    }
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    my $m2 = digit($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    my $last_match_null = 0;
                    my $m = $MATCH;
                    my $to = $MATCH->{'to'};
                    while ((do {
                        my $pos1 = $MATCH->{'to'};
                        (do {
                            ('_' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                        }) || (do {
                            $MATCH->{'to'} = $pos1;
                            (do {
                                my $m2 = digit($str, $MATCH->{'to'});
                                if ($m2) {
                                    $MATCH->{'to'} = $m2->{'to'};
                                    1
                                }
                                else {
                                    0
                                }
                            })
                        })
                    }) && ($last_match_null < 2)) {
                        if ($to == $MATCH->{'to'}) {
                            $last_match_null = $last_match_null + 1
                        }
                        else {
                            $last_match_null = 0
                        }
                        $m = $MATCH;
                        $to = $MATCH->{'to'}
                    }
                    $MATCH = $m;
                    $MATCH->{'to'} = $to;
                    1
                }) && (do {
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        (do {
                            my $m2 = exponent($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                1
                            }
                            else {
                                0
                            }
                        })
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        (('.' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                            my $tmp = $MATCH;
                            $MATCH = {'str' => $str, 'from' => $tmp->{'to'}, 'to' => $tmp->{'to'}};
                            my $res = ('.' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}));
                            $MATCH = $tmp;
                            $res ? 0 : 1
                        }) && (do {
                            my $last_match_null = 0;
                            my $m = $MATCH;
                            my $to = $MATCH->{'to'};
                            while ((do {
                                my $pos1 = $MATCH->{'to'};
                                (do {
                                    ('_' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                                }) || (do {
                                    $MATCH->{'to'} = $pos1;
                                    (do {
                                        my $m2 = digit($str, $MATCH->{'to'});
                                        if ($m2) {
                                            $MATCH->{'to'} = $m2->{'to'};
                                            1
                                        }
                                        else {
                                            0
                                        }
                                    })
                                })
                            }) && ($last_match_null < 2)) {
                                if ($to == $MATCH->{'to'}) {
                                    $last_match_null = $last_match_null + 1
                                }
                                else {
                                    $last_match_null = 0
                                }
                                $m = $MATCH;
                                $to = $MATCH->{'to'}
                            }
                            $MATCH = $m;
                            $MATCH->{'to'} = $to;
                            1
                        }) && (do {
                            my $m = $MATCH;
                            if (!(do {
                                my $m2 = exponent($str, $MATCH->{'to'});
                                if ($m2) {
                                    $MATCH->{'to'} = $m2->{'to'};
                                    1
                                }
                                else {
                                    0
                                }
                            })) {
                                $MATCH = $m
                            }
                            1
                        }))
                    })
                }))
            })
        }) && (do {
            $MATCH->{'str'} = $str;
            my $s = Perlito5::Match::flat($MATCH);
            $s =~ s!_!!g;
            $MATCH->{'capture'} = Perlito5::AST::Num::->new('num' => $s);
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Number::digits {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
            my $last_match_null = 0;
            my $m = $MATCH;
            my $to = $MATCH->{'to'};
            my $count = 0;
            while ((do {
                my $m2 = digit($str, $MATCH->{'to'});
                if ($m2) {
                    $MATCH->{'to'} = $m2->{'to'};
                    1
                }
                else {
                    0
                }
            }) && ($last_match_null < 2)) {
                if ($to == $MATCH->{'to'}) {
                    $last_match_null = $last_match_null + 1
                }
                else {
                    $last_match_null = 0
                }
                $m = $MATCH;
                $to = $MATCH->{'to'};
                $count = $count + 1
            }
            $MATCH = $m;
            $MATCH->{'to'} = $to;
            $count > 0
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Number::digits_underscore {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $m2 = digit($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                1
            }
            else {
                0
            }
        }) && (do {
            my $last_match_null = 0;
            my $m = $MATCH;
            my $to = $MATCH->{'to'};
            while ((do {
                my $pos1 = $MATCH->{'to'};
                (do {
                    ('_' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                }) || (do {
                    $MATCH->{'to'} = $pos1;
                    (do {
                        my $m2 = digit($str, $MATCH->{'to'});
                        if ($m2) {
                            $MATCH->{'to'} = $m2->{'to'};
                            1
                        }
                        else {
                            0
                        }
                    })
                })
            }) && ($last_match_null < 2)) {
                if ($to == $MATCH->{'to'}) {
                    $last_match_null = $last_match_null + 1
                }
                else {
                    $last_match_null = 0
                }
                $m = $MATCH;
                $to = $MATCH->{'to'}
            }
            $MATCH = $m;
            $MATCH->{'to'} = $to;
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Number::val_octal {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((0 eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ((do {
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        ('x' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        ('X' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                    })
                }) && (do {
                    my $last_match_null = 0;
                    my $m = $MATCH;
                    my $to = $MATCH->{'to'};
                    my $count = 0;
                    while ((do {
                        my $m2 = Perlito5::Grammar::word($str, $MATCH->{'to'});
                        if ($m2) {
                            $MATCH->{'to'} = $m2->{'to'};
                            1
                        }
                        else {
                            0
                        }
                    }) && ($last_match_null < 2)) {
                        if ($to == $MATCH->{'to'}) {
                            $last_match_null = $last_match_null + 1
                        }
                        else {
                            $last_match_null = 0
                        }
                        $m = $MATCH;
                        $to = $MATCH->{'to'};
                        $count = $count + 1
                    }
                    $MATCH = $m;
                    $MATCH->{'to'} = $to;
                    $count > 0
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        ('b' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        ('B' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                    })
                }) && (do {
                    my $last_match_null = 0;
                    my $m = $MATCH;
                    my $to = $MATCH->{'to'};
                    my $count = 0;
                    while ((do {
                        my $pos1 = $MATCH->{'to'};
                        (do {
                            ('_' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                        }) || (do {
                            $MATCH->{'to'} = $pos1;
                            (0 eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                        }) || (do {
                            $MATCH->{'to'} = $pos1;
                            (1 eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                        })
                    }) && ($last_match_null < 2)) {
                        if ($to == $MATCH->{'to'}) {
                            $last_match_null = $last_match_null + 1
                        }
                        else {
                            $last_match_null = 0
                        }
                        $m = $MATCH;
                        $to = $MATCH->{'to'};
                        $count = $count + 1
                    }
                    $MATCH = $m;
                    $MATCH->{'to'} = $to;
                    $count > 0
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (do {
                    my $last_match_null = 0;
                    my $m = $MATCH;
                    my $to = $MATCH->{'to'};
                    my $count = 0;
                    while ((do {
                        my $pos1 = $MATCH->{'to'};
                        (do {
                            ('_' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                        }) || (do {
                            $MATCH->{'to'} = $pos1;
                            (do {
                                my $m2 = digit($str, $MATCH->{'to'});
                                if ($m2) {
                                    $MATCH->{'to'} = $m2->{'to'};
                                    1
                                }
                                else {
                                    0
                                }
                            })
                        })
                    }) && ($last_match_null < 2)) {
                        if ($to == $MATCH->{'to'}) {
                            $last_match_null = $last_match_null + 1
                        }
                        else {
                            $last_match_null = 0
                        }
                        $m = $MATCH;
                        $to = $MATCH->{'to'};
                        $count = $count + 1
                    }
                    $MATCH = $m;
                    $MATCH->{'to'} = $to;
                    $count > 0
                })
            })
        }) && (do {
            $MATCH->{'str'} = $str;
            $MATCH->{'capture'} = Perlito5::AST::Int::->new('int' => oct(lc(Perlito5::Match::flat($MATCH))));
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Number::val_int {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $m2 = digits_underscore($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                1
            }
            else {
                0
            }
        }) && (do {
            $MATCH->{'str'} = $str;
            my $s = Perlito5::Match::flat($MATCH);
            $s =~ s!_!!g;
            $MATCH->{'capture'} = Perlito5::AST::Int::->new('int' => $s);
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Number::val_vstring {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $m2 = val_int($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'val_int'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $last_match_null = 0;
            my $m = $MATCH;
            my $to = $MATCH->{'to'};
            my $count = 0;
            while ((('.' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                my $m2 = digits_underscore($str, $MATCH->{'to'});
                if ($m2) {
                    $MATCH->{'to'} = $m2->{'to'};
                    if (exists($MATCH->{'digits_underscore'})) {
                        push(@{$MATCH->{'digits_underscore'}}, $m2)
                    }
                    else {
                        $MATCH->{'digits_underscore'} = [$m2]
                    }
                    1
                }
                else {
                    0
                }
            })) && ($last_match_null < 2)) {
                if ($to == $MATCH->{'to'}) {
                    $last_match_null = $last_match_null + 1
                }
                else {
                    $last_match_null = 0
                }
                $m = $MATCH;
                $to = $MATCH->{'to'};
                $count = $count + 1
            }
            $MATCH = $m;
            $MATCH->{'to'} = $to;
            $count > 0
        }) && (do {
            $MATCH->{'str'} = $str;
            my @parts = map {
                Perlito5::Match::flat($_)
            } @{$MATCH->{'digits_underscore'}};
            @parts < 2 && return ;
            $MATCH->{'capture'} = Perlito5::AST::Buf::->new('buf' => join('', map {
                chr($_)
            } $MATCH->{'val_int'}->{'capture'}->{'int'}, @parts));
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Number::val_version {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((('v' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
            my $m2 = val_int($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'val_int'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $last_match_null = 0;
            my $m = $MATCH;
            my $to = $MATCH->{'to'};
            while ((('.' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                my $m2 = digits_underscore($str, $MATCH->{'to'});
                if ($m2) {
                    $MATCH->{'to'} = $m2->{'to'};
                    if (exists($MATCH->{'digits_underscore'})) {
                        push(@{$MATCH->{'digits_underscore'}}, $m2)
                    }
                    else {
                        $MATCH->{'digits_underscore'} = [$m2]
                    }
                    1
                }
                else {
                    0
                }
            })) && ($last_match_null < 2)) {
                if ($to == $MATCH->{'to'}) {
                    $last_match_null = $last_match_null + 1
                }
                else {
                    $last_match_null = 0
                }
                $m = $MATCH;
                $to = $MATCH->{'to'}
            }
            $MATCH = $m;
            $MATCH->{'to'} = $to;
            1
        }) && (do {
            $MATCH->{'str'} = $str;
            my @parts = map {
                Perlito5::Match::flat($_)
            } @{$MATCH->{'digits_underscore'}};
            $MATCH->{'capture'} = Perlito5::AST::Buf::->new('buf' => join('', map {
                chr($_)
            } $MATCH->{'val_int'}->{'capture'}->{'int'}, @parts));
            1
        })));
        $tmp ? $MATCH : 0
    }
    1
}
;1
