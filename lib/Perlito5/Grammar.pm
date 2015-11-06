# Do not edit this file - Generated by Perlito5 9.011
{
    package main;
    package Perlito5::Grammar;
    use Perlito5::Grammar::Expression;
    use Perlito5::Grammar::Statement;
    use Perlito5::Grammar::Control;
    use Perlito5::Grammar::String;
    use Perlito5::Grammar::Sigil;
    use Perlito5::Grammar::Use;
    use Perlito5::Grammar::Block;
    use Perlito5::Grammar::Space;
    use Perlito5::Grammar::Print;
    use Perlito5::Grammar::Map;
    use Perlito5::Grammar::Attribute;
    use Perlito5::Grammar::Number;
    sub Perlito5::Grammar::word {
        substr($_[0], $_[1], 1) =~ m!\w! ? {'str' => $_[0], 'from' => $_[1], 'to' => $_[1] + 1} : 0
    }
    sub Perlito5::Grammar::ident {
        (substr($_[0], $_[1], 1) !~ m!\w! || substr($_[0], $_[1], 1) =~ m!\d!) && return ;
        my $m = {'str' => $_[0], 'from' => $_[1], 'to' => $_[1] + 1};
        $m->{'to'}++
            while substr($_[0], $m->{'to'}, 1) =~ m!\w!;
        $m
    }
    sub Perlito5::Grammar::caret_char {
        my $c = substr($_[0], $_[1], 1);
        my $pos = $_[1];
        if ($c eq '^') {
            $pos++;
            $c = substr($_[0], $pos, 1);
            ($c lt 'A' || $c gt 'Z') && return 0;
            $c = chr(ord($c) - ord('A') + 1)
        }
        elsif (Perlito5::Grammar::Space::ws($_[0], $pos)) {
            return 0
        }
        ($c lt chr(1) || $c gt chr(26)) && return 0;
        return {'str' => $_[0], 'from' => $_[1], 'to' => $pos + 1, 'capture' => $c}
    }
    sub Perlito5::Grammar::full_ident {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $m2 = ident($str, $MATCH->{'to'});
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
            while ((('::' eq substr($str, $MATCH->{'to'}, 2) && ($MATCH->{'to'} = 2 + $MATCH->{'to'})) && (do {
                my $m2 = ident($str, $MATCH->{'to'});
                if ($m2) {
                    $MATCH->{'to'} = $m2->{'to'};
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
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::namespace_before_ident {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $m2 = ident($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                1
            }
            else {
                0
            }
        }) && (do {
            my $tmp = $MATCH;
            $MATCH = {'str' => $str, 'from' => $tmp->{'to'}, 'to' => $tmp->{'to'}};
            my $res = ('::' eq substr($str, $MATCH->{'to'}, 2) && ($MATCH->{'to'} = 2 + $MATCH->{'to'}));
            $MATCH = $tmp;
            $res ? 1 : 0
        }) && (do {
            my $last_match_null = 0;
            my $m = $MATCH;
            my $to = $MATCH->{'to'};
            while ((('::' eq substr($str, $MATCH->{'to'}, 2) && ($MATCH->{'to'} = 2 + $MATCH->{'to'})) && (do {
                my $m2 = ident($str, $MATCH->{'to'});
                if ($m2) {
                    $MATCH->{'to'} = $m2->{'to'};
                    1
                }
                else {
                    0
                }
            }) && (do {
                my $tmp = $MATCH;
                $MATCH = {'str' => $str, 'from' => $tmp->{'to'}, 'to' => $tmp->{'to'}};
                my $res = ('::' eq substr($str, $MATCH->{'to'}, 2) && ($MATCH->{'to'} = 2 + $MATCH->{'to'}));
                $MATCH = $tmp;
                $res ? 1 : 0
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
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::optional_namespace_before_ident {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ((do {
                    my $m2 = namespace_before_ident($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'namespace_before_ident'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    my $last_match_null = 0;
                    my $m = $MATCH;
                    my $to = $MATCH->{'to'};
                    while (('::' eq substr($str, $MATCH->{'to'}, 2) && ($MATCH->{'to'} = 2 + $MATCH->{'to'})) && ($last_match_null < 2)) {
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
                    $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'namespace_before_ident'});
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (('::' eq substr($str, $MATCH->{'to'}, 2) && ($MATCH->{'to'} = 2 + $MATCH->{'to'})) && (do {
                    my $m2 = optional_namespace_before_ident($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'optional_namespace_before_ident'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $MATCH->{'str'} = $str;
                    my $name = Perlito5::Match::flat($MATCH->{'optional_namespace_before_ident'});
                    $MATCH->{'capture'} = 'main';
                    $name ne '' && ($MATCH->{'capture'} .= '::' . $name);
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (1 && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = '';
                    1
                }))
            })
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::exp_stmts2 {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $m2 = exp_stmts($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'exp_stmts'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            $MATCH->{'str'} = $str;
            $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'exp_stmts'});
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::exp {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
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
            $MATCH->{'str'} = $str;
            $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::exp_parse'});
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::exp2 {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
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
            $MATCH->{'str'} = $str;
            $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::exp_parse'});
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::opt_type {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ((do {
                    my $m = $MATCH;
                    if (!('::' eq substr($str, $MATCH->{'to'}, 2) && ($MATCH->{'to'} = 2 + $MATCH->{'to'}))) {
                        $MATCH = $m
                    }
                    1
                }) && (do {
                    my $m2 = full_ident($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'full_ident'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'full_ident'});
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (1 && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = '';
                    1
                }))
            })
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::var_sigil {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ('$' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ('%' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ('@' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ('&' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ('*' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
            })
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::var_name {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
            my $pos1 = $MATCH->{'to'};
            (do {
                (do {
                    my $m2 = full_ident($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'full_ident'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                })
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (do {
                    my $m2 = Perlito5::Grammar::Number::digits($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'Perlito5::Grammar::Number::digits'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                })
            })
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::var_ident {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $m2 = var_sigil($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'var_sigil'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $m2 = optional_namespace_before_ident($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'optional_namespace_before_ident'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $m2 = var_name($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'var_name'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            $MATCH->{'str'} = $str;
            $MATCH->{'capture'} = Perlito5::AST::Var::->new('sigil' => Perlito5::Match::flat($MATCH->{'var_sigil'}), 'namespace' => Perlito5::Match::flat($MATCH->{'optional_namespace_before_ident'}), 'name' => Perlito5::Match::flat($MATCH->{'var_name'}));
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::block {
        Perlito5::Grammar::Block::block(@_)
    }
    sub Perlito5::Grammar::block2 {
        Perlito5::Grammar::Block::block(@_)
    }
    sub Perlito5::Grammar::opt_continue_block {
        Perlito5::Grammar::Block::opt_continue_block(@_)
    }
    my @PKG;
    sub Perlito5::Grammar::exp_stmts {
        my $str = $_[0];
        my $pos = $_[1];
        push(@PKG, $Perlito5::PKG_NAME);
        my $has_semicolon;
        my @stmts;
        my $m = Perlito5::Grammar::Space::opt_ws($str, $pos);
        $pos = $m->{'to'};
        while ($m) {
            if (substr($str, $pos, 1) eq ';') {
                $has_semicolon = 1;
                $m = Perlito5::Grammar::Space::opt_ws($str, $pos + 1);
                $pos = $m->{'to'}
            }
            else {
                $m = Perlito5::Grammar::Statement::statement_parse($str, $pos);
                if ($m) {
                    push(@stmts, $m->{'capture'});
                    $pos = $m->{'to'};
                    if (substr($str, $pos, 1) eq ';') {
                        $has_semicolon = 1;
                        $pos = $pos + 1
                    }
                    $m = Perlito5::Grammar::Space::opt_ws($str, $pos);
                    $pos = $m->{'to'}
                }
            }
        }
        $Perlito5::PKG_NAME = pop(@PKG);
        $Perlito5::BLOCK_HAS_SEMICOLON ||= $has_semicolon;
        return {'str' => $str, 'to' => $pos, 'capture' => \@stmts}
    }
}
;1
