
BEGIN {
  unless ($ENV{RELEASE_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for release candidate testing');
  }
}

use strict;
use warnings;
use Test::More;
eval { require Test::Kwalitee::Extra; Test::Kwalitee::Extra->import(qw(:experimental)); };
#eval { require Test::Kwalitee::Extra; Test::Kwalitee::Extra->import(qw(:experimental !prereq_matches_use !build_prereq_matches_use)); };
plan(skip_all => "Test::Kwalitee::Extra not installed: $@; skipping") if $@;

#done_testing;
