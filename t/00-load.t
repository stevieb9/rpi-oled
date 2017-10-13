use warnings;
use strict;

use Test::More;

BEGIN {
    use_ok( 'RPi::OLED' ) || print "Bail out!\n";
#    use_ok( 'RPi::OLED::SSD1306Base' ) || print "Bail out!\n";
    use_ok( 'RPi::OLED::128x64' ) || print "Bail out!\n";
    use_ok( 'RPi::OLED::Const' ) || print "Bail out!\n";
}

diag( "Testing RPi::OLED $RPi::OLED::VERSION, Perl $], $^X" );

done_testing();
