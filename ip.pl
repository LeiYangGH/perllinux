#!/usr/bin/perl

$ip0 = `ifconfig`;
$ip0 =~ s/.*inet 地址:(.*) 广播:/1/;
print "ip => " . $1 . "\n";
