package t::Util;

use strict;
use warnings;

use base qw(Exporter);
our @EXPORT = qw(p);

use Data::Dumper;

sub p($) {
    local $Data::Dumper::Indent    = 1;
    local $Data::Dumper::Deepcopy  = 1;
    local $Data::Dumper::Sortkeys  = 1;
    local $Data::Dumper::Terse     = 1;
    local $Data::Dumper::Useqq     = 1;
    local $Data::Dumper::Quotekeys = 0;
    my $d =  Dumper($_[0]);
    $d    =~ s/\\x{([0-9a-z]+)}/chr(hex($1))/ge;
    print STDERR $d;
}

1;

__END__
