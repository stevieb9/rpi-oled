package RPi::OLED::Const;

use warnings;
use strict;

our $VERSION = '0.01';

require Exporter;
use base qw( Exporter );
our @EXPORT;

# core constants

use constant {
    SSD1306_I2C_ADDRESS => 0x3C,    # 011110+SA0+RW - 0x3C or 0x3D
    SSD1306_SETCONTRAST => 0x81,
    SSD1306_DISPLAYALLON_RESUME => 0xA4,
    SSD1306_DISPLAYALLON => 0xA5,
    SSD1306_NORMALDISPLAY => 0xA6,
    SSD1306_INVERTDISPLAY => 0xA7,
    SSD1306_DISPLAYOFF => 0xAE,
    SSD1306_DISPLAYON => 0xAF,
    SSD1306_SETDISPLAYOFFSET => 0xD3,
    SSD1306_SETCOMPINS => 0xDA,
    SSD1306_SETVCOMDETECT => 0xDB,
    SSD1306_SETDISPLAYCLOCKDIV => 0xD5,
    SSD1306_SETPRECHARGE => 0xD9,
    SSD1306_SETMULTIPLEX => 0xA8,
    SSD1306_SETLOWCOLUMN => 0x00,
    SSD1306_SETHIGHCOLUMN => 0x10,
    SSD1306_SETSTARTLINE => 0x40,
    SSD1306_MEMORYMODE => 0x20,
    SSD1306_COLUMNADDR => 0x21,
    SSD1306_PAGEADDR => 0x22,
    SSD1306_COMSCANINC => 0xC0,
    SSD1306_COMSCANDEC => 0xC8,
    SSD1306_SEGREMAP => 0xA0,
    SSD1306_CHARGEPUMP => 0x8D,
    SSD1306_EXTERNALVCC => 0x1,
    SSD1306_SWITCHCAPVCC => 0x2,
};

{ # core

    my @const = qw(
        SSD1306_I2C_ADDRESS
        SSD1306_SETCONTRAST
        SSD1306_DISPLAYALLON_RESUME
        SSD1306_DISPLAYALLON
        SSD1306_NORMALDISPLAY
        SSD1306_INVERTDISPLAY
        SSD1306_DISPLAYOFF
        SSD1306_DISPLAYON
        SSD1306_SETDISPLAYOFFSET
        SSD1306_SETCOMPINS
        SSD1306_SETVCOMDETECT
        SSD1306_SETDISPLAYCLOCKDIV
        SSD1306_SETPRECHARGE
        SSD1306_SETMULTIPLEX
        SSD1306_SETLOWCOLUMN
        SSD1306_SETHIGHCOLUMN
        SSD1306_SETSTARTLINE
        SSD1306_MEMORYMODE
        SSD1306_COLUMNADDR
        SSD1306_PAGEADDR
        SSD1306_COMSCANINC
        SSD1306_COMSCANDEC
        SSD1306_SEGREMAP
        SSD1306_CHARGEPUMP
        SSD1306_EXTERNALVCC
        SSD1306_SWITCHCAPVCC
    );

    push @EXPORT, @const;
}

# scrolling constants

use constant {
    SSD1306_ACTIVATE_SCROLL => 0x2F,
    SSD1306_DEACTIVATE_SCROLL => 0x2E,
    SSD1306_SET_VERTICAL_SCROLL_AREA => 0xA3,
    SSD1306_RIGHT_HORIZONTAL_SCROLL => 0x26,
    SSD1306_LEFT_HORIZONTAL_SCROLL => 0x27,
    SSD1306_VERTICAL_AND_RIGHT_HORIZONTAL_SCROLL => 0x29,
    SSD1306_VERTICAL_AND_LEFT_HORIZONTAL_SCROLL => 0x2A,
};

{ # scrolling

    my @const = qw(
        SSD1306_ACTIVATE_SCROLL
        SSD1306_DEACTIVATE_SCROLL
        SSD1306_SET_VERTICAL_SCROLL_AREA
        SSD1306_RIGHT_HORIZONTAL_SCROLL
        SSD1306_LEFT_HORIZONTAL_SCROLL
        SSD1306_VERTICAL_AND_RIGHT_HORIZONTAL_SCROLL
        SSD1306_VERTICAL_AND_LEFT_HORIZONTAL_SCROLL
    );

    push @EXPORT, @const;
}

__END__

=head1 NAME

RPi::OLED - Helper module for RPi::OLED to provide constant variables

=head1 SYNOPSIS

use RPi::OLED::Const

=head1 DESCRIPTION

Provides constant variables for the L<RPi::OLED> distribution.

=head1 EXPORT

This module exports all related constant variables present in this module. It
does not export any subs.

=head1 AUTHOR

Steve Bertrand, C<< <steveb at cpan.org> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2017 Steve Bertrand.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of RPi::OLED
