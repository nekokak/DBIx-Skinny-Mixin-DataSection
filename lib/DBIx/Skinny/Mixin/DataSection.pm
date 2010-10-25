package DBIx::Skinny::Mixin::DataSection;
use strict;
use warnings;
our $VERSION = '0.01';

use Data::Section::Simple qw/get_data_section/;
use Carp ();

sub register_method {
    +{
        'search_by_datasection' => sub {
            my ($class, $section_name, $bind) = @_;
            my $sql = $class->get_datasection_query($section_name);
            $class->search_by_sql($sql, $bind);
        },
        'get_datasection_query' => sub {
            my ( $class, $section_name ) = @_;
            $class = ref $class if ref $class;
            my $data = Data::Section::Simple->new( $class )->get_data_section;
            return $data->{$section_name} if $data->{$section_name};
            Carp::croak "could not find sql: $section_name in __DATA__ section";
        },
    },
}

1;
__END__

=head1 NAME

DBIx::Skinny::Mixin::DataSection -

=head1 SYNOPSIS

  package Proj::DB;
  use DBIx::Skinny;
  use DBIx::Skinny::Mixin modules => ['DataSection'];
  __DATA__
  @@ basic_search
  SELECT * FROM user WHERE name = ?

  package main;
  use Proj::DB;
  my $sql = Proj::DB->get_datasection_query('basic_search')
  Proj::DB->search_by_datasection('basic_search',['nekokak']);

=head1 DESCRIPTION

DBIx::Skinny::Mixin::DataSection is

=head1 AUTHOR

Atsushi Kobayashi E<lt>nekokak _at_ gmail _dot_ comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
