#!/usr/bin/perl
use 5.010;
use strict;
use warnings;
use File::Basename;
use Cwd qw();
use File::Spec::Functions 'catfile';
my $txt = 'C:\test\test.txt';
my $fn = basename $txt;
print "$fn\n";
#`"notepad $txt"`;
my $curdir = Cwd::abs_path(); 
my $expected  = 2;
my $result_file = catfile($curdir, 'scanfiles.txt'); 

# @result2files=();
open(my $testappresultfile, "<", $result_file) or die "Failed to open file: $!\n";
# while(<$testappresultfile>) 
# { 
    # chomp; 
    # my @words = split /\t/, $_;
    # #print "$words[1] vs $expected  $words[4]\n";
    # if($words[1] == $expected)
    # {
	# push @result2files, basename $words[4];
    # }
# } 
#my  @result2files =map { basename $_[4]} grep {$_[1] == $expected}  map {split /\t/,  $_} <$testappresultfile>;
#my  %result2files =   map { $_=> (my @arr = split /\t/, $_)}   <$testappresultfile>;
#my  %result2files =   map {$_,  $_}   <$testappresultfile>;
#my  @result2files = map {/(?:\d+\t2\t\d+\t\d+\.\d+\t).+/} <$testappresultfile>;
my  @result2files = map {/(?:\d+\t2\t\d+\t\d+\.\d+\t\/tmp\/samples\/)(.+)/} <$testappresultfile>;
close $testappresultfile;
 # foreac my ($k,$v) = each %result2files)
# {
	# my @words =    @result2files{$notexpectfile};
	# print   "$words[1]---\n$notexpectfile \n\n\n";
# }
 # foreach my $notexpectfile (keys %result2files)
# {
	# print $result2files{$notexpectfile};
	# #print $notexpectfile;
	# #my @words =    @{$result2files{$notexpectfile}};
	# #print   "$words[1]---\n$notexpectfile \n\n\n";
# }
# print   @result2files;
for my $notexpectfile (  @result2files)
{
	print   "$notexpectfile\n";
}
 
 
my @nums = qw(11 22 33 44);
my @sqrs = map {$_*$_} @nums;
print @sqrs;

my $sum = 0;
for(@nums)
{
	$sum+=$_;
}

my $ave = $sum / 4;
say "\$ave=$ave";

my @bigs = grep {$_ gt $ave} @nums;
say "\@bigs=@bigs";
print "Hello World!\n";
