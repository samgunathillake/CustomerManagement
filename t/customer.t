
use Test::More tests => 4;
use Test::WWW::Mechanize::Catalyst 'CustomerManagement';

my $mech = Test::WWW::Mechanize::Catalyst->new;

$mech->post_ok('/customer', json => { name => 'Test User', email => 'test@example.com', phone_number => '1234567890' });

$mech->get_ok('/customer/1', 'Get created customer');
$mech->content_contains('Test User', 'Customer name is correct');

$mech->put_ok('/customer/1', json => { name => 'Updated User', email => 'updated@example.com' });
$mech->get_ok('/customer/1', 'Get updated customer');
$mech->content_contains('Updated User', 'Customer name is updated correctly');

$mech->delete_ok('/customer/1');
$mech->get('/customer/1');
$mech->status_is(404, 'Customer is deleted');

