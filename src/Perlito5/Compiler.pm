package Perlito5::Compiler;
use strict;
use warnings;

use Perlito5::Match;
use Perlito5::Grammar;
use Perlito5::Grammar::Control;
use Perlito5::Grammar::Precedence;
use Perlito5::Grammar::Expression;
use Perlito5::Macro;
use Perlito5::Runtime;

1;

__END__

=head1 NAME

Perlito5::Compiler - Perl 5 compiler for Perlito5

=head1 SYNOPSIS

    use Perlito5::Compiler;
    use Perlito5::Javascript2::Emitter;
    use Perlito5::Javascript2::Runtime;

    my $perl5_source = ' print "hello, World!\n" ';
    $Perlito5::PKG_NAME = 'main';
    $Perlito5::PROTO    = {};
    my $ast = Perlito5::Grammar::exp_stmts($perl5_source, 0);
    my $js_source = Perlito5::AST::CompUnit::emit_javascript2_program(
        [
            Perlito5::AST::CompUnit->new( name => 'main', body => Perlito5::Match::flat($ast) )
        ]
    );

=head1 DESCRIPTION

This module loads the tools to transform Perl 5 source code into a syntax tree.

=head1 AUTHORS

Flavio Soibelmann Glock <fglock@gmail.com>.

=head1 COPYRIGHT

Copyright 2015 by Flavio Soibelmann Glock.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut

