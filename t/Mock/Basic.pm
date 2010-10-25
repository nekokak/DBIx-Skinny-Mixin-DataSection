package Mock::Basic;
use DBIx::Skinny setup => +{
    dsn => 'dbi:SQLite:',
    username => '',
    password => '',
    connect_options => { AutoCommit => 1 },
};
use DBIx::Skinny::Mixin modules => [qw/DataSection/];

sub setup_test_db {
    my $self = shift;
    my $sql = $self->get_datasection_query('create');
    $self->do($sql);
}

1;

__DATA__
@@ create
CREATE TABLE mock_basic (
    id   integer,
    name text,
    primary key ( id )
)

@@ search
SELECT * FROM mock_basic WHERE id = ?

