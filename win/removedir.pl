#!/usr/bin/perl
use 5.010;
use strict;
use warnings;
use File::Path;
use File::Glob ':glob';
use Array::Utils qw(:all);
use File::Basename;
use File::Spec::Functions 'catfile';
my @dirs;
my $vs15projdir = 'C:/Users/yanglei2/Documents/Visual Studio 2015/Projects/*';
my $vs13projdir = 'C:\Users\yanglei2\Documents\Visual Studio 2013\Projects/*';
my $gdir = 'C:/G/*';
my $progvsdir = 'C:/ProgCS/*';
push @dirs, grep {/Application\d+/} bsd_glob ($vs15projdir);
push @dirs, grep {/Application\d+/} bsd_glob ($vs13projdir);
push @dirs, grep {/Application\d+/} bsd_glob ($gdir);
push @dirs, grep {/Application\d+/} bsd_glob ($progvsdir);
for my $dir (@dirs)
{
	say $dir;
}

sub askyesno
{
  my $msg = $_[0];
  my $answer;
   until (defined $answer) 
   {
      say "\n$msg?\n";
      $_ = <>;
      $answer = 1 if /^Y/i;
      $answer = 0 if /^N/i;
   }
   $answer;
}  
if(@dirs > 0)
{

   if (askyesno('Delete all VS projects') == 1)
   {
     for my $dir (@dirs)
     {
       rmtree($dir);
     }
   }
}

my $installdir = 'C:/Installs/';my $downdir = 'C:/Users/yanglei2/Downloads/';
my $testdir = 'C:/0Test/';
my $testinstalldir = 'C:/0Test/Installs/';
sub cmpareanddelete
{
  my $dir1 = $_[0];
  my $dir2 = $_[1];
  my @dir1files = map {basename $_} grep {-f $_} glob( "$dir1*");
  my @dir2files = map {basename $_} grep {-f $_} glob( "$dir2*");
  my @commonfiles = intersect(@dir1files, @dir2files);
   for my $file (@commonfiles)
   {
           say $file;
   }
   if(@commonfiles > 0)
   {
    
      if (askyesno("Delete duplicate files under $dir1") == 1)
      {
        for my $file (@commonfiles)
        {
          my $fullname = catfile($dir1, $file);
          unlink($fullname) or warn("can't remove $fullname\n");
        }
      }
   }}


sub deleteunzipped
{
  my $dir = $_[0];
  my @dirs =  grep {-d $_ && -f $_ .'.zip'} glob( "$dir*");
  if (@dirs > 0 && askyesno("Delete duplicate zip files under $dir") == 1)
  {
     for my $d (@dirs)
     {
         say $d;
         rmtree($d);
     }
  }
}
cmpareanddelete($installdir,$testinstalldir);
cmpareanddelete($installdir,$testdir);
cmpareanddelete($downdir,$installdir);
cmpareanddelete($downdir,$testdir);

deleteunzipped($downdir);
deleteunzipped($testdir);
print "Hello World!\n";
