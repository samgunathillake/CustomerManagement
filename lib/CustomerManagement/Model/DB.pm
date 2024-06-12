package CustomerManagement::Model::DB;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'CustomerManagement::Schema',
    connect_info => {
        dsn => 'dbi:SQLite:myapp.db',
        user => '',
        password => '',
    }
);

1;
