# Do not edit this file - Generated by Perlito5 9.017

{
    package main;
    package Perlito5::Grammar::Block;
    use Perlito5::Grammar::Expression;
    use Perlito5::Grammar::Scope;
    use strict;
    our %Named_block = ('BEGIN' => 1, 'UNITCHECK' => 1, 'CHECK' => 1, 'INIT' => 1, 'END' => 1, 'AUTOLOAD' => 1, 'DESTROY' => 1);
    sub Perlito5::Grammar::Block::block {
        my $str = $_[0];
        my $pos = $_[1];
        my $m = Perlito5::Grammar::Space::opt_ws($str, $pos);
        $pos = $m->{'to'};
        if (substr($str, $pos, 1) ne '{') {
            return 
        }
        $pos++;
        Perlito5::Grammar::Scope::check_variable_declarations();
        Perlito5::Grammar::Scope::create_new_compile_time_scope();
        $m = Perlito5::Grammar::exp_stmts($str, $pos);
        if (!$m) {
            Perlito5::Compiler::error('syntax error')
        }
        $pos = $m->{'to'};
        my $capture = Perlito5::Match::flat($m);
        $m = Perlito5::Grammar::Space::opt_ws($str, $pos);
        $pos = $m->{'to'};
        if (substr($str, $pos, 1) ne '}') {
            Perlito5::Compiler::error('syntax error')
        }
        $m->{'to'} = $pos + 1;
        $m->{'capture'} = Perlito5::AST::Block::->new('stmts' => $capture, 'sig' => undef);
        Perlito5::Grammar::Scope::end_compile_time_scope();
        return $m
    }
    sub Perlito5::Grammar::Block::eval_end_block {
        my($block, $phase) = @_;
        local ${'@'};
        my @data = $block->emit_perl5();
        my $out = [];
        Perlito5::Perl5::PrettyPrinter::pretty_print(\@data, 0, $out);
        my $code = 'package ' . $Perlito5::PKG_NAME . ';' . chr(10) . 'sub ' . join('', @{$out}) . chr(10);
        eval(Perlito5::CompileTime::Dumper::generate_eval_string($code)) or Perlito5::Compiler::error('Error in ' . $phase . ' block: ' . ${'@'})
    }
    sub Perlito5::Grammar::Block::eval_begin_block {
        my $block = shift;
        local ${'@'};
        my @data = $block->emit_perl5();
        my $out = [];
        Perlito5::Perl5::PrettyPrinter::pretty_print(\@data, 0, $out);
        my $code = 'package ' . $Perlito5::PKG_NAME . ';' . chr(10) . join('', @{$out}) . '; 1' . chr(10);
        local ${chr(7) . 'LOBAL_PHASE'};
        Perlito5::set_global_phase('BEGIN');
        eval(Perlito5::CompileTime::Dumper::generate_eval_string($code)) or Perlito5::Compiler::error('Error in BEGIN block: ' . ${'@'})
    }
    sub Perlito5::Grammar::Block::opt_continue_block {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
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
                }) && ('continue' eq substr($str, $MATCH->{'to'}, 8) && ($MATCH->{'to'} = 8 + $MATCH->{'to'})) && (do {
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
                    $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'block'});
                    $MATCH->{'capture'}->{'is_continue'} = 1;
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (do {
                    $MATCH->{'capture'} = Perlito5::AST::Block::->new('stmts' => [], 'sig' => undef);
                    1
                })
            })
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Block::anon_block {
        my $str = $_[0];
        my $pos = $_[1];
        my $p = $pos;
        local $Perlito5::BLOCK_HAS_SEMICOLON;
        my $m = Perlito5::Grammar::block($str, $p);
        !$m && return ;
        $p = $m->{'to'};
        my $block = Perlito5::Match::flat($m);
        $m = Perlito5::Grammar::opt_continue_block($str, $p);
        $p = $m->{'to'};
        my $continue = Perlito5::Match::flat($m);
        my $v = $block;
        !$continue->{'is_continue'} && !$Perlito5::BLOCK_HAS_SEMICOLON && ($v = Perlito5::Grammar::Expression::block_or_hash($v));
        $m->{'capture'} = $v;
        if ($continue->{'is_continue'}) {
            $m->{'capture'}->{'continue'} = $continue
        }
        return $m
    }
    sub Perlito5::Grammar::Block::ast_undef {
        Perlito5::AST::Apply::->new('code' => 'undef', 'namespace' => '', 'arguments' => [])
    }
    sub Perlito5::Grammar::Block::special_named_block {
        my $str = $_[0];
        my $pos = $_[1];
        my $p = $pos;
        my $block_name;
        my $m_name = Perlito5::Grammar::ident($str, $p);
        !$m_name && return ;
        $p = $m_name->{'to'};
        $block_name = Perlito5::Match::flat($m_name);
        my $ws = Perlito5::Grammar::Space::opt_ws($str, $p);
        $p = $ws->{'to'};
        my $block_start = $p;
        my $m = Perlito5::Grammar::block($str, $p);
        !$m && return ;
        $p = $m->{'to'};
        my $block = Perlito5::Match::flat($m);
        my $compile_block = $Perlito5::SCOPE->{'block'}->[-1];
        $compile_block->{'type'} = 'sub';
        $compile_block->{'name'} = $block_name;
        if ($block_name eq 'INIT') {
            push(@Perlito5::INIT_BLOCK, eval_end_block($block, 'INIT'));
            $m->{'capture'} = ast_undef()
        }
        elsif ($block_name eq 'END') {
            unshift(@Perlito5::END_BLOCK, eval_end_block($block, 'END'));
            $m->{'capture'} = ast_undef()
        }
        elsif ($block_name eq 'CHECK') {
            unshift(@Perlito5::CHECK_BLOCK, eval_end_block($block, 'CHECK'));
            $m->{'capture'} = ast_undef()
        }
        elsif ($block_name eq 'UNITCHECK') {
            unshift(@Perlito5::UNITCHECK_BLOCK, eval_end_block($block, 'UNITCHECK'));
            $m->{'capture'} = ast_undef()
        }
        elsif ($block_name eq 'BEGIN') {
            local $Perlito5::PHASE = 'BEGIN';
            eval_begin_block($block);
            $m->{'capture'} = ast_undef()
        }
        elsif ($block_name eq 'AUTOLOAD' || $block_name eq 'DESTROY') {
            $m->{'capture'} = Perlito5::AST::Sub::->new('attributes' => [], 'block' => $block, 'name' => $block_name, 'namespace' => $Perlito5::PKG_NAME, 'sig' => undef)
        }
        else {
            $m->{'capture'} = $block;
            $m->{'capture'}->{'name'} = $block_name
        }
        return $m
    }
    sub Perlito5::Grammar::Block::named_sub_def {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $m2 = Perlito5::Grammar::optional_namespace_before_ident($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'Perlito5::Grammar::optional_namespace_before_ident'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $m2 = Perlito5::Grammar::ident($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'Perlito5::Grammar::ident'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            my $m2 = Perlito5::Grammar::Block::prototype_($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'Perlito5::Grammar::Block::prototype_'} = $m2;
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
            my $m2 = Perlito5::Grammar::Attribute::opt_attribute($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'Perlito5::Grammar::Attribute::opt_attribute'} = $m2;
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
                    $MATCH->{'_tmp'} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::block'});
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    my $m2 = Perlito5::Grammar::Statement::statement_parse($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    Perlito5::Compiler::error('Illegal declaration of subroutine ' . chr(39), Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::ident'}), chr(39));
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (do {
                    $MATCH->{'_tmp'} = undef;
                    1
                })
            })
        }) && (do {
            my $name = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::ident'});
            my $sig = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Block::prototype_'});
            $sig eq '*undef*' && ($sig = undef);
            my $attributes = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Attribute::opt_attribute'});
            my($proto) = grep {
                $_->[0] eq 'prototype'
            } @{$attributes};
            if ($proto) {
                $attributes = [grep {
                    $_->[0] ne 'prototype'
                } @{$attributes}];
                $sig = $proto->[1]
            }
            my $namespace = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::optional_namespace_before_ident'});
            if ($name) {
                if (!$namespace) {
                    $namespace = $name eq '_' ? 'main' : $Perlito5::PKG_NAME
                }
                my $full_name = $namespace . '::' . $name;
                $Perlito5::PROTO->{$full_name} = $sig;
                if ($MATCH->{'_tmp'}) {
                    my $block = $Perlito5::SCOPE->{'block'}->[-1];
                    $block->{'type'} = 'sub';
                    $block->{'name'} = $full_name
                }
            }
            my $sub = Perlito5::AST::Sub::->new('name' => $name, 'namespace' => $namespace, 'sig' => $sig, 'block' => $MATCH->{'_tmp'}, 'attributes' => $attributes);
            if ($ENV{'PERLITO5DEV'}) {
                if ($name) {
                    my $full_name = $namespace . '::' . $name;
                    $Perlito5::GLOBAL->{$full_name} = $sub;
                    $sub = Perlito5::AST::Apply::->new('code' => 'undef', 'namespace' => '', 'arguments' => [])
                }
            }
            $MATCH->{'capture'} = $sub;
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Block::named_sub {
        my $str = $_[0];
        my $pos = $_[1];
        substr($str, $pos, 3) eq 'sub' || return ;
        my $ws = Perlito5::Grammar::Space::ws($str, $pos + 3);
        $ws || return ;
        my $p = $ws->{'to'};
        my $m_name = Perlito5::Grammar::ident($str, $p);
        $m_name || return ;
        my $block_name = Perlito5::Match::flat($m_name);
        if (exists($Named_block{$block_name})) {
            return Perlito5::Grammar::Block::special_named_block($str, $p)
        }
        return Perlito5::Grammar::Block::named_sub_def($str, $p)
    }
    sub Perlito5::Grammar::Block::term_anon_sub {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((('sub' eq substr($str, $MATCH->{'to'}, 3) && ($MATCH->{'to'} = 3 + $MATCH->{'to'})) && (do {
            my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                1
            }
            else {
                0
            }
        }) && (do {
            my $m2 = Perlito5::Grammar::Block::anon_sub_def($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'Perlito5::Grammar::Block::anon_sub_def'} = $m2;
                1
            }
            else {
                0
            }
        }) && (do {
            $MATCH->{'capture'} = ['term', Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Block::anon_sub_def'})];
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Block::term_do {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((('do' eq substr($str, $MATCH->{'to'}, 2) && ($MATCH->{'to'} = 2 + $MATCH->{'to'})) && (do {
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
            $MATCH->{'capture'} = ['term', Perlito5::AST::Apply::->new('code' => 'do', 'arguments' => [Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::block'})])];
            1
        })));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Block::args_sig {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
            my $last_match_null = 0;
            my $m = $MATCH;
            my $to = $MATCH->{'to'};
            while ((do {
                my $pos1 = $MATCH->{'to'};
                (do {
                    (';' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                }) || (do {
                    $MATCH->{'to'} = $pos1;
                    (chr(92) eq substr($str, $MATCH->{'to'}, 2) && ($MATCH->{'to'} = 2 + $MATCH->{'to'}))
                }) || (do {
                    $MATCH->{'to'} = $pos1;
                    ('[' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                }) || (do {
                    $MATCH->{'to'} = $pos1;
                    (']' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                }) || (do {
                    $MATCH->{'to'} = $pos1;
                    ('*' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                }) || (do {
                    $MATCH->{'to'} = $pos1;
                    ('+' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                }) || (do {
                    $MATCH->{'to'} = $pos1;
                    ('@' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                }) || (do {
                    $MATCH->{'to'} = $pos1;
                    ('%' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                }) || (do {
                    $MATCH->{'to'} = $pos1;
                    ('$' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
                }) || (do {
                    $MATCH->{'to'} = $pos1;
                    ('&' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'}))
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
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Block::prototype_ {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
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
                }) && ('(' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && ('_' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && (')' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    $MATCH->{'capture'} = '_';
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
                    my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    my $m2 = args_sig($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'args_sig'} = $m2;
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
                }) && (')' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    $MATCH->{'capture'} = '' . Perlito5::Match::flat($MATCH->{'args_sig'});
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (do {
                    $MATCH->{'capture'} = '*undef*';
                    1
                })
            })
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Block::anon_sub_def {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = (((do {
            my $m2 = prototype_($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'prototype_'} = $m2;
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
            my $m2 = Perlito5::Grammar::Attribute::opt_attribute($str, $MATCH->{'to'});
            if ($m2) {
                $MATCH->{'to'} = $m2->{'to'};
                $MATCH->{'Perlito5::Grammar::Attribute::opt_attribute'} = $m2;
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
            my $sig = Perlito5::Match::flat($MATCH->{'prototype_'});
            $sig eq '*undef*' && ($sig = undef);
            my $attributes = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Attribute::opt_attribute'});
            my($proto) = grep {
                $_->[0] eq 'prototype'
            } @{$attributes};
            if ($proto) {
                $attributes = [grep {
                    $_->[0] ne 'prototype'
                } @{$attributes}];
                $sig = $proto->[1]
            }
            $MATCH->{'capture'} = Perlito5::AST::Sub::->new('name' => undef, 'namespace' => undef, 'sig' => $sig, 'block' => Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::block'}), 'attributes' => $attributes);
            1
        })));
        $tmp ? $MATCH : 0
    }
    Perlito5::Grammar::Precedence::add_term('do' => \&term_do);
    Perlito5::Grammar::Precedence::add_term('sub' => \&term_anon_sub);
    Perlito5::Grammar::Statement::add_statement('{' => \&anon_block);
    Perlito5::Grammar::Statement::add_statement('sub' => \&named_sub);
    Perlito5::Grammar::Statement::add_statement($_ => \&special_named_block)
        for keys(%Named_block);
    1
}
;1
