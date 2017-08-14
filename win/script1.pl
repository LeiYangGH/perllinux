#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use Win32::API;

binmode(STDOUT, ":unix:utf8");

#Must set the console code page to UTF8
my $SetConsoleOutputCP= new Win32::API( 'kernel32.dll', 'SetConsoleOutputCP', 'N','N' );
$SetConsoleOutputCP->Call(65001);

my $line1="\x{D6D0}".("\x{2550}"x15)."\x{2557}\n";
my $line2="\x{2551}".(" "x15)."\x{2551}\n";
my $line3="\x{255A}".("\x{2550}"x15)."\x{255D}";
my $unicode_string=$line1.$line2.$line3;

print "THIS IS THE CORRECT EXAMPLE OUTPUT IN PURE PERL: \n";
print $unicode_string;
print "中";
print "Hello World!\n";
