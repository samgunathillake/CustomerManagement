package CustomerManagement::Controller::Customer;
use Moose;
use namespace::autoclean;
use Try::Tiny;

BEGIN { extends 'Catalyst::Controller::REST'; }

__PACKAGE__->config(default => 'application/json');

sub create :Local :ActionClass('REST') { }
sub create_POST {
	    my ($self, $c) = @_;
	        my $data = $c->req->data;
		    my $customer = $c->model('DB::Customer')->create($data);
		        $self->status_created($c, location => $c->uri_for('/customer', $customer->id), entity => { id => $customer->id });
		}

		sub read :Local :ActionClass('REST') { }
		sub read_GET {
			    my ($self, $c, $id) = @_;
			        my $customer = $c->model('DB::Customer')->find($id);
				    if ($customer) {
					            $self->status_ok($c, entity => { $customer->get_columns });
						        } else {
								        $self->status_not_found($c, message => "Customer not found");
									    }
								    }

								    sub update :Local :ActionClass('REST') { }
								    sub update_PUT {
									        my ($self, $c, $id) = @_;
										    my $data = $c->req->data;
										        my $customer = $c->model('DB::Customer')->find($id);
											    if ($customer) {
												            $customer->update($data);
													            $self->status_ok($c, entity => { $customer->get_columns });
														        } else {
																        $self->status_not_found($c, message => "Customer not found");
																	    }
																    }

																    sub delete :Local :ActionClass('REST') { }
																    sub delete_DELETE {
																	        my ($self, $c, $id) = @_;
																		    my $customer = $c->model('DB::Customer')->find($id);
																		        if ($customer) {
																				        $customer->delete;
																					        $self->status_no_content($c);
																						    } else {
																							            $self->status_not_found($c, message => "Customer not found");
																								        }
																								}

																								__PACKAGE__->meta->make_immutable;

																								1;

