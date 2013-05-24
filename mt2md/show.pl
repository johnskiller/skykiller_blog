#!/usr/bin/perl
# ----------------------------------------------------------------------
#  DB_INFO -- PERL PROGRAM
# ----------------------------------------------------------------------
#  This program will display or delete entries from a Movable Type
#  database stored in the standard DB files (they end in .db). It
#  make certain assumptions about the database, so make a backup
#  copy of the database file before playing with this script!
#
#  Listen kids, you've been warned.
#
#  Instructions are found by running this with a --help option or
#  just looking at the instructions found at the __END__
# ----------------------------------------------------------------------

$opt_file = "./entry.db";

require 5;

# ----------------------------------------------------------------------
# Use GetOptions to parse the command line options...

use Getopt::Long;
$autoabbrev=1;

$result = GetOptions("file=s", "print", "delete", "dump",
		     "help", "debug");

if ($opt_help or !$result)
{
  while (<DATA>) {
    print;
  }
  exit;
}

# ----------------------------------------------------------------------

use DB_File;

print "Opening $opt_file\n" if ($opt_debug);
die "Can't read $opt_file- $!\n" if (! -r $opt_file);

my $flags = O_RDWR|O_CREAT;
my $mode = 0666;

$H = tie %hash, 'DB_File', $opt_file, $flags, $mode, $DB_BTREE;

# ----------------------------------------------------------------------

my $entries = "@ARGV";

if (@ARGV)
{
  if ($entries =~ /^\d+$/)
  {
    push @entries, $entries;
  }
  else
  {
    eval { require Set::IntSpan; };
    if ($@) {
      print "If you install Set::IntSpan you can do ranges of numbers.\n";
    } else {
      import Set::IntSpan;
      $set = new Set::IntSpan $entries;
      @entries = elements $set;
    }
  }
}
else
{
  @entries = keys %hash;
}

# ----------------------------------------------------------------------
#  Given the --delete command ... let's ask the user before deleting
#  it.

if ($opt_delete)
{
  foreach $id (@entries)
  {
    my %d = splitentry($id);
    my $t = $d{"title"};
    if ($d) {
      print "DELETE: $id? ";
      print "($t)  " if ($t);

      my $in = <STDIN>;

      if ($in =~ /^\s*y/i) {
	delete $hash{$id};
      }
    }
  }
}

# The --dump command simply outputs the entry as is, without any
# fancy formatting ...

elsif ($opt_dump)
{
  print "DUMP:\n" if ($opt_debug);
  foreach $id (@entries)
  {
    $value = $hash{$id};
    print "$key\n$value\n\n";
  }
}

# We default to the --print command, which will parse and print the
# entry in an easier to read format.

else
{
  print "\n[";
  foreach $id (@entries)
  {

    print "\n{\n";
    showentry($id);
    print "},\n";
  }
  print "]";
}

untie %hash;

# ----------------------------------------------------------------------

sub splitentry
{
  my ($p) = @_;

  my $entry = $hash{$p};
  $entry =~ s/^.*?\000+//;	# Remove the introductory SERG
  my %parts = split(/\000{2}../s, $entry);

  return %parts;
}

sub showentry
{
  my ($p) = @_;
  %parts = splitentry($p);

  foreach $key (keys %parts) {
    my $k = $key;
    $k =~ s/^\s*//;
    $k =~ s/\s*$//;
    $v = $parts{$key};
    $v =~ s/"/\\"/g;
    $v =~ s/\n/\\n/g;
    print "\n\"$k\":\"$v\",";
    #print "<$k>$parts{$key}</$k>\n";
  }
}


# ----------------------------------------------------------------------

