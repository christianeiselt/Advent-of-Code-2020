use strict;
use warnings;

use Test::More;
use JSON::MaybeXS qw(decode_json);
use Path::Tiny qw(path);
use lib '../lib';
use AdventOfCode;

plan tests => 1;

my $advent_of_code = AdventOfCode->new;
isa_ok $advent_of_code, 'AdventOfCode';
