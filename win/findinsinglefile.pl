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

 
my $f = 'C:\G\CConsole\CBmp\CBmp\CBmp.cpp';

open(FILE, $f);  
while (<FILE>) 
{
    if ($_ =~ /.+?(?<!\()\w+\s+=\s+.*;/)
    {
       say "$&";
     
       
    }
}



print "Hello World!\n";
