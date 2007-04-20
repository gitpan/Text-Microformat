use strict;
use warnings;
use Test::More tests => 6;
use URI;
use File::Slurp;

use Carp 'confess';
$SIG{__DIE__} = \&confess;

BEGIN { use_ok 'Text::Microformat' }
use Data::Dumper;
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
my $html = read_file('t/hgrant1.html');
my $uformat = Text::Microformat->new($html);
my @things = $uformat->find;
#print STDERR ref $things[0]->grantee->[0]->fn, "\n";
is($things[0]->Get('grantee.fn'), 'Stanford University');
is($things[0]->Get('grantee.url'), 'http://www.stanford.edu');
is($things[1]->Get('grantee.fn'), 'Michigan State University');
is($things[1]->Get('grantee.url'), 'http://www.msu.edu');
is($things[0]->Get('grantor.fn'), 'The William and Flora Hewlett Foundation');
