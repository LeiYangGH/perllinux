#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
my $installedoutput = `rpm -qa`;
say '***********************';
say '***********************';

sub askyesno
{
  my $msg = $_[0];
  my $answer;
   until (defined $answer) 
   {
      say "\n$msg?\n";
      $_ = <>;
      $answer = 1 if /^Y/i;
      $answer = 0 if /^N/i;
   }
   $answer;
} 
my $notremoveshortnamesfile = '/home/leiyang/notremoveshortnames.txt';
my @arrnotremove=();open(NOTREMOVE, "<", $notremoveshortnamesfile) or die "Failed to open file: $!\n";
	while(my $line  = <NOTREMOVE>)
	{
		 chomp($line);
			push @arrnotremove, $line;
		 
	}
	close NOTREMOVE;
my %params = map { $_ => 1 } @arrnotremove;

my @packages = split /[\r\n]/, $installedoutput;

my %packagesizes = {};
my %packagedesc = {};
  foreach my $fullpackage (sort @packages)
 {
	#  
	if($fullpackage =~ /(\w+)-/)
	{
	 my $shortname = $1;
	 print '.';
	next if exists($params{$shortname}) ;
	 next if defined $packagesizes{$shortname};
	 my $querysizecmd = "rpm -qi $shortname";
	 # say "\$querysizecmd= $querysizecmd";
	 my $sizeoutput = `$querysizecmd`;
	 if($sizeoutput =~ /Size        : (\d+).+Description :(.+)/os)
	 {
	  $packagesizes{$shortname} = $1;
	   $packagedesc{$shortname} = $2;
	  }

	 }
}


open my $notremove, ">>", $notremoveshortnamesfile or die "Can't open $notremoveshortnamesfile\n";
foreach my $k (sort { $packagesizes{$b} <=> $packagesizes{$a} or $b cmp $a } keys %packagesizes) 
{
    # printf "%-8s %s\n", $name, $planets{$name};
    say "$k\t\t\t$packagesizes{$k}";
    say $packagedesc{$k};
   if (askyesno("Delete ???") == 1)
   {
      my $removecmd = "rpm -e $k";
      `$removecmd`;
   }
   else
   {
    say $notremove $k;
    }
}
close $notremove;
print "Hello World!\n";
