#!/usr/bin/perl
use 5.010;
use strict;
use warnings;
sub pingbaidu
{
	my $f = '';
	my $output = `ping -c 5 -W 3 www.baidu.com`;
	if($output =~ /.+bytes from.+time=.+ms/)
	{
		return 1;
	}
	return 0;
}
my $netstatus = pingbaidu();
say $netstatus;
print "Hello World!\n";
