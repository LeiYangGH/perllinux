#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $ini = 'c:\test\a.ini';
my $data = read_file($ini);
$data =~ s/(?<=a=)\d+/321/g;
write_file($ini, $data);print "done!\n";

sub read_file {
    my ($fn) = @_;
    open my $in, '<:encoding(UTF-8)', 
    $fn or die "Could not open '$fn'";
    local $/ = undef;
    my $all = <$in>;
    close $in;
    return $all;
}
 
sub write_file {
    my ($fn, $content) = @_;
    open my $out, '>:encoding(UTF-8)', 
    $fn or die "Could not open '$fn'";
    print $out $content;
    close $out;
    return;
}

