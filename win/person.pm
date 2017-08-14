package person;

=pod

=head1 NAME

person - My author was too lazy to write an abstract

=head1 SYNOPSIS

  my $object = person->new(
      foo  => 'bar',
      flag => 1,
  );
  
  $object->dummy;

=head1 DESCRIPTION

The author was too lazy to write a description.

=head1 METHODS

=cut

use 5.010;
use strict;
use warnings;

our $VERSION = '0.01';

=pod

=head2 new

  my $object = person->new(
      foo => 'bar',
  );

The C<new> constructor lets you create a new B<person> object.

So no big surprises there...

Returns a new B<person> or dies on error.

=cut

# sub new {
	# my $class = shift;
	# my $self  = bless { @_ }, $class;
	# return $self;
# }
sub new {
my $class = shift();
print("CLASS = $class\n");
my $self = {}; 
$self->{"name"} = shift();
$self->{"sex"} = shift();
bless $self, $class;
return $self; 
}

sub getName {
my ($self) = @_;
return $self->{"name"};
}

sub setName {
my ($self, $name) = @_;
$self->{"name"} = $name;
}

sub getSex {
my ($self) = @_;
return $self->{"sex"};
}

sub setSex {
my ($self, $sex) = @_;
$self->{"sex"} = $sex;
}
=pod

=head2 dummy

This method does something... apparently.

=cut

sub dummy {
	my $self = shift;

	# Do something here

	return 1;
}

1;

=pod

=head1 SUPPORT

No support is available

=head1 AUTHOR

Copyright 2012 Anonymous.

=cut
