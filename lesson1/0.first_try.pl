#! /usr/bin/env perl
use strict;
use warnings;
use diagnostics;

use feature "say";
use feature "switch";

print "WTF?!\n";
say "WTF?!";

my $var = "FVCK";
my ( $var1, $var2 ) = ( "FVCK", "YOU" );

say $var;
say $var1, " ", $var2;

my $var3 = <<"END";
multi line
FVCK
THIS
MULTI
LINE
!!!!
END

say $var3;

my $varn = 18446744073709551615;
my $varf = .1000000000000001;
$varn = $varn + 1;

printf( "%d \n", $varn );
printf( "%u \n", $varn );
printf( "%f \n", $varn );
printf( "%e \n", $varn );
printf( "%s \n", $varn );

## printf("%c \n", $varn);

printf( "%.16f\n",       $varf );
printf( "%f - 1 = %f\n", $varf, $varf - 1 );
printf( "%f - 2 = %f\n", $varf, $varf - 2 );

printf( "varn: %.16f, varf: %u", $varn, $varf );

say "5 + 4 = ",  5 + 4;
say "5 - 4 = ",  5 - 4;
say "5 * 4 = ",  5 * 4;
say "5 / 4 = ",  5 / 4;
say "7 % 3 = ",  7 % 3;
say "2 ** 4 = ", 2**4;

say "EXP 0 = ", exp 0;
say "EXP 1 = ", exp 1;
say "EXP 2 = ", exp 2;
say "EXP 5 = ", exp 5;

say "HEX 10 = ", hex 10;
say "OCT 10",    oct 10;

say "INT 6.45 = ", int(6.45);
say "INT 6.55 = ", int(6.55);

say "LOG 2 = ",   log 2;
say "LOG 1 = ",   log 1;
say "LOG 4 = ",   log 4;
say "LOG e^5 = ", log exp 5;

say "Random 0~10", int( rand 11 );

say "SQRT 9 = ",    sqrt 9;
say "SQRT 1024 = ", sqrt 1024;

my $num = 7;
say "7 += 1 ", $num += 1;

# ?????
say "++7 = ",  ++$num;
say "++ 7 = ", ++$num;
say "7++ = ",  $num++;
say "7 ++ = ", $num++;
say "7 -= 1 ", $num -= 1;
say "--7 = ",  --$num;
say "-- 7 = ", --$num;
say "--7 = ",  --$num;
say "--7 = ",  --$num;
say "7-- = ",  $num--;
say "7 -- = ", $num--;

say "7 /= 2 ", $num /= 2;

# ?????
say "7 *= 2 ", $num *= 2;
say "7 %= 3 ", $num %= 3;

say "undef == 0 : ", undef == 0;
say "undef != 1 : ", undef != 1;

if ( 1 > "" ) {
    say "1 > \"\", it's TRUE";
}

if ( 1 > 0 ) {
    say "1 > 0, it's TRUE";
}

if ( 1 > 0.0 ) {
    say "1 > 0.0, it's TRUE";
}

if ( 1 > 0.0 && "" < 1 ) {
    say "1 > 0.0 && \"\" < 1, it's TRUE";
}

unless ( 1 < 0.0 && "" > 1 ) {
    say "1 < 0.0 && \"\" > 1, it's FALSE";
    say "FVCK U unless!?";
}

if ( 1 > 0.0 || "" > 1 ) {
    say "1 > 0.0 || \"\" > 1, ONE of this is TRUE";
}

say( ( 1 >= 0 ) ? "1 >= 0, it's TRUE" : "just FALSE" );

# eq ne lt le gt ge

for ( my $i = 1 ; $i < 10 ; ++$i ) {
    print( $i, " " );
}
