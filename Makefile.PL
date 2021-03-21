use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'AdventOfCode',
    AUTHOR        => q{Christian Eiselt <dev@eiselt.ch>},
    VERSION_FROM  => 'lib/AdventOfCode.pm',
    ABSTRACT_FROM => 'lib/AdventOfCode.pm',
    LICENSE       => 'perl',
    PL_FILES      => {},
    PREREQ_PM     => {},
    TEST_REQUIRES => {
          'Test::More'    => 1.001014,
    },
);