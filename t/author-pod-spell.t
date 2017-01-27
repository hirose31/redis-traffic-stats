
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;
use Test::More;

eval { require Test::Spelling; Test::Spelling->VERSION(0.12); Test::Spelling->import(); };
plan(skip_all => "Test::Spelling not installed: $@; skipping") if $@;

eval { require Pod::Wordlist; Pod::Wordlist->import(); };
plan(skip_all => "Pod::Wordlist not installed: $@; skipping") if $@;


add_stopwords(<DATA>);
all_pod_files_spelling_ok( qw( bin lib  ) );
__DATA__
HIROSE
Masaaki
hirose31
lib
Redis
