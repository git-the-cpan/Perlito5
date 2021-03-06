# Do not edit this file - Generated by Perlito5 9.017

{
    package main;
    package Perlito5::Grammar::Space;
    use Perlito5::Grammar::Precedence;
    my %line_index;
    sub Perlito5::Grammar::Space::count_line {
        my $pos = $_[0];
        $pos < $line_index{$Perlito5::FILE_NAME} && return ;
        $line_index{$Perlito5::FILE_NAME} = $pos + 1;
        $Perlito5::LINE_NUMBER++
    }
    my %space = ('#' => sub {
        my $m = Perlito5::Grammar::Space::to_eol($_[0], $_[1]);
        $m->{'to'}
    }, chr(9) => sub {
        $_[1]
    }, chr(10) => sub {
        my $str = $_[0];
        my $pos = $_[1];
        count_line($pos);
        substr($str, $pos, 1) eq chr(13) && $pos++;
        my $m = Perlito5::Grammar::Space::start_of_line($_[0], $pos);
        $m->{'to'}
    }, chr(12) => sub {
        $_[1]
    }, chr(13) => sub {
        my $str = $_[0];
        my $pos = $_[1];
        if (substr($str, $pos, 1) eq chr(10)) {
            count_line($pos);
            $pos++
        }
        my $m = Perlito5::Grammar::Space::start_of_line($_[0], $pos);
        $m->{'to'}
    }, chr(32) => sub {
        $_[1]
    });
    sub Perlito5::Grammar::Space::term_space {
        my $str = $_[0];
        my $pos = $_[1];
        my $p = $pos;
        while (exists($space{substr($str, $p, 1)})) {
            $p = $space{substr($str, $p, 1)}->($str, $p + 1)
        }
        (substr($str, $p, 7) eq '__END__' || substr($str, $p, 8) eq '__DATA__') && return term_end($str, $p);
        return {'str' => $str, 'from' => $pos, 'to' => $p, 'capture' => ['space', ' ']}
    }
    sub Perlito5::Grammar::Space::term_end {
        my $str = $_[0];
        my $p = $_[1];
        my $is_data = 0;
        if (substr($str, $_[1], 7) eq '__END__' && $Perlito5::PKG_NAME eq 'main') {
            $p = $p + 7;
            $is_data = 1
        }
        elsif (substr($str, $_[1], 8) eq '__DATA__') {
            $p = $p + 8;
            $is_data = 1
        }
        my $m = Perlito5::Grammar::Space::to_eol($str, $p);
        $p = $m->{'to'};
        if (substr($str, $p, 1) eq chr(10)) {
            count_line($p);
            $p++;
            substr($str, $p, 1) eq chr(13) && $p++
        }
        elsif (substr($str, $p, 1) eq chr(13)) {
            $p++;
            if (substr($str, $p, 1) eq chr(10)) {
                count_line($p);
                $p++
            }
        }
        if ($is_data) {
            $Perlito5::DATA_SECTION{$Perlito5::PKG_NAME} = substr($_[0], $p)
        }
        return {'str' => $str, 'from' => $_[1], 'to' => length($_[0]), 'capture' => ['space', ' ']}
    }
    Perlito5::Grammar::Precedence::add_term('#' => \&term_space);
    Perlito5::Grammar::Precedence::add_term(chr(9) => \&term_space);
    Perlito5::Grammar::Precedence::add_term(chr(10) => \&term_space);
    Perlito5::Grammar::Precedence::add_term(chr(12) => \&term_space);
    Perlito5::Grammar::Precedence::add_term(chr(13) => \&term_space);
    Perlito5::Grammar::Precedence::add_term(chr(32) => \&term_space);
    Perlito5::Grammar::Precedence::add_term('__END__' => \&term_end);
    Perlito5::Grammar::Precedence::add_term('__DATA__' => \&term_end);
    sub Perlito5::Grammar::Space::to_eol {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
            my $last_match_null = 0;
            my $m = $MATCH;
            my $to = $MATCH->{'to'};
            while (((do {
                my $tmp = $MATCH;
                $MATCH = {'from' => $tmp->{'to'}, 'to' => $tmp->{'to'}};
                my $res = (do {
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        (chr(10) eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        (chr(13) eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                    })
                });
                $MATCH = $tmp;
                $res ? 0 : 1
            }) && ('' ne substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))) && ($last_match_null < 2)) {
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
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Space::pod_pod_begin {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ((do {
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        (chr(10) eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        (chr(13) eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                    })
                }) && ('=cut' eq substr($str, $MATCH->{'to'}, 4) && ($MATCH->{'to'} = 4 + $MATCH->{'to'})) && (do {
                    my $m2 = to_eol($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (('' ne substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    my $m2 = to_eol($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    my $m2 = pod_pod_begin($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }))
            })
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Space::pod_begin {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
            my $pos1 = $MATCH->{'to'};
            (do {
                ((do {
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        (chr(10) eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        (chr(13) eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                    })
                }) && ('=end' eq substr($str, $MATCH->{'to'}, 4) && ($MATCH->{'to'} = 4 + $MATCH->{'to'})) && (do {
                    my $m2 = to_eol($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (('' ne substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    my $m2 = to_eol($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    my $m2 = pod_begin($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }))
            })
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Space::start_of_line {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $m2 = Perlito5::Grammar::String::here_doc($str, $MATCH->{'to'});
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
                (('=' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    my $pos1 = $MATCH->{'to'};
                    (do {
                        (('pod' eq substr($str, $MATCH->{'to'}, 3) && ($MATCH->{'to'} = 3 + $MATCH->{'to'})) && (do {
                            my $m2 = pod_pod_begin($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                1
                            }
                            else {
                                0
                            }
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        (('head' eq substr($str, $MATCH->{'to'}, 4) && ($MATCH->{'to'} = 4 + $MATCH->{'to'})) && (do {
                            my $m2 = pod_pod_begin($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                1
                            }
                            else {
                                0
                            }
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        (('begin' eq substr($str, $MATCH->{'to'}, 5) && ($MATCH->{'to'} = 5 + $MATCH->{'to'})) && (do {
                            my $m2 = pod_begin($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                1
                            }
                            else {
                                0
                            }
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        (('for' eq substr($str, $MATCH->{'to'}, 3) && ($MATCH->{'to'} = 3 + $MATCH->{'to'})) && (do {
                            my $m2 = pod_begin($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                1
                            }
                            else {
                                0
                            }
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        (('encoding' eq substr($str, $MATCH->{'to'}, 8) && ($MATCH->{'to'} = 8 + $MATCH->{'to'})) && (do {
                            my $m2 = to_eol($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                1
                            }
                            else {
                                0
                            }
                        }))
                    }) || (do {
                        $MATCH->{'to'} = $pos1;
                        (('cut' eq substr($str, $MATCH->{'to'}, 3) && ($MATCH->{'to'} = 3 + $MATCH->{'to'})) && (do {
                            my $m2 = to_eol($str, $MATCH->{'to'});
                            if ($m2) {
                                $MATCH->{'to'} = $m2->{'to'};
                                1
                            }
                            else {
                                0
                            }
                        }))
                    })
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (('#' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    my $last_match_null = 0;
                    my $m = $MATCH;
                    my $to = $MATCH->{'to'};
                    while ((do {
                        my $pos1 = $MATCH->{'to'};
                        (do {
                            (' ' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                        }) || (do {
                            $MATCH->{'to'} = $pos1;
                            (chr(9) eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
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
                }) && ('line' eq substr($str, $MATCH->{'to'}, 4) && ($MATCH->{'to'} = 4 + $MATCH->{'to'})) && (do {
                    my $last_match_null = 0;
                    my $m = $MATCH;
                    my $to = $MATCH->{'to'};
                    my $count = 0;
                    while ((do {
                        my $pos1 = $MATCH->{'to'};
                        (do {
                            (' ' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                        }) || (do {
                            $MATCH->{'to'} = $pos1;
                            (chr(9) eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
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
                }) && (do {
                    my $m2 = Perlito5::Grammar::Number::digits($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'Perlito5::Grammar::Number::digits'} = $m2;
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
                            (' ' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                        }) || (do {
                            $MATCH->{'to'} = $pos1;
                            (chr(9) eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
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
                    my $m2 = to_eol($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $Perlito5::LINE_NUMBER = 0 + Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Number::digits'});
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                1
            })
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Space::ws {
        my $str = shift;
        my $pos = shift;
        my $p = $pos;
        while (exists($space{substr($str, $p, 1)})) {
            $p = $space{substr($str, $p, 1)}->($str, $p + 1)
        }
        (substr($str, $p, 7) eq '__END__' || substr($str, $p, 8) eq '__DATA__') && return term_end($str, $p);
        if ($p == $pos) {
            return 0
        }
        return {'str' => $str, 'from' => $pos, 'to' => $p}
    }
    sub Perlito5::Grammar::Space::opt_ws {
        my $str = shift;
        my $pos = shift;
        my $p = $pos;
        while (exists($space{substr($str, $p, 1)})) {
            $p = $space{substr($str, $p, 1)}->($str, $p + 1)
        }
        (substr($str, $p, 7) eq '__END__' || substr($str, $p, 8) eq '__DATA__') && return term_end($str, $p);
        return {'str' => $str, 'from' => $pos, 'to' => $p}
    }
    1
}
;1
