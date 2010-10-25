use strict;
use warnings;
use Test::More;
use lib './t';
use Mock::Basic;

Mock::Basic->setup_test_db;

subtest 'class method' => sub {
    Mock::Basic->insert('mock_basic',{id => 1, name => 'perl'});

    my $itr = Mock::Basic->search_by_datasection('search',['1']);
    isa_ok $itr, 'DBIx::Skinny::Iterator';
    my $row = $itr->first;
    is $row->name, 'perl';

    done_testing;
};

subtest 'instance method' => sub {
    my $db = Mock::Basic->new;

    my $itr = $db->search_by_datasection('search',['1']);
    isa_ok $itr, 'DBIx::Skinny::Iterator';
    my $row = $itr->first;
    is $row->name, 'perl';

    done_testing;
};

done_testing;

