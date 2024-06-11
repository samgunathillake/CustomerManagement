use strict;
use warnings;
use Test::More;
use Test::WWW::Mechanize::Catalyst;

my $mech = Test::WWW::Mechanize::Catalyst->new;

# Set the base URL of your Catalyst application
# $mech->base_url('http://localhost:3000');
#
# # Test creating a new customer
# $mech->post_ok('/customer', { name => 'John Doe', email => 'john@example.com', phone_number => '1234567890' }, 'Created new customer');
#
# # Test reading customer details
# $mech->get_ok('/customer/1', 'Read customer details');
# $mech->content_contains('John Doe', 'Customer name is correct');
#
# # Add more test cases for update and delete operations
#
# done_testing();
#
