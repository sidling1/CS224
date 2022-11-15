#!/usr/bin/perl

#opens the file and reads the input
open my $fh, '<', "input.txt" or die $!;
while (<$fh>) {
    $word = $_;
}
close $fh or die $!;

#ARGV is the predefined array in perl which stores arguments from the command line
$count = $ARGV[0];
$length = $ARGV[1];
$ans = ""; #initialize answer as an empty string

$upper_limit = length($word); #this is the upper limit of the random number deciding the index of the character. 
@letter_array = split("",$word); #splitting the input into characters and storing them in an array

$ran_letter = int(rand($upper_limit)); #this generates a random number to decide the index of the character to use , it is exculsive of the upper limit.
$random_char = $letter_array[$ran_letter]; #this is the character at that random location

$ran_count = int(rand($count-1))+1; #this generates a random number deciding how many repitions of the character we have to do with at least 1 repetition of each random letter.

#running the loop of random string generator till the length of the answer is equal to the max length given
while(length($ans) != $length)
{
    #repeating the random number generation in each loop
    $ran_letter = int(rand($upper_limit)); 
    $random_char = $letter_array[$ran_letter];
    $ran_count = int(rand($count-1))+1;

    if($letter_array[$ran_letter] eq $prev){next;} #checking if the previous random letter is equal to the current random letter , if yes than skip the rest of the loop since it may increase the count of repetitons in a substring.
    $prev = $random_char; #setting the previous to the current letter

    for($i=0;$i<$ran_count;$i++)
    {
        if(length($ans)<$length) #adding to the string only if the length($ans) is less than the given length.
        {
        $ans = $ans.$random_char; # . represents concatenation of two strings
        } 
    }
    
}
print "\n$ans\n";