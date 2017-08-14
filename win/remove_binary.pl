#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use File::Path;
use File::Glob ':glob';
use Array::Utils qw(:all);
use File::Basename;
use File::Spec::Functions 'catfile';
 use File::Find qw(finddepth);

my $testdir = 'C:/test';
#my $bezeqdir = 'C:/svn/bezeq/Source';
my $bezeqdir = 'C:/ProgCS/CSCapture';
my $lamdir = 'C:/svn/LAM/changes_7-20';

my @files;

finddepth(sub 
{
      return if($_ eq '.' || $_ eq '..');
      push @files, $File::Find::name;
}, $lamdir);
for my $f (@files)
{
        if(!-d $f &&  (-z $f || -B $f ))
        #if( -f $f)
        #if(-f $f && 1)
        { 
        	unlink $f;
		say $f;
	}
	else
	{
		# my $fn = basename $f;
		# if($fn =~ /\.rc$/
		# || $fn =~ /dllmain.cpp/
		# || $fn =~ /ReadMe.txt/
		# || $fn =~ /stdafx.h/
		# )
		# {
			# unlink $f;
			say $f;
		# }
			}
	
	        
}

print "Hello World!\n";
