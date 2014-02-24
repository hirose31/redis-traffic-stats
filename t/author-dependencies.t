
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;
use Test::More;
eval "use App::scan_prereqs_cpanfile";

plan skip_all => "App::scan_prereqs_cpanfile required for testing module dependencies"
    if $@;

my $diff = `scan-prereqs-cpanfile --ignore junk --diff cpanfile`;
is($diff, "", "diff cpanfile");

done_testing;
