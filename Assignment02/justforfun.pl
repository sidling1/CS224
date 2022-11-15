#!/usr/bin/perl

open my $fh, '<', "input.txt" or die $!;
while (<$fh>) {
    $word = $_;
}
close $fh or die $!;


$count = $ARGV[0];
$length = $ARGV[1];
$ans = "";

$upper_limit = length($word);
@letter_array = split("",$word);

$ran_letter = int(rand($upper_limit));
$random_char = $letter_array[$ran_letter];
$count =0;
$ran_count = int(rand($count));
while($ans ne $word){
    $ans = "";
while(length($ans)<$length)
{
    $ran_letter = int(rand($upper_limit));
    $random_char = $letter_array[$ran_letter];
    $ran_count = int(rand($count-1))+1;

    if($letter_array[$ran_letter] eq $prev){next;}
    $prev = $random_char;

    for($i=0;$i<$ran_count;$i++)
    {
        if(length($ans)<$length){
        $ans = $ans.$random_char;    
    }}
    $count ++;
    print("$count\n");
}
if($count > 10000){last;}
}
print("\n$count");