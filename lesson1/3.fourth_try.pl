#! /usr/bin/env perl
use strict;
use warnings;
use diagnostics;

use feature "say";
use feature "switch";
use feature "state";

=pod first line only

my $long_fvck = "a looooooooooooong fffffffffffvvvvvck!!";
say $long_fvck;

$long_fvck =~ s/fffffffffffvvvvvck/fvck/g;
say $long_fvck;

my $long_fvck_twice = "a looooooooooooong fffffffffffvvvvvck!!" x 2;
say $long_fvck_twice;

my @alpbeta = ( "a" .. "z" );
print join( ", ", @alpbeta ), "\n";

say $alpbeta[2];
# say $alpbeta[2]++;
say ++$alpbeta[2];

for ( my $i = 0 ; $i < 26; ++$i ) {
    say $alpbeta[$i];
}

dsfa

my @my_array = ( "test", "name", "age", 1514 );

for (@my_array) {
    say $_;
}

my $items = scalar @my_array;
say "items: ", $items;

my ( $test, $name, $age, $number ) = @my_array;
say $test;

say "pop: ", pop @my_array;
for (@my_array) {
    say $_;
}

say "push: ", push @my_array, 1314250;
for (@my_array) {
    say $_;
}

say "shift: ", shift @my_array;
say "unshift: ", unshift @my_array;
for (@my_array) {
    say $_;
}

say "splice: ", splice @my_array, 0, 1;
print join(", ", @my_array), "\n";
for (@my_array) {
    say $_;
}

my $string = "a bunch of words";
say $string;
my @string_array = split / /, $string;
for (@string_array) {
    say $_;
}

@string_array = split / o/, $string;
say join "|", @string_array;
say join "|", reverse @string_array;
say join "|", sort @string_array;

sub get_sum {
    my ( $num1, $num2 ) = @_;
    $num1 ||= 1;
    $num2 ||= 1;
    return $num1 + $num2;
}

say get_sum( 1, 2 );
say get_sum( 5, 2 );

my $str = "\QWelcome to IT's family\E no slash now.";
$str = "R\LT";
my @array = (1..10);
my $size = @array;
my $max_index = $#array;

say @array;
say $size;
say $max_index;
say $array[1];

shift @array;
say @array;
say $array[1];

say @array;
my $new_one = unshift @array, "a", "b", "c";
say $new_one;
say $array[2];
pop @array;
say @array;
shift @array;
say @array;

my @list = (1, 2, 3, 4, 5);

foreach $a (@list){
    print "a = $a\n";
    last if $a == 4;
}
sub try{
    state %a = (
        "name" => "FVCK",
        "age" => 16
    );
    say $a{"age"};
}

try()

my $FVCK = "fvck";
my @new_FVCK = (1, 12);
my $ref_fvck = \$FVCK;

say "ref_FVCK is: ", $ref_fvck;
say "type of ref_FVCK is: ", ref($ref_fvck);
# my $ref_fvck = \@new_FVCK;
# say "befor unref of ref_FVCK: ", $ref_fvck;
say "unref of ref_FVCK: ", $$ref_fvck;
my $ref_fvck = \@new_FVCK;
say "after unref of ref_FVCK: ", @$ref_fvck;

my $name;
my $age;
my $salary;

format EMPLOYEE =
===================================
@<<<<<<<<<<<<<<<<<<<<<< @<<
$name, $age
@#####.##
$salary
===================================
.

format EMPLOYEE_TOP =
===================================
Name                    Age Page @<
                                 $%
===================================
.

select(STDOUT);

$~ = "EMPLOYEE";
$^ = "EMPLOYEE_TOP";
my @n = ( "Ali",   "it",    "Jaffer" );
my @a = ( 20,      30,      40 );
my @s = ( 2000.00, 2500.00, 4000.000 );
my $i = 0;

foreach (@n) {
    $name   = $_;
    $age    = $a[$i];
    $salary = $s[ $i++ ];
    write;
}

open( DATA,
    "</run/media/Data/OneDrive/On_Linux/bioinfo/learn_prel/lesson1/test.md" )
  or die "test.md open filed, $!";
# while (<DATA>) {
#     print $_;
# }

open( FILE, "</run/media/Data/OneDrive/On_Linux/bioinfo/learn_prel/lesson1/test.md" ) || die "Enable to open test file";
# Now check the poistion of read poiter.
my $position = tell( FILE );
print "Position with in file $position\n";
seek FILE, 4, 1;
$position = tell( FILE );
print "Position with in file $position\n";

my $FILE =
  "/run/media/Data/OneDrive/On_Linux/bioinfo/learn_prel/lesson1/test.md";
print -M $FILE;
close($FILE);

opendir( Dir, "/home/site" );
my @Files = readdir(Dir);
closedir(Dir);
foreach my $Cur (@Files) {
    my $File = "/home/globtest" . $Cur;
    open( IN, $File );
    while (<IN>) {
        # phrase
    }
    close(IN);
}
=cut

package Person;
sub new
{
    my $class = shift;
    my $self = {
        _firstName => shift,
        _lastName  => shift,
        _ssn       => shift,
    };
    print "f_name：$self->{_firstName}\n";
    print "l_name：$self->{_lastName}\n";
    print "code：$self->{_ssn}\n";
    bless $self, $class;
    return $self;
}

my $object = new Person( "Min", "Wang", 23234345);
