#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'RPi::OLED' ) || print "Bail out!\n";
}

diag( "Testing RPi::OLED $RPi::OLED::VERSION, Perl $], $^X" );
