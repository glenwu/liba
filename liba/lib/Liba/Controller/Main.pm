package Liba::Controller::Main;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub index {
  my $self = shift;
  # Render template "example/welcome.html.ep" with message
  $self->render(msg => 'this is index');
}

1;
