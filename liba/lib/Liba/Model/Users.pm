package Liba::Model::Users;

use strict;
use warnings;
use utf8;

use Mojo::Util 'secure_compare';

my $USERS = {
  glenwu      => 'back123',
  timwu    => 'back123',
  sebastian => 'secr3t'
};

my $PRIV = {
  glenwu =>   'SYS',
  timwu => 'CIR'
};

my $GROUP = {
  SYS => [0,1,2,3,4],
  ADM => [0,1,2,4],
  CIR => [0,1],
  ACQ => [0,1],
  REF => [0,1,2]
}; 

my $GROUP_HTML = [
  '<li><a><i class="fa fa-home"></i> 数据统计 <span class="fa fa-chevron-down"></span></a>
  <ul class="nav child_menu">
      <li><a href="index.html">Dashboard</a></li>
      <li><a href="index2.html">Dashboard2</a></li>
      <li><a href="index3.html">Dashboard3</a></li>
  </ul>
  </li>',
  '<li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page1</a></li>',
  '<li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page2</a></li>',
  '<li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page3</a></li>',
  '<li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page4</a></li>',
  '<li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page5</a></li>',
];


sub new { bless {}, shift }

sub check {
  my ($self, $user, $pass) = @_;

  # Success
  return 1 if $USERS->{$user} && secure_compare $USERS->{$user}, $pass;

  # Fail
  return undef;
}

sub privilege {
  my ($self, $user) = @_;
  return [@$GROUP_HTML[@{$GROUP->{$PRIV->{$user}}}]];
} 
1;