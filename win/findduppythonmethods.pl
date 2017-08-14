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

my @methods = ();
open(FILE, $f);  
while (<FILE>) 
{
    if ($_ =~ /def \w+/)
    {
      # say "$&";
       push @methods, $&;
    }
}
foreach(sort @methods)
{
   say $_;
}


print "Hello World!\n";