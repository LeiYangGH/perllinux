#!/usr/bin/perl
use 5.010;
use strict;
use warnings;
use POSIX qw/strftime/;
use DateTime;
use File::Spec::Functions 'catfile';
use File::Slurp;

my $taskdir = 'C:\0Task';
my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
my $today = DateTime->new(
    year   => 1900+$year,
    month  => $mon+1,
    day    => $mday
);  

#my $stoday = $today->year;#.'-'.$today->month .'-'. $today->day; #strftime("%Y-%m-%d", $today);
# say strftime("%Y-%m-%d", localtime(time));
my $stoday =  $today->year  .'-'.sprintf('%02d',$today->month) .'-'.sprintf('%02d', $today->day);say "stoday = $stoday";

my $lastsunday = $today;
$lastsunday->subtract(days => $wday);my $slastsunday = $lastsunday->year  .'-'.sprintf('%02d',$lastsunday->month) .'-'.sprintf('%02d', $lastsunday->day);
say "slastsunday = $slastsunday";
my $oneday = $lastsunday;my @shortfilenames = ($slastsunday);

for my $i (1..6)
{
    say "\$i=$i";
    $oneday->subtract(days =>  1);
    my $soneday = $oneday->year  .'-'.sprintf('%02d',$oneday->month) .'-'.sprintf('%02d', $oneday->day);
    push @shortfilenames, $soneday;
} 

# say @shortfilenames;
my $weekfilename = File::Spec->catfile($taskdir,'Week'.$shortfilenames[6].'~'.$shortfilenames[0].'.txt');
$weekfilename =~ s/-//g;
say $weekfilename;
if(-s $weekfilename)
{
    say "$weekfilename already exists!";
}
else
{
    my $alltask;
    my $alldetail;
    for my $fn (@shortfilenames)
    {
        my $fullfilename = File::Spec->catfile($taskdir,$fn.'.txt');
        say $fullfilename;
        unlink $fullfilename.'~';
        next if(not -s $fullfilename);
        my $contents = read_file($fullfilename);
        if($contents =~ /={3,}/)
        {
            $alltask .= "\n" . $`;
            $alldetail .= "\n" . $';
        }
        else
        {
            $alldetail .= "\n" . $contents;
        }
        # say $contents;
    }
    open my $weekfile, ">>", $weekfilename or die "Can't open $weekfilename\n";
    say $weekfile $alltask;
    say $weekfile '====================================';
    say $weekfile $alldetail;
    close $weekfile;
    say "$weekfilename written!";
}
print "Hello World!\n";
