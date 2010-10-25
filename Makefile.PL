use inc::Module::Install;
name 'DBIx-Skinny-Mixin-DataSection';
all_from 'lib/DBIx/Skinny/Mixin/DataSection.pm';

requires 'DBIx::Skinny';
requires 'Data::Section::Simple';
requires 'Carp';

tests 't/*.t';
author_tests('xt');

test_requires 'Test::More' => '0.94';

auto_set_repository;
WriteAll;
