#!/usr/bin/perl
use strict;
use warnings;

open(DATA, "<dictionary.txt") or die "Couldn't open file, $!";
my @dictionary = <DATA>;
chomp(@dictionary);
my $ctr = 0;
my $check = 0;
	print "Welcome to PASSWORD strength calculator!
In here we are about to calculate password strength
Follow the instructions below to begin:

1. Minimum length of 8 characters
2. Must contain at least one numeric character
3. Must contain at least one of the following non-alphabetic characters: @, #, \$, %, &, *, +, -, =
4. Must pass the dictionary check: should not contain at least 4 consecutive alphabetic characters
   (case insensitive, except for Proper Names) that are valid \"words\" in a standard dictionary

		
HAVE FUN!
		
		

";
foreach(@ARGV){  
$ctr = 0;
$check = 0;
print $_ . "\n";
my $arg = $_;
unless ($_ =~ /[\S]{8,}/) {print "\tMinimum of 8 characters needed\n";$ctr++;}
unless ($_ =~ /[0-9]+/) {print "\tMust contain at 1 numeric character\n";$ctr++;}
unless ($_ =~ /[\@#\$%&*+\-=]+/) {print "\tMust contain at 1 special character (@#\$%&*+-=)\n";$ctr++;}


print "\tWords found in dictionary: \n";
	
foreach(@dictionary){
    if ($arg =~ /$_/){ 
		if (length($_) >= 4) {print "\t  " . $_ . "\n"; $check = 1;}
   }
}
   
if ($check == 1) {$ctr++;}
else {print "\t   No words found in dictionary\n";}
my $percent = (100 - ($ctr/5)*100);
my $result = "";
if ($percent < 100){$result = "WEAK - $percent%";}
else {$result = "STRONG - 100% CONGRATS!";}
print "\nPassword strength: " . $result . "\n\n\n";
}