package PRFNeo;
## Time-stamp: <2016-03-24 20:57:05 abelew>
use Moose;
use common::sense;
use diagnostics;

our $VERSION = '201603';

has config => (is => 'rw');

=head1 NAME

PRFNeo - A fresh implementation of the prfdb.

=head1 SYNOPSIS

  use PRFNeo qw"";

=head1 DESCRIPTION

There are some good things in the original PRFdb implementation.  It is nicely configurable
either via a configuration file or command line arguments.  However, there are too many.
It has nice failover capabilities, but they are too complex.  It has nice logging abilities,
but to use them is too onerous.
The goal of this project is to fix all these problems, make it easier to use, reasonably
'modern', and properly tested from beginning to end.

=cut

=head2 Methods

=over 4



=back

=head1 AUTHOR - atb

Email abelew@gmail.com

=head1 SEE ALSO

    L<common::sense> L<autodie> L<local::lib>

=cut

1;

__END__
