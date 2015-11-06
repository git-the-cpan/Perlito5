# Do not edit this file - Generated by Perlito5 9.009
{
    package main;
    package Perlito5::Grammar::Print;
    use strict;
    our %Print = ('print' => 1, 'printf' => 1, 'say' => 1, 'exec' => 1, 'system' => 1);
    sub Perlito5::Grammar::Print::print_decl {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ('printf' eq substr($str, $MATCH->{'to'}, 6) && ($MATCH->{'to'} = 6 + $MATCH->{'to'}))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ('print' eq substr($str, $MATCH->{'to'}, 5) && ($MATCH->{'to'} = 5 + $MATCH->{'to'}))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ('say' eq substr($str, $MATCH->{'to'}, 3) && ($MATCH->{'to'} = 3 + $MATCH->{'to'}))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ('exec' eq substr($str, $MATCH->{'to'}, 4) && ($MATCH->{'to'} = 4 + $MATCH->{'to'}))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ('system' eq substr($str, $MATCH->{'to'}, 6) && ($MATCH->{'to'} = 6 + $MATCH->{'to'}))
            })
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Print::the_object {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ((do {
                    my $tmp = $MATCH;
                    $MATCH = {'str' => $str, 'from' => $tmp->{'to'}, 'to' => $tmp->{'to'}};
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
                    my $tmp = $MATCH;
                    $MATCH = {'str' => $str, 'from' => $tmp->{'to'}, 'to' => $tmp->{'to'}};
                    my $res = ('+' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}));
                    $MATCH = $tmp;
                    $res ? 0 : 1
                }) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Sigil::term_sigil'})->[1];
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    my $tmp = $MATCH;
                    $MATCH = {'str' => $str, 'from' => $tmp->{'to'}, 'to' => $tmp->{'to'}};
                    my $res = ('{' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}));
                    $MATCH = $tmp;
                    $res ? 1 : 0
                }) && (do {
                    my $m2 = Perlito5::Grammar::Block::block($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'Perlito5::Grammar::Block::block'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Block::block'});
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    my $m2 = typeglob($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'typeglob'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    my $tmp = $MATCH;
                    $MATCH = {'str' => $str, 'from' => $tmp->{'to'}, 'to' => $tmp->{'to'}};
                    my $res = ('(' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}));
                    $MATCH = $tmp;
                    $res ? 0 : 1
                }) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'typeglob'});
                    1
                }))
            })
        }) && (do {
            $MATCH->{'str'} = $str;
            my $pos = $MATCH->{'to'};
            my $m = Perlito5::Grammar::Space::ws($MATCH->{'str'}, $pos);
            $m && ($pos = $m->{'to'});
            my $s = substr($MATCH->{'str'}, $pos, 1);
            my $s2 = substr($MATCH->{'str'}, $pos, 2);
            if ($s eq ',' || $s eq '?' || $s2 eq '->' || $s eq '[' || $s eq '{') {
                return 
            }
            if ($s eq '+') {
                my $m = Perlito5::Grammar::Space::ws($MATCH->{'str'}, $pos + 1);
                if ($m) {
                    return 
                }
            }
            else {
                my $m = Perlito5::Grammar::Precedence::op_parse($MATCH->{'str'}, $pos, 1);
                my $next_op = $m ? Perlito5::Match::flat($m)->[1] : '';
                my $is_infix = Perlito5::Grammar::Precedence::is_fixity_type('infix', $next_op);
                $is_infix && return 
            }
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Print::typeglob {
        my $str = $_[0];
        my $pos = $_[1];
        my $p = $pos;
        my $m_namespace = Perlito5::Grammar::optional_namespace_before_ident($str, $p);
        my $namespace = Perlito5::Match::flat($m_namespace);
        $p = $m_namespace->{'to'};
        my $m_name = Perlito5::Grammar::ident($str, $p);
        if (!$m_name) {
            if ($namespace) {
                $m_namespace->{'capture'} = Perlito5::AST::Var::->new('sigil' => '::', 'name' => '', 'namespace' => $namespace);
                return $m_namespace
            }
            return 
        }
        my $name = Perlito5::Match::flat($m_name);
        $p = $m_name->{'to'};
        if (substr($str, $p, 2) eq '::') {
            $m_name->{'to'} = $p + 2;
            $m_name->{'capture'} = Perlito5::AST::Var::->new('sigil' => '::', 'name' => '', 'namespace' => $namespace . '::' . $name);
            return $m_name
        }
        my $effective_name = ($namespace || $Perlito5::PKG_NAME) . '::' . $name;
        if (exists($Perlito5::PROTO->{$effective_name}) || exists(&{$effective_name})) {
            return 
        }
        if ((!$namespace || $namespace eq 'CORE') && exists($Perlito5::CORE_PROTO->{'CORE::' . $name})) {
            return 
        }
        my $full_name = $name;
        $namespace && ($full_name = $namespace . '::' . $name);
        $m_name->{'capture'} = Perlito5::AST::Var::->new('sigil' => '::', 'name' => '', 'namespace' => $full_name);
        return $m_name
    }
    sub Perlito5::Grammar::Print::print_ast {
        my($decl, $the_object, $expr) = @_;
        Perlito5::AST::Apply::->new('namespace' => '', 'code' => $decl, 'special_arg' => $the_object, 'arguments' => $expr)
    }
    sub Perlito5::Grammar::Print::term_print {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $m2 = print_decl($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'print_decl'} = $m2;
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
            my $pos1 = $MATCH->{'to'};
            (do {
                (('(' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'_scope'} = $#Perlito5::SCOPE_STMT;
                    1
                }) && (do {
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        ((do {
                            my $m2 = the_object($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                $MATCH->{'the_object'} = $m2;
                                1
                            }
                            else {
                                0
                            }
                        }) && (do {
                            my $m2 = Perlito5::Grammar::Expression::list_parse($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                $MATCH->{'Perlito5::Grammar::Expression::list_parse'} = $m2;
                                1
                            }
                            else {
                                0
                            }
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        (do {
                            $MATCH->{'str'} = $str;
                            $#Perlito5::SCOPE_STMT = $MATCH->{'_scope'};
                            return ;
                            1
                        })
                    })
                }) && (')' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    $MATCH->{'str'} = $str;
                    my $list = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::list_parse'});
                    !ref($list) && return ;
                    $MATCH->{'capture'} = ['term', print_ast(Perlito5::Match::flat($MATCH->{'print_decl'}), Perlito5::Match::flat($MATCH->{'the_object'}), Perlito5::Grammar::Expression::expand_list($list))];
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'_scope'} = $#Perlito5::SCOPE_STMT;
                    1
                }) && (do {
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        ((do {
                            my $m2 = the_object($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                $MATCH->{'the_object'} = $m2;
                                1
                            }
                            else {
                                0
                            }
                        }) && (do {
                            my $m2 = Perlito5::Grammar::Expression::list_parse($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                $MATCH->{'Perlito5::Grammar::Expression::list_parse'} = $m2;
                                1
                            }
                            else {
                                0
                            }
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        (do {
                            $MATCH->{'str'} = $str;
                            $#Perlito5::SCOPE_STMT = $MATCH->{'_scope'};
                            return ;
                            1
                        })
                    })
                }) && (do {
                    $MATCH->{'str'} = $str;
                    my $list = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::list_parse'});
                    !ref($list) && return ;
                    $MATCH->{'capture'} = ['term', print_ast(Perlito5::Match::flat($MATCH->{'print_decl'}), Perlito5::Match::flat($MATCH->{'the_object'}), Perlito5::Grammar::Expression::expand_list($list))];
                    1
                }))
            })
        })));
        $tmp ? $MATCH : 0
    }
    Perlito5::Grammar::Precedence::add_term('print' => \&term_print);
    Perlito5::Grammar::Precedence::add_term('printf' => \&term_print);
    Perlito5::Grammar::Precedence::add_term('say' => \&term_print);
    Perlito5::Grammar::Precedence::add_term('exec' => \&term_print);
    Perlito5::Grammar::Precedence::add_term('system' => \&term_print);
    1
}
;1
