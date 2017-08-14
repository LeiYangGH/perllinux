use 5.14.2;
use utf8;
use strict;
use warnings;
use encoding 'utf8', STDOUT => 'gb2312';
# binmode STDOUT, ':utf8';
say "\x{263A}";
my $all = 'ab阳光的雷咩咩c';
say $all;
$all =~ /[a-zA-Z]+/;
my $en = $&;
say "\$en = $en";
if ($all =~/[\x{4e00}-\x{9fa5}]+/) 
{
	my $ch = $&;
	say "\$ch = $ch";
}
say 'end';
<>;
