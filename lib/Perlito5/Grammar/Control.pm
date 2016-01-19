# Do not edit this file - Generated by Perlito5 9.017

{
    package main;
    package Perlito5::Grammar;
    use strict;
    use Perlito5::Grammar::Expression;
    use Perlito5::Grammar::Statement;
    sub Perlito5::Grammar::unless {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((('unless' eq substr($str, $MATCH->{'to'}, 6) && ($MATCH->{'to'} = 6 + $MATCH->{'to'})) && (do {
            my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                1
            }
            else {
                0
            }
        }) && (do {
            Perlito5::Grammar::Scope::create_new_compile_time_scope();
            1
        }) && (do {
            my $m2 = Perlito5::Grammar::Expression::term_paren($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'Perlito5::Grammar::Expression::term_paren'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                1
            }
            else {
                0
            }
        }) && (do {
            my $m2 = block($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'block'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ((do {
                    my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && ('else' eq substr($str, $MATCH->{'to'}, 4) && ($MATCH->{'to'} = 4 + $MATCH->{'to'})) && (do {
                    my $m2 = block2($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'block2'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $MATCH->{'capture'} = Perlito5::AST::If::->new('cond' => Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::term_paren'})->[2], 'body' => Perlito5::Match::flat($MATCH->{'block2'}), 'otherwise' => Perlito5::Match::flat($MATCH->{'block'}));
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (do {
                    $MATCH->{'capture'} = Perlito5::AST::If::->new('cond' => Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::term_paren'})->[2], 'body' => Perlito5::AST::Block::->new('stmts' => []), 'otherwise' => Perlito5::Match::flat($MATCH->{'block'}));
                    1
                })
            })
        }) && (do {
            Perlito5::Grammar::Scope::end_compile_time_scope();
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::if_ {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((('if' eq substr($str, $MATCH->{'to'}, 2) && ($MATCH->{'to'} = 2 + $MATCH->{'to'})) && (do {
            my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                1
            }
            else {
                0
            }
        }) && (do {
            Perlito5::Grammar::Scope::create_new_compile_time_scope();
            1
        }) && (do {
            my $m2 = Perlito5::Grammar::Expression::term_paren($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'Perlito5::Grammar::Expression::term_paren'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                1
            }
            else {
                0
            }
        }) && (do {
            my $m2 = block($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'block'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ((do {
                    my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && ('else' eq substr($str, $MATCH->{'to'}, 4) && ($MATCH->{'to'} = 4 + $MATCH->{'to'})) && (do {
                    my $m2 = block2($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'block2'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $MATCH->{'capture'} = Perlito5::AST::If::->new('cond' => Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::term_paren'})->[2], 'body' => Perlito5::Match::flat($MATCH->{'block'}), 'otherwise' => Perlito5::Match::flat($MATCH->{'block2'}));
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && ('els' eq substr($str, $MATCH->{'to'}, 3) && ($MATCH->{'to'} = 3 + $MATCH->{'to'})) && (do {
                    my $m2 = if_($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'if_'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $MATCH->{'capture'} = Perlito5::AST::If::->new('cond' => Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::term_paren'})->[2], 'body' => Perlito5::Match::flat($MATCH->{'block'}), 'otherwise' => Perlito5::AST::Block::->new('stmts' => [Perlito5::Match::flat($MATCH->{'if_'})]));
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (do {
                    $MATCH->{'capture'} = Perlito5::AST::If::->new('cond' => Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::term_paren'})->[2], 'body' => Perlito5::Match::flat($MATCH->{'block'}), 'otherwise' => Perlito5::AST::Block::->new('stmts' => []));
                    1
                })
            })
        }) && (do {
            Perlito5::Grammar::Scope::end_compile_time_scope();
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::when {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((('when' eq substr($str, $MATCH->{'to'}, 4) && ($MATCH->{'to'} = 4 + $MATCH->{'to'})) && (do {
            my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                1
            }
            else {
                0
            }
        }) && (do {
            Perlito5::Grammar::Scope::create_new_compile_time_scope();
            1
        }) && (do {
            my $m2 = Perlito5::Grammar::Expression::term_paren($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'Perlito5::Grammar::Expression::term_paren'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                1
            }
            else {
                0
            }
        }) && (do {
            my $m2 = block($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'block'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            $MATCH->{'capture'} = Perlito5::AST::When::->new('cond' => Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::term_paren'})->[2], 'body' => Perlito5::Match::flat($MATCH->{'block'}));
            1
        }) && (do {
            Perlito5::Grammar::Scope::end_compile_time_scope();
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::for {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((('for' eq substr($str, $MATCH->{'to'}, 3) && ($MATCH->{'to'} = 3 + $MATCH->{'to'})) && (do {
            my $m = $MATCH;
            if (!('each' eq substr($str, $MATCH->{'to'}, 4) && ($MATCH->{'to'} = 4 + $MATCH->{'to'}))) {
                $MATCH = $m
            }
            1
        }) && (do {
            Perlito5::Grammar::Scope::create_new_compile_time_scope();
            1
        }) && (do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ((do {
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        ((do {
                            my $m2 = Perlito5::Grammar::Space::ws($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                1
                            }
                            else {
                                0
                            }
                        }) && (do {
                            my $m2 = Perlito5::Grammar::Expression::term_declarator($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                $MATCH->{'Perlito5::Grammar::Expression::term_declarator'} = $m2;
                                1
                            }
                            else {
                                0
                            }
                        }) && (do {
                            $MATCH->{'_tmp'} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::term_declarator'})->[1];
                            1
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        ((do {
                            my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                1
                            }
                            else {
                                0
                            }
                        }) && (do {
                            my $tmp = $MATCH;
                            $MATCH = {'from' => $tmp->{'to'}, 'to' => $tmp->{'to'}};
                            my $res = ('$' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}));
                            $MATCH = $tmp;
                            $res ? 1 : 0
                        }) && (do {
                            my $m2 = Perlito5::Grammar::Sigil::term_sigil($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                $MATCH->{'Perlito5::Grammar::Sigil::term_sigil'} = $m2;
                                1
                            }
                            else {
                                0
                            }
                        }) && (do {
                            $MATCH->{'_tmp'} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Sigil::term_sigil'})->[1];
                            1
                        }))
                    })
                }) && (do {
                    my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && ('(' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    my $m2 = Perlito5::Grammar::Expression::paren_parse($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'Perlito5::Grammar::Expression::paren_parse'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (')' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    my $m2 = block($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'block'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    my $m2 = opt_continue_block($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'opt_continue_block'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    my $body = Perlito5::Match::flat($MATCH->{'block'});
                    $MATCH->{'capture'} = Perlito5::AST::For::->new('cond' => Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::paren_parse'}), 'body' => $body, 'continue' => $MATCH->{'opt_continue_block'}->{'capture'}, 'topic' => $MATCH->{'_tmp'});
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && ('(' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        ((do {
                            my $m2 = Perlito5::Grammar::Expression::exp_parse($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                $MATCH->{'Perlito5::Grammar::Expression::exp_parse'} = $m2;
                                1
                            }
                            else {
                                0
                            }
                        }) && (do {
                            Perlito5::Grammar::Scope::check_variable_declarations();
                            1
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        ()
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        ((do {
                            my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                1
                            }
                            else {
                                0
                            }
                        }) && (do {
                            my $tmp = $MATCH;
                            $MATCH = {'from' => $tmp->{'to'}, 'to' => $tmp->{'to'}};
                            my $res = (';' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}));
                            $MATCH = $tmp;
                            $res ? 1 : 0
                        }))
                    })
                }) && (do {
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        ((';' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                            $MATCH->{'c_style_for'} = 1;
                            1
                        }) && (do {
                            my $pos1 = $MATCH->{'to'};
                            (do {
                                ((do {
                                    my $m2 = Perlito5::Grammar::exp($str, $MATCH->{'to'});
                                    if ($m2) {
                                        $MATCH->{'to'} = $m2->{'to'};
                                        $MATCH->{'Perlito5::Grammar::exp'} = $m2;
                                        1
                                    }
                                    else {
                                        0
                                    }
                                }) && (do {
                                    Perlito5::Grammar::Scope::check_variable_declarations();
                                    1
                                }))
                            }) || (do {
                                $MATCH->{'to'} = $pos1;
                                ()
                            }) || (do {
                                $MATCH->{'to'} = $pos1;
                                (do {
                                    my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                                    if ($m2) {
                                        $MATCH->{'to'} = $m2->{'to'};
                                        1
                                    }
                                    else {
                                        0
                                    }
                                })
                            })
                        }) && (';' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                            my $pos1 = $MATCH->{'to'};
                            (do {
                                (do {
                                    my $m2 = Perlito5::Grammar::exp2($str, $MATCH->{'to'});
                                    if ($m2) {
                                        $MATCH->{'to'} = $m2->{'to'};
                                        $MATCH->{'Perlito5::Grammar::exp2'} = $m2;
                                        1
                                    }
                                    else {
                                        0
                                    }
                                })
                            }) || (do {
                                $MATCH->{'to'} = $pos1;
                                ()
                            }) || (do {
                                $MATCH->{'to'} = $pos1;
                                (do {
                                    my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                                    if ($m2) {
                                        $MATCH->{'to'} = $m2->{'to'};
                                        1
                                    }
                                    else {
                                        0
                                    }
                                })
                            })
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        1
                    })
                }) && (')' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    my $m2 = block($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'block'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    my $m2 = opt_continue_block($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'opt_continue_block'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    my $header;
                    my $body = Perlito5::Match::flat($MATCH->{'block'});
                    my $topic;
                    if ($MATCH->{'c_style_for'}) {
                        $header = [$MATCH->{'Perlito5::Grammar::Expression::exp_parse'}->{'capture'}, $MATCH->{'Perlito5::Grammar::exp'}->{'capture'}, $MATCH->{'Perlito5::Grammar::exp2'}->{'capture'}]
                    }
                    else {
                        $header = $MATCH->{'Perlito5::Grammar::Expression::exp_parse'}->{'capture'};
                        $topic = Perlito5::AST::Var::->new('namespace' => '', 'name' => '_', 'sigil' => '$')
                    }
                    $MATCH->{'capture'} = Perlito5::AST::For::->new('cond' => $header, 'body' => $body, 'continue' => $MATCH->{'opt_continue_block'}->{'capture'}, 'topic' => $topic);
                    1
                }))
            })
        }) && (do {
            Perlito5::Grammar::Scope::end_compile_time_scope();
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::while {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((('while' eq substr($str, $MATCH->{'to'}, 5) && ($MATCH->{'to'} = 5 + $MATCH->{'to'})) && (do {
            my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                1
            }
            else {
                0
            }
        }) && (do {
            Perlito5::Grammar::Scope::create_new_compile_time_scope();
            1
        }) && ('(' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
            my $m2 = Perlito5::Grammar::Expression::paren_parse($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'Perlito5::Grammar::Expression::paren_parse'} = $m2;
                1
            }
            else {
                0
            }
        }) && (')' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
            my $m2 = block($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'block'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $m2 = opt_continue_block($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'opt_continue_block'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $cond = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::paren_parse'});
            if ($cond eq '*undef*') {
                $cond = Perlito5::AST::Int::->new('int' => 1)
            }
            my $stmt = Perlito5::AST::While::->new('cond' => $cond, 'body' => Perlito5::Match::flat($MATCH->{'block'}), 'continue' => $MATCH->{'opt_continue_block'}->{'capture'});
            my $out = Perlito5::Macro::while_file($stmt);
            $out && ($stmt = $out);
            $MATCH->{'capture'} = $stmt;
            1
        }) && (do {
            Perlito5::Grammar::Scope::end_compile_time_scope();
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::until {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((('until' eq substr($str, $MATCH->{'to'}, 5) && ($MATCH->{'to'} = 5 + $MATCH->{'to'})) && (do {
            my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                1
            }
            else {
                0
            }
        }) && (do {
            Perlito5::Grammar::Scope::create_new_compile_time_scope();
            1
        }) && ('(' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
            my $m2 = Perlito5::Grammar::Expression::paren_parse($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'Perlito5::Grammar::Expression::paren_parse'} = $m2;
                1
            }
            else {
                0
            }
        }) && (')' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
            my $m2 = block($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'block'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $m2 = opt_continue_block($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'opt_continue_block'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $cond = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::paren_parse'});
            if ($cond eq '*undef*') {
                $cond = Perlito5::AST::Int::->new('int' => 1)
            }
            $MATCH->{'capture'} = Perlito5::AST::While::->new('cond' => Perlito5::AST::Apply::->new('arguments' => [$cond], 'code' => 'prefix:<!>', 'namespace' => ''), 'body' => Perlito5::Match::flat($MATCH->{'block'}), 'continue' => $MATCH->{'opt_continue_block'}->{'capture'});
            1
        }) && (do {
            Perlito5::Grammar::Scope::end_compile_time_scope();
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::given {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((('given' eq substr($str, $MATCH->{'to'}, 5) && ($MATCH->{'to'} = 5 + $MATCH->{'to'})) && (do {
            my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                1
            }
            else {
                0
            }
        }) && (do {
            Perlito5::Grammar::Scope::create_new_compile_time_scope();
            1
        }) && ('(' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
            my $m2 = Perlito5::Grammar::Expression::paren_parse($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'Perlito5::Grammar::Expression::paren_parse'} = $m2;
                1
            }
            else {
                0
            }
        }) && (')' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
            my $m2 = block($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'block'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $body = Perlito5::Match::flat($MATCH->{'block'});
            $body->{'sig'} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::var_ident'});
            $MATCH->{'capture'} = Perlito5::AST::Given::->new('cond' => Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::paren_parse'}), 'body' => $body);
            1
        }) && (do {
            Perlito5::Grammar::Scope::end_compile_time_scope();
            1
        })));
        $tmp ? $MATCH : 0
    }
    Perlito5::Grammar::Statement::add_statement('if' => \&if_);
    Perlito5::Grammar::Statement::add_statement('for' => \&for);
    Perlito5::Grammar::Statement::add_statement('foreach' => \&for);
    Perlito5::Grammar::Statement::add_statement('when' => \&when);
    Perlito5::Grammar::Statement::add_statement('while' => \&while);
    Perlito5::Grammar::Statement::add_statement('until' => \&until);
    Perlito5::Grammar::Statement::add_statement('given' => \&given);
    Perlito5::Grammar::Statement::add_statement('unless' => \&unless)
}
;1
