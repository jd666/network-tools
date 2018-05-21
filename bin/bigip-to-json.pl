#! /usr/bin/env perl

# git clone url = https://github.com/sschneid/perl-bigip-parseconfig.git

use strict;
use warnings;
use diagnostics;
use Data::Dumper;

push(@INC, $ENV{'HOME'} . '/projects/perl-bigip-parseconfig/blib/lib');
use BigIP::ParseConfig;

my $file = ($ARGV[0]) ? $ARGV[0] : '/config/bigip.conf';

# Module initialization
my $bip = new BigIP::ParseConfig( $file );
print Dumper $bip;

## # write as json
## use JSON;
## my $json = new JSON;
## $json->latin1(1);   # use extended ascii characters only (encode unicode chars)
## $json->relaxed(1);  # allow reading invalid JSON (for comments in JSON files)
## $json->canonical(1);# sort JSON objects by key
## $json->pretty(1);   # use readable text formatting
## if ( !open ( $fh , '>', "$file.json" ) ) {
##     print STDERR "ERROR: cannot open $file for writing!\n";
## }
## print $fh $json->encode( $bip ) . "\n";
## close( $fh );

# Write out a new config file
$bip->write( $file . '.new' );

exit 0;
