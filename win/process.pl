#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

for (my $i = 0; $i < 10; $i ++) {
    ## == fork a new process ==
    my $pid = fork();
 
    if (!defined($pid)) {
        print "Error in fork: $!";
        exit 1;
    }
 
    if ($pid == 0) {
 
        ## == child proc ==
        print "Child $i : My pid = $$\n";
        sleep(5);
        print "Child $i : end\n";
        exit 0;
    }
    sleep(1);
}
 
exit 0;

print "Hello World!\n";
