package Liba;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Load configuration from hash returned by "my_app.conf"
  my $config = $self->plugin('Config');

  $self->helper(users => sub { state $users = Liba::Model::Users->new });

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer') if $config->{perldoc};

  # Router
  my $r = $self->routes;

  # Normal route to controller

  # $r->get('/')->to('example#welcome');
  # $r->get('login')->to('main#login');
  $r->any('/')->to('main#login')->name('main');

  my $logged_in = $r->under('/')->to('main#logged_in');

  $logged_in->get('/index')->to('main#index');
  $r->get('/logout')->to('main#logout');
}

1;
