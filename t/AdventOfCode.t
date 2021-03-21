use strict;
use warnings;

use Test::More;
use Readonly;
use version; our $VERSION = qv('1.0.1');

use lib '../lib';
use AdventOfCode;

plan tests => 1;

my $advent_of_code = AdventOfCode->new;
isa_ok $advent_of_code, 'AdventOfCode';
