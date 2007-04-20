use strict;
use warnings;
use Test::More tests => 8;
use URI;
use File::Slurp;

BEGIN { use_ok 'Text::Microformat' }
use Data::Dumper;
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
my $html = read_file('t/hcard1.html');
my $uformat = Text::Microformat->new($html);
foreach my $thing ($uformat->find) {
	is($thing->Class, 'vcard');
	is($thing->fn->[0]->Value, 'John Doe');
	is($thing->Get('fn'), 'John Doe');
	is($thing->Get('adr.post-office-box'), 'Box 1234');
	is($thing->Get('adr.type'), 'work');
	is($thing->Get('geo.latitude'), '37.77');
	is($thing->Get('email.type'), undef);
}