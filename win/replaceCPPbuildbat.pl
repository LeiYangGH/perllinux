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


my $dir = 'C:\Users\YLei\Desktop\Programming-code';
my @files;

finddepth(sub 
{
      return if($_ eq '.' || $_ eq '..');
      push @files, $File::Find::name;
}, $dir);
for my $f (@files)
{
        if( (basename $f) eq 'build.bat')
        { 
            #say basename $f;
            my $data = read_file ($f);
            $data =~ s/rem[\s\S]*?\n//g;
            $data =~ s/if "%1" == "msvc90"[\s\S]*:PROCEED\n/call "C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Community\\VC\\Auxiliary\\Build\\vcvars32.bat"/g;
            say $data;
            write_file($f, $data);
	}
	}
	
	
 

print "Hello World!\n";

sub read_file {
    my ($fn) = @_;
     open my $in, '<:encoding(utf-8)', 
    $fn or die "Could not open '$fn'";
    local $/ = undef;
    my $all = <$in>;
    close $in;
    return $all;
}
 
sub write_file {
    my ($fn, $content) = @_;
     open my $out, '>:encoding(utf-8)', 
    $fn or die "Could not open '$fn'";
    print $out $content;
    close $out;
    return;
}