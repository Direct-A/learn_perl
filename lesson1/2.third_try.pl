#! /usr/bin/env perl
use strict;
use warnings;
use diagnostics;

use feature "say";
use feature "switch";

my $string = "I MAST HAVE TO FVCK U FVCK PERL!!!";
say "1. ", length $string;
$string = "I MAST HAVE TO FVCK U FVCK PERL!!!" . "FVCK FVCK";
say "2. ", length $string;
say "3. ", index $string, "FVCK";
say "4. ", rindex $string, "FVCK";
say "5. ", rindex $string, "V";
say "6. ", substr $string, 22, 4;

my $FVCK = "fVCk";
say "7. before chop: ", $FVCK;
chop $FVCK;
say "7. after chop: ", $FVCK;
my $FACK_WORD = "No newline\n";
say "7. before chomp: ",$FACK_WORD;
chomp $FACK_WORD;
say "7. after chomp: ",$FACK_WORD;

printf( "8. First charact: %s\n", chomp $string );
printf( "9. UPPERCASE: %s\n",     uc $FVCK );
printf( "10. lowercase: %s\n",    lc $FVCK );
printf( "11. Last charact: %s\n", ucfirst $FVCK );
