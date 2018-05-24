#! /usr/bin/env perl

# git clone 	url = https://github.com/sschneid/perl-bigip-parseconfig.git

use strict;
use warnings;
use diagnostics;
use Data::Dumper;

# push(@INC, $ENV{'HOME'} . '/projects/perl-bigip-parseconfig/blib/lib');
# push(@INC, '/home/users/achim.dreyer/projects/perl-bigip-parseconfig/blib/lib');
use BigIP::ParseConfig;

my $file = ($ARGV[0]) ? $ARGV[0] : '/config/bigip.conf';
# Module initialization
my $bip = new BigIP::ParseConfig( $file );

my @data = ();

print "monitors\n"; @data = $bip->monitors(); print Dumper \@data;
print "nodes\n"; @data = $bip->nodes(); print Dumper \@data;
print "partitions\n"; @data = $bip->partitions(); print Dumper \@data;
print "pools\n"; @data = $bip->pools(); print Dumper \@data;
 foreach my $pool ( $bip->pools() ) { my @members = $bip->members( $pool ); print " # $pool\n"; print Dumper \@members; }
print "profiles\n"; @data = $bip->profiles(); print Dumper \@data;
print "routes\n"; @data = $bip->routes(); print Dumper \@data;
print "rules\n"; @data = $bip->rules(); print Dumper \@data;
print "users\n"; @data = $bip->users(); print Dumper \@data;
print "virtuals\n"; @data = $bip->virtuals(); print Dumper \@data;
# print "snats\n"; @data = $bip->snats(); print Dumper \@data;
# print "nats\n"; @data = $bip->nats(); print Dumper \@data;


