#! /usr/bin/env perl
use strict;
use warnings;
use diagnostics;

use feature "say";
use feature "switch";

my $i = 10;

while ( $i > 1 ) {
    if ( $i % 2 == 0 ) {
        say $i;
        $i--;
        next;
    }
    if ( $i == 3 ) {
        last;
    }
    $i--;
}

do {
    say $i;
    $i++;
} while ( $i < 10 );

# given / when
my $x;
given ($x) {
    when ($_) { }
    when ($_) { }
    when ($_) { }
    default   { }
}
