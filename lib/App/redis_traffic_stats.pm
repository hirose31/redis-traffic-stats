package App::redis_traffic_stats;

use strict;
use warnings;
use 5.008_005;

our $VERSION = '1.003';

1;

__END__

=encoding utf-8

=begin html

<a href="https://travis-ci.org/hirose31/App-redis_traffic_stats"><img src="https://travis-ci.org/hirose31/App-redis_traffic_stats.png?branch=master" alt="Build Status" /></a>
<a href="https://coveralls.io/r/hirose31/App-redis_traffic_stats?branch=master"><img src="https://coveralls.io/repos/hirose31/App-redis_traffic_stats/badge.png?branch=master" alt="Coverage Status" /></a>

=end html

=head1 NAME

App::redis_traffic_stats - Redis query analyzer for counting, traffic stats by command

=begin readme

=head1 INSTALLATION

To install this module, run the following commands:

    perl Build.PL
    ./Build
    ./Build test
    ./Build install

=end readme

=head1 DESCRIPTION

See L<redis-traffic-stats>.

=head1 AUTHOR

HIROSE Masaaki E<lt>hirose31@gmail.comE<gt>

=head1 REPOSITORY

L<https://github.com/hirose31/redis-traffic-stats>

    git clone https://github.com/hirose31/redis-traffic-stats.git

patches and collaborators are welcome.

=head1 COPYRIGHT

Copyright HIROSE Masaaki

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
