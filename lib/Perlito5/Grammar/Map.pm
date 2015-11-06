# Do not edit this file - Generated by Perlito5 9.009
{
    package main;
    package Perlito5::Grammar::Map;
    use strict;
    sub Perlito5::Grammar::Map::map_or_grep {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ('map' eq substr($str, $MATCH->{'to'}, 3) && ($MATCH->{'to'} = 3 + $MATCH->{'to'}))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ('grep' eq substr($str, $MATCH->{'to'}, 4) && ($MATCH->{'to'} = 4 + $MATCH->{'to'}))
            })
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Map::term_map_or_grep {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $m2 = map_or_grep($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'map_or_grep'} = $m2;
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
                ((do {
                    my $m2 = Perlito5::Grammar::block($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'Perlito5::Grammar::block'} = $m2;
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
                }) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = ['term', Perlito5::AST::Apply::->new('code' => Perlito5::Match::flat($MATCH->{'map_or_grep'}), 'special_arg' => $MATCH->{'Perlito5::Grammar::block'}->{'capture'}, 'arguments' => Perlito5::Grammar::Expression::expand_list($MATCH->{'Perlito5::Grammar::Expression::list_parse'}->{'capture'}), 'namespace' => '')];
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
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
                    my $m2 = Perlito5::Grammar::block($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'Perlito5::Grammar::block'} = $m2;
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
                }) && (')' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = ['term', Perlito5::AST::Apply::->new('code' => Perlito5::Match::flat($MATCH->{'map_or_grep'}), 'special_arg' => $MATCH->{'Perlito5::Grammar::block'}->{'capture'}, 'arguments' => Perlito5::Grammar::Expression::expand_list($MATCH->{'Perlito5::Grammar::Expression::list_parse'}->{'capture'}), 'namespace' => '')];
                    1
                }))
            })
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Map::non_core_ident {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $m2 = Perlito5::Grammar::full_ident($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'Perlito5::Grammar::full_ident'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            $MATCH->{'str'} = $str;
            my $name = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::full_ident'});
            ($Perlito5::CORE_PROTO->{$name} || $Perlito5::CORE_PROTO->{'CORE::' . $name}) && return ;
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Map::term_sort {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((('sort' eq substr($str, $MATCH->{'to'}, 4) && ($MATCH->{'to'} = 4 + $MATCH->{'to'})) && (do {
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
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        ((do {
                            my $m2 = Perlito5::Grammar::Map::non_core_ident($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                $MATCH->{'Perlito5::Grammar::Map::non_core_ident'} = $m2;
                                1
                            }
                            else {
                                0
                            }
                        }) && (do {
                            my $m2 = Perlito5::Grammar::Space::ws($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                1
                            }
                            else {
                                0
                            }
                        }) && (do {
                            $MATCH->{'str'} = $str;
                            my $name = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Map::non_core_ident'});
                            $MATCH->{'_tmp'} = $name;
                            1
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        ((do {
                            my $m2 = Perlito5::Grammar::block($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                $MATCH->{'Perlito5::Grammar::block'} = $m2;
                                1
                            }
                            else {
                                0
                            }
                        }) && (do {
                            $MATCH->{'str'} = $str;
                            $MATCH->{'_tmp'} = $MATCH->{'Perlito5::Grammar::block'}->{'capture'};
                            1
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
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
                            $MATCH->{'str'} = $str;
                            my $var = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Sigil::term_sigil'})->[1];
                            ref($var) ne 'Perlito5::AST::Var' && return ;
                            $MATCH->{'_tmp'} = $var;
                            1
                        }))
                    })
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
                }) && (')' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = ['term', Perlito5::AST::Apply::->new('code' => 'sort', 'special_arg' => $MATCH->{'_tmp'}, 'arguments' => Perlito5::Grammar::Expression::expand_list($MATCH->{'Perlito5::Grammar::Expression::list_parse'}->{'capture'}), 'namespace' => '')];
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        ((do {
                            my $m2 = Perlito5::Grammar::block($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                $MATCH->{'Perlito5::Grammar::block'} = $m2;
                                1
                            }
                            else {
                                0
                            }
                        }) && (do {
                            $MATCH->{'str'} = $str;
                            $MATCH->{'_tmp'} = $MATCH->{'Perlito5::Grammar::block'}->{'capture'};
                            1
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        ((do {
                            my $m2 = Perlito5::Grammar::Map::non_core_ident($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                $MATCH->{'Perlito5::Grammar::Map::non_core_ident'} = $m2;
                                1
                            }
                            else {
                                0
                            }
                        }) && (do {
                            $MATCH->{'str'} = $str;
                            my $name = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Map::non_core_ident'});
                            $MATCH->{'_tmp'} = $name;
                            1
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
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
                            $MATCH->{'str'} = $str;
                            my $var = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Sigil::term_sigil'})->[1];
                            ref($var) ne 'Perlito5::AST::Var' && return ;
                            $MATCH->{'_tmp'} = $var;
                            1
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        (do {
                            $MATCH->{'str'} = $str;
                            $MATCH->{'_tmp'} = Perlito5::AST::Block::->new('stmts' => [Perlito5::AST::Apply::->new('code' => 'infix:<cmp>', 'arguments' => [Perlito5::AST::Var::->new('name' => 'a', 'namespace' => $Perlito5::PKG, 'sigil' => '$'), Perlito5::AST::Var::->new('name' => 'b', 'namespace' => $Perlito5::PKG, 'sigil' => '$')])]);
                            1
                        })
                    })
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
                }) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = ['term', Perlito5::AST::Apply::->new('code' => 'sort', 'special_arg' => $MATCH->{'_tmp'}, 'arguments' => Perlito5::Grammar::Expression::expand_list($MATCH->{'Perlito5::Grammar::Expression::list_parse'}->{'capture'}), 'namespace' => '')];
                    1
                }))
            })
        })));
        $tmp ? $MATCH : 0
    }
    Perlito5::Grammar::Precedence::add_term('map' => \&term_map_or_grep);
    Perlito5::Grammar::Precedence::add_term('grep' => \&term_map_or_grep);
    Perlito5::Grammar::Precedence::add_term('sort' => \&term_sort);
    1
}
;1
