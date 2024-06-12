use strict;
use warnings;

use Test::More tests => 8;
use Test::WWW::Mechanize::Catalyst 'CustomerManagement';

my $mech = Test::WWW::Mechanize::Catalyst->new;

# Create a new customer
$mech->post_ok('/customer', json => { name => 'Test User', email => 'test@example.com', phone_number => '1234567890' }, 'Create customer');
my $response_content = $mech->content;
like($response_content, qr/"id":\d+/, 'Customer created with an ID');

# Get the created customer (assuming the ID is 1 for simplicity)
$mech->get_ok('/customer/1', 'Get created customer');
$mech->content_contains('Test User', 'Customer name is correct');

# Update the customer
$mech->put_ok('/customer/1', json => { name => 'Updated User', email => 'updated@example.com', phone_number => '0987654321' }, 'Update customer');
$mech->get_ok('/customer/1', 'Get updated customer');
$mech->content_contains('Updated User', 'Customer name is updated correctly');

# Delete the customer
$mech->delete_ok('/customer/1', 'Delete customer');
$mech->get('/customer/1');
$mech->status_is(404, 'Customer is deleted');

done_testing();
