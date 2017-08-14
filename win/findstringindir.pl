#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use File::Path;
use File::Glob ':glob';
#use Array::Utils qw(:all);
use File::Basename;
use File::Spec::Functions 'catfile';
 use File::Find qw(finddepth);

# my $testdir = 'C:/test';
#my $bezeqdir = 'C:/svn/bezeq/Source';
# my $cdir = 'C:/G/CConsole/CStu';
my $dir = 'C:/MMS';
my @files;

finddepth(sub 
{
      return if($_ eq '.' || $_ eq '..');
      push @files, $File::Find::name;
}, $dir);
my $filetype = '.txt';
my $search = 'in\w+@malinator.com';my $outfile = 'found.txt';
open(FOUND, ">", $outfile);
for my $f (@files)
{
         if(!-d $f &&  $f =~ /\Q$filetype/)
          
        { 
        	 my $found = 0;
		   open(FILE, $f);  
		    while (<FILE>) 
		    {
		       # say $_;
			  if ($_ =~ /inmon[\d\w]+\@mailinator\.com/)
			  # if ($_ =~ /mailinator\.com/)
			 {
			    say "$&";
			     say FOUND  "$&";
			    $found = 1;
			    
			 }
		    }
		    if($found)
		    {
		       say "-------------$f";
		    }
	}
	}
	
	      

print "Hello World!\n";
