#!/usr/bin/perl

use warnings;
use strict;
$ENV{"DALE_TEST_ARGS"} ||= "";
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/fn-object-multi.dt -o fn-object-multi `;
is(@res, 0, 'No compilation errors');

@res = `./fn-object-multi`;
is($?, 0, 'Program executed successfully');

chomp for @res;
is_deeply(\@res, [
    '28'
], 'Got expected results');

`rm fn-object-multi`;

1;
