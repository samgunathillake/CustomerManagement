use strict;
use warnings;

use CustomerManagement;

my $app = CustomerManagement->apply_default_middlewares(CustomerManagement->psgi_app);
$app;

