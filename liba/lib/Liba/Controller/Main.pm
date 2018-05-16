package Liba::Controller::Main;
use Mojo::Base 'Mojolicious::Controller';
use Mojo::JSON qw(decode_json encode_json);

use Liba::Model::Users;

# This action will render a template
sub index {
  my $self = shift;
  $self->stash(msg => '功能选择', bodytype => 'nav-sm', user => $self->session('user'));
  $self->render;
}

sub fetch {
  my $self = shift;
  $self->stash(msg => '功能选择', bodytype => 'nav-sm', user => $self->session('user'));
  $self->render;
}

sub login {
  my $self = shift;
  $self->stash(msg => 'Login', bodytype => 'login');
  my $user = $self->param('user') || '';
  my $pass = $self->param('pass') || '';
  my $failed = '';
  $failed = 'incorrect username or password' if defined $self->param('failed') ;
  $self->stash(failed => $failed); 

  return $self->render unless $self->users->check($user, $pass);

  $self->session(user => $user);
  $self->flash(msg => 'hello flash');
  $self->redirect_to('index');

    
}

sub logged_in {
  my $self = shift;
  return 1 if $self->session('user');
  $self->redirect_to('/');
  return undef;
}

sub logout {
  my $self = shift;
  $self->session(expires => 1);
  $self->redirect_to('/');
}

# render js file
sub custom {
    my $self = shift;
    # $self->stash(user => $self->session('user'));

    $self->stash(msg => $self->session('user'), sidebar => $self->users->privilege($self->session('user')));
    $self->render;
}

1;
