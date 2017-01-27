
BEGIN {
  unless ($ENV{RELEASE_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for release candidate testing');
  }
}

# this test was generated with Dist::Zilla::Plugin::Test::Kwalitee 2.11
use strict;
use warnings;
use Test::More 0.88;
eval { require Test::Kwalitee; Test::Kwalitee->VERSION(1.21); Test::Kwalitee->import(qw(kwalitee_ok)); };
plan(skip_all => "Test::Kwalitee not installed: $@; skipping") if $@;

kwalitee_ok();

done_testing;
