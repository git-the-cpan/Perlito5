use strict;
use feature 'say';

print "1..12\n";

sub foo {
    my $num = shift;
    my $expected = shift;
    my $result = wantarray ? "LIST" : defined wantarray ? "SCALAR" : "VOID";
    print "not " if $result ne $expected;
    say "ok $num # expected: $expected got: $result";
}

my $x;
my @x;

foo( 1, "SCALAR" ) or 1;
0 or foo( 2, "VOID" );

$x = foo( 3, "SCALAR" ) || 1;
$x = 0 || foo( 4, "SCALAR" );

@x = foo( 5, "SCALAR" ) || 1;
@x = 0 || foo( 6, "LIST" );

foo( 7, "SCALAR" ) and 1;
1 and foo( 8, "VOID" );

$x = 1 && foo( 9, "SCALAR" );
$x = foo( 10, "SCALAR" ) && 1;

@x = 1 && foo( 11, "LIST" );
@x = foo( 12, "SCALAR" ) && 1;

