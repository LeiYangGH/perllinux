#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use File::Path;
use File::Glob ':glob';
use File::Basename;
use File::Spec::Functions 'catfile';
use File::Find qw(finddepth);


my $dir = 'C:/Ai/fltk-1.3.4-1/ide/VisualC2010/';
my @files;

finddepth(sub 
{
      return if($_ eq '.' || $_ eq '..');
      push @files, $File::Find::name;
}, $dir);my $sdk = '<WindowsTargetPlatformVersion>10.0.15063.0</WindowsTargetPlatformVersion>';
for my $f (@files)
{
       if(   $f =~ /\.vcxproj/)
        { 
            say basename $f;
             my $data = read_file ($f);
             $data =~ s/(<ProjectGuid>\{.+?\}<\/ProjectGuid>)/$1 \n $sdk/g;
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