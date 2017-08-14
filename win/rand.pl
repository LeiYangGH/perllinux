#!/usr/bin/perl
use 5.010;
use strict;
use warnings;
use List::Util qw(shuffle);
#use Digest::MD5;
use File::Copy;
use File::Basename;
#print md5_hex(read_file("scanfiles.txt")), "\n";
#my $digest = md5('abc');
my @a = qw(aa bb cc);
@a = shuffle(@a);
# foreach(@a)
# {
	# print "$_\n";
# }
my $src = 'src/';
my $des = 'des/';
#my %virus = ('fa'=>11,'fb'=>22,'fc'=>33,'fd'=>44);
my %virus = map{ basename ($_)=>-s $_} glob("$src*");
# while (my($k,$v)= each %virus)
# {
# print "k=$k,v=$v\n";	
# }

my @fnsrc=keys %virus;
foreach(@fnsrc)
{
 
	print "$_\n";
}
print;
my @fndes=shuffle(@fnsrc);
my %copy = map { $fnsrc[$_] => $fndes[$_] } 0..$#fndes;
# foreach(@fndes)
# {
	# print "$_\n";
# }
	while($_ = glob("$des*"))
	{
		next if -d $_;
		unlink($_) or warn("can't remove $_:$!");
	}
while (my($k,$v)= each %copy)
{
#print "k=$k,v=$virus{$k}\n";
print "k=$k,v=$v\n";
copy("$src/$k","$des$v") or die "copy failed: $!";

}
 
  my %reversecopy = reverse %copy;
 my %expected = map { $_ => $virus{$reversecopy{$_}} } @fnsrc;
 print ;while (my($k,$v)= each %expected)
{
#print "k=$k,v=$virus{$k}\n";
print "k=$k,v=$v\n";	
}
print "Hello World!\n";
