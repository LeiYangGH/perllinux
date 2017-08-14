#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use File::Spec::Functions 'catfile';
sub getlatestlogfilename
{
	my @allfiles = `cd /tmp/;ls -t`;
	# my $latestfile = $allfiles[0];
	# say $latestfile;
	for my $file (@allfiles)
	{
		chomp($file);
		if($file =~ /mc_updsdk-\d+\.log/)
		{
			say "log file: $file";
			return File::Spec->catfile('/tmp/', $file);
		}
	}
	return '';
}
	my $logfilename = getlatestlogfilename();
	say "\$logfilename=$logfilename=";
	open(LOG, "<", $logfilename) or die "Failed to open file: $! $logfilename\n";
	while(my $aline = <LOG>)
	{
		 
			say $aline;
			 
	}
print "Hello World!\n";
