use 5.14.2;
use utf8;
use strict;
use warnings;
use File::Basename;
my $dir = '/home/leiyang/pic';
foreach my $jpg ( glob "$dir/*.JPG")
{
   say $jpg;
my $re = "$dir/RE_". basename $jpg;
my $cmd = "convert -resize 10% $jpg $re";
`$cmd`;
say $cmd;
}
say 'end';
