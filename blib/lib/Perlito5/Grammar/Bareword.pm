# Do not edit this file - Generated by Perlito5 9.0
{
    package main;
    package Perlito5::Grammar::Bareword;
    use strict;
    sub Perlito5::Grammar::Bareword::the_object {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
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
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Sigil::term_sigil'})->[1];
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                (('{' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    my $m2 = Perlito5::Grammar::Expression::curly_parse($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'Perlito5::Grammar::Expression::curly_parse'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && ('}' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::curly_parse'});
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    my $m2 = Perlito5::Grammar::Print::typeglob($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'Perlito5::Grammar::Print::typeglob'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Print::typeglob'});
                    1
                }))
            })
        }));
        $tmp ? $MATCH : 0
    }
    sub Perlito5::Grammar::Bareword::term_bareword {
        my $str = $_[0];
        my $pos = $_[1];
        my $p = $pos;
        my $m_namespace = Perlito5::Grammar::optional_namespace_before_ident($str, $p);
        my $namespace = Perlito5::Match::flat($m_namespace);
        $p = $m_namespace->{'to'};
        my $m_name = Perlito5::Grammar::ident($str, $p);
        if (!$m_name) {
            if ($namespace) {
                $m_namespace->{'capture'} = ['term', Perlito5::AST::Var::->new('sigil' => '::', 'name' => '', 'namespace' => $namespace)];
                return $m_namespace
            }
            return 
        }
        my $name = Perlito5::Match::flat($m_name);
        $p = $m_name->{'to'};
        if (substr($str, $p, 2) eq '::') {
            $m_name->{'to'} = $p + 2;
            $m_name->{'capture'} = ['term', Perlito5::AST::Var::->new('sigil' => '::', 'name' => '', 'namespace' => $namespace . '::' . $name)];
            return $m_name
        }
        my $full_name = $name;
        $namespace && ($full_name = $namespace . '::' . $name);
        my $m = Perlito5::Grammar::Space::ws($str, $p);
        if ($m) {
            $p = $m->{'to'}
        }
        my $invocant;
        my $is_subroutine_name;
        my $effective_name = ($namespace || $Perlito5::PKG_NAME) . '::' . $name;
        {
            my $p = eval {
                prototype($effective_name)
            };
            $p && ($Perlito5::PROTO->{$effective_name} = $p)
        }
        if (exists($Perlito5::Grammar::Print::Print{$name})) {
            $invocant = undef
        }
        elsif (exists($Perlito5::PROTO->{$effective_name}) || ((!$namespace || $namespace eq 'CORE') && exists($Perlito5::CORE_PROTO->{'CORE::' . $name}))) {
            $is_subroutine_name = 1;
            $invocant = Perlito5::Grammar::full_ident($str, $p);
            my $package = Perlito5::Match::flat($invocant);
            if ($package) {
                $invocant->{'capture'} = Perlito5::AST::Var::->new('sigil' => '::', 'name' => '', 'namespace' => $package);
                if (substr($str, $invocant->{'to'}, 2) eq '::') {
                    $invocant->{'to'} = $invocant->{'to'} + 2
                }
                elsif (!$Perlito5::PACKAGES->{$package}) {
                    $invocant = undef
                }
            }
        }
        else {
            $invocant = Perlito5::Grammar::Bareword::the_object($str, $p)
        }
        if ($invocant) {
            $p = $invocant->{'to'};
            my $arg = [];
            $m = Perlito5::Grammar::Space::ws($str, $p);
            $m && ($p = $m->{'to'});
            if (substr($str, $p, 2) eq '->') {}
            elsif (substr($str, $p, 1) eq '(') {
                my $m = Perlito5::Grammar::Expression::term_paren($str, $p);
                if ($m) {
                    $arg = $m->{'capture'}->[2];
                    $p = $m->{'to'};
                    $arg = Perlito5::Grammar::Expression::expand_list($arg)
                }
            }
            else {
                my $m = Perlito5::Grammar::Expression::list_parse($str, $p);
                if ($m->{'capture'} ne '*undef*') {
                    $arg = Perlito5::Grammar::Expression::expand_list($m->{'capture'});
                    $p = $m->{'to'}
                }
            }
            $m_name->{'capture'} = ['term', Perlito5::AST::Call::->new('method' => $full_name, 'invocant' => Perlito5::Match::flat($invocant), 'arguments' => $arg)];
            $m_name->{'to'} = $p;
            return $m_name
        }
        if (substr($str, $p, 2) eq '=>') {
            $m_name->{'capture'} = ['term', Perlito5::AST::Apply::->new('code' => $name, 'namespace' => $namespace, 'arguments' => [], 'bareword' => 1)];
            $m_name->{'to'} = $p;
            return $m_name
        }
        if (substr($str, $p, 2) eq '->') {
            if ($is_subroutine_name) {
                $m_name->{'capture'} = ['term', Perlito5::AST::Apply::->new('arguments' => [], 'code' => $name, 'namespace' => $namespace)]
            }
            else {
                $m_name->{'capture'} = ['term', Perlito5::AST::Var::->new('name' => '', 'namespace' => $full_name, 'sigil' => '::')]
            }
            $m_name->{'to'} = $p;
            return $m_name
        }
        my $sig;
        if (exists($Perlito5::PROTO->{$effective_name})) {
            $sig = $Perlito5::PROTO->{$effective_name}
        }
        elsif ((!$namespace || $namespace eq 'CORE') && exists($Perlito5::CORE_PROTO->{'CORE::' . $name})) {
            $effective_name = 'CORE::' . $name;
            $sig = $Perlito5::CORE_PROTO->{$effective_name}
        }
        else {
            my $m = Perlito5::Grammar::Number::val_version($str, $pos);
            if ($m) {
                $m->{'capture'} = ['term', $m->{'capture'}];
                return $m
            }
            $sig = undef
        }
        my $has_paren = 0;
        if (defined($sig)) {
            my $arg_index = 1;
            my $optional = 0;
            my @args;
            my $sig_part = substr($sig, 0, 1);
            my $m;
            my $capture;
            if ($sig_part eq '&') {
                $m = Perlito5::Grammar::Space::ws($str, $p);
                $m && ($p = $m->{'to'});
                if (substr($str, $p, 1) ne '(') {
                    $sig = substr($sig, 1);
                    $m = Perlito5::Grammar::Bareword::prototype_is_ampersand($str, $p);
                    $m && ($capture = $m->{'capture'});
                    if (!$m) {
                        die('Type of arg ' . $arg_index . ' to ' . $name . ' must be block or sub {}')
                    }
                    $p = $m->{'to'};
                    push(@args, $capture)
                }
            }
            if (substr($sig, 0, 1) eq ';' && substr($str, $p, 2) eq '//') {
                $m_name->{'capture'} = ['term', Perlito5::AST::Apply::->new('code' => $name, 'namespace' => $namespace, 'arguments' => [], 'bareword' => 1)];
                $m_name->{'to'} = $p;
                return $m_name
            }
            if ($sig eq '') {
                if (substr($str, $p, 1) eq '(') {
                    $p++;
                    $has_paren = 1;
                    my $m = Perlito5::Grammar::Space::ws($str, $p);
                    if ($m) {
                        $p = $m->{'to'}
                    }
                    if (substr($str, $p, 1) ne ')') {
                        die('syntax error near ', substr($str, $pos, 10))
                    }
                    $p++
                }
                if ($name eq '__FILE__') {
                    $m_name->{'capture'} = ['term', Perlito5::AST::Buf::->new('buf' => $Perlito5::FILE_NAME)]
                }
                elsif ($name eq '__LINE__') {
                    $m_name->{'capture'} = ['term', Perlito5::AST::Int::->new('int' => $Perlito5::LINE_NUMBER)]
                }
                else {
                    $m_name->{'capture'} = ['term', Perlito5::AST::Apply::->new('code' => $name, 'namespace' => $namespace, 'arguments' => \@args, 'bareword' => ($has_paren == 0))]
                }
                $m_name->{'to'} = $p;
                return $m_name
            }
            if ($sig eq '_' || $sig eq '$' || $sig eq ';$') {
                my $m;
                my $arg;
                if (substr($str, $p, 1) eq '(') {
                    $m = Perlito5::Grammar::Expression::term_paren($str, $p);
                    if (!$m) {
                        return $m
                    }
                    $p = $m->{'to'};
                    $has_paren = 1;
                    $arg = $m->{'capture'}->[2];
                    $arg = Perlito5::Grammar::Expression::expand_list($arg);
                    my $v = shift(@{$arg});
                    @{$arg} && die('Too many arguments for ' . $name);
                    $arg = $v
                }
                else {
                    $m = Perlito5::Grammar::Expression::argument_parse($str, $p);
                    $arg = $m->{'capture'};
                    if ($arg eq '*undef*') {
                        $arg = undef
                    }
                    elsif (ref($arg) eq 'Perlito5::AST::Apply' && $arg->{'code'} eq 'circumfix:<( )>') {
                        my $v = shift(@{$arg->{'arguments'}});
                        @{$arg->{'arguments'}} && die('Too many arguments for ' . $name);
                        $arg = $v
                    }
                }
                if (defined($arg)) {
                    push(@args, $arg);
                    $has_paren = 1
                }
                else {
                    $sig eq '$' && die('Not enough arguments for ' . $name);
                    $sig eq '_' && push(@args, Perlito5::AST::Var::->new('namespace' => '', 'name' => '_', 'sigil' => '$'))
                }
                my $ast = Perlito5::AST::Apply::->new('code' => $name, 'namespace' => $namespace, 'arguments' => \@args, 'bareword' => ($has_paren == 0));
                if ($name eq 'eval' && !$namespace) {
                    $ast->{'_scope'} = Perlito5::Grammar::Scope::get_snapshot()
                }
                $m->{'capture'} = ['term', $ast];
                return $m
            }
            if ($sig eq ';@') {
                if (substr($str, $p, 1) eq '(') {
                    $m = Perlito5::Grammar::Expression::term_paren($str, $p);
                    $has_paren = 1;
                    my $arg = $m->{'capture'}->[2];
                    $arg = Perlito5::Grammar::Expression::expand_list($arg);
                    push(@args, @{$arg})
                }
                else {
                    $m = Perlito5::Grammar::Expression::list_parse($str, $p);
                    my $arg = $m->{'capture'};
                    if ($arg ne '*undef*') {
                        $arg = Perlito5::Grammar::Expression::expand_list($arg);
                        push(@args, @{$arg})
                    }
                }
                my $ast = Perlito5::AST::Apply::->new('code' => $name, 'namespace' => $namespace, 'arguments' => \@args, 'bareword' => ($has_paren == 0));
                $m->{'capture'} = ['term', $ast];
                return $m
            }
            if ($sig eq '*') {}
        }
        if (substr($str, $p, 1) eq '(') {
            $m = Perlito5::Grammar::Expression::term_paren($str, $p);
            if (!$m) {
                return $m
            }
            my $arg = $m->{'capture'}->[2];
            $arg = Perlito5::Grammar::Expression::expand_list($arg);
            if ($namespace eq '' || $namespace eq 'CORE') {
                if ($name eq 'local' || $name eq 'my' || $name eq 'state' || $name eq 'our') {
                    my $declarator = $name;
                    for my $var (@{$arg}) {
                        if (ref($var) eq 'Perlito5::AST::Apply' && $var->{'code'} eq 'undef') {}
                        else {
                            my $decl = Perlito5::AST::Decl::->new('decl' => $declarator, 'type' => '', 'var' => $var, 'attributes' => []);
                            $var->{'_decl'} = $name;
                            $var->{'_id'} = $Perlito5::ID++;
                            $declarator eq 'our' && ($var->{'_namespace'} = $Perlito5::PKG_NAME);
                            $declarator eq 'local' && !$var->{'namespace'} && !$var->{'_namespace'} && ($var->{'_namespace'} = $Perlito5::PKG_NAME)
                        }
                    }
                }
                if ($name eq 'print' || $name eq 'say') {
                    if (@{$arg} == 0) {
                        push(@{$arg}, Perlito5::AST::Var::->new('namespace' => '', 'name' => '_', 'sigil' => '$'))
                    }
                }
                if ($name eq 'split') {
                    if (@{$arg} == 0) {
                        push(@{$arg}, Perlito5::AST::Buf::->new('buf' => ' '))
                    }
                    if (@{$arg} == 1) {
                        push(@{$arg}, Perlito5::AST::Var::->new('namespace' => '', 'name' => '_', 'sigil' => '$'))
                    }
                }
            }
            $m->{'capture'} = ['term', Perlito5::AST::Apply::->new('code' => $name, 'namespace' => $namespace, 'arguments' => $arg, 'proto' => $sig)];
            return $m
        }
        my $m_list = Perlito5::Grammar::Expression::list_parse($str, $p);
        my $list = $m_list->{'capture'};
        if ($list ne '*undef*') {
            $m_name->{'capture'} = ['postfix_or_term', 'funcall', $namespace, $name, $list];
            $m_name->{'to'} = $m_list->{'to'};
            return $m_name
        }
        if ($namespace eq '' || $namespace eq 'CORE') {
            if ($name eq 'print' || $name eq 'say') {
                $m_name->{'capture'} = ['term', Perlito5::AST::Apply::->new('code' => $name, 'namespace' => $namespace, 'arguments' => [Perlito5::AST::Var::->new('namespace' => '', 'name' => '_', 'sigil' => '$')])];
                return $m_name
            }
            if ($name eq 'split' && ($namespace eq '' || $namespace eq 'CORE')) {
                $m_name->{'capture'} = ['term', Perlito5::AST::Apply::->new('code' => $name, 'namespace' => $namespace, 'arguments' => [Perlito5::AST::Buf::->new('buf' => ' '), Perlito5::AST::Var::->new('namespace' => '', 'name' => '_', 'sigil' => '$')])];
                return $m_name
            }
        }
        $m_name->{'capture'} = ['postfix_or_term', 'funcall_no_params', $namespace, $name];
        return $m_name
    }
    sub Perlito5::Grammar::Bareword::prototype_is_ampersand {
        my $str = $_[0];
        my $pos = $_[1];
        my $MATCH = {'str' => $str, 'from' => $pos, 'to' => $pos};
        my $tmp = ((do {
            my $pos1 = $MATCH->{'to'};
            (do {
                (('sub' eq substr($str, $MATCH->{'to'}, 3) && ($MATCH->{'to'} = 3 + $MATCH->{'to'})) && (do {
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
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Block::anon_sub_def'});
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
                    $MATCH->{'capture'} = Perlito5::AST::Sub::->new('attributes' => [], 'block' => Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::block'}), 'name' => undef, 'namespace' => undef, 'sig' => undef);
                    1
                }))
            }) || (do {
                $MATCH->{'to'} = $pos1;
                ((do {
                    my $tmp = $MATCH;
                    $MATCH = {'str' => $str, 'from' => $tmp->{'to'}, 'to' => $tmp->{'to'}};
                    my $res = ((chr(92) eq substr($str, $MATCH->{'to'}, 2) && ($MATCH->{'to'} = 2 + $MATCH->{'to'})) && (do {
                        my $m2 = Perlito5::Grammar::Space::opt_ws($str, $MATCH->{'to'});
                        if ($m2) {
                            $MATCH->{'to'} = $m2->{'to'};
                            1
                        }
                        else {
                            0
                        }
                    }) && ('&' eq substr($str, $MATCH->{'to'}, 1) && ($MATCH->{'to'} = 1 + $MATCH->{'to'})));
                    $MATCH = $tmp;
                    $res ? 1 : 0
                }) && (do {
                    my $m2 = Perlito5::Grammar::Expression::argument_parse($str, $MATCH->{'to'});
                    if ($m2) {
                        $MATCH->{'to'} = $m2->{'to'};
                        $MATCH->{'Perlito5::Grammar::Expression::argument_parse'} = $m2;
                        1
                    }
                    else {
                        0
                    }
                }) && (do {
                    $MATCH->{'str'} = $str;
                    $MATCH->{'capture'} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Expression::argument_parse'});
                    1
                }))
            })
        }));
        $tmp ? $MATCH : 0
    }
    1
}
;1