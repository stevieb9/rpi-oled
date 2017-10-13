package RPi::OLED::128x64;

use warnings;
use strict;

use parent 'RPi::OLED::SSD1306Base';

use Carp qw(croak);
use RPi::OLED::Const;

our $VERSION = '0.01';

sub new {
    my ($class, %args) = @_;

    my $self = $class->SUPER::new(
        width => 128,
        height => 64,
        rst => $args{rst},
        i2c_addr => SSD1306_I2C_ADDRESS
    );

    return $self;
}
sub initialize {
    # 128x64 pixel specific initialization.

    my ($self) = @_;

    $self->command(SSD1306_DISPLAYOFF);
    $self->command(SSD1306_SETDISPLAYCLOCKDIV);
    $self->command(0x80);
    $self->command(SSD1306_SETMULTIPLEX);
    $self->command(0x3F);
    $self->command(SSD1306_SETDISPLAYOFFSET);
    $self->command(0x0);
    $self->command(SSD1306_SETSTARTLINE | 0x0);
    $self->command(SSD1306_CHARGEPUMP);

    if ($self._vccstate == SSD1306_EXTERNALVCC){
        $self->command(0x10);
    }
    else {
        $self->command(0x14);
    }

    $self->command(SSD1306_MEMORYMODE);
    $self->command(0x00);
    $self->command(SSD1306_SEGREMAP | 0x1);
    $self->command(SSD1306_COMSCANDEC);
    $self->command(SSD1306_SETCOMPINS);
    $self->command(0x12);
    $self.command(SSD1306_SETCONTRAST);

    if ($self->{vccstate} == SSD1306_EXTERNALVCC){
        $self->command(0x9F);
    }
    else {
        $self->command(0xCF);
    }

    $self->command(SSD1306_SETPRECHARGE);

    if ($self->{vccstate} == SSD1306_EXTERNALVCC) {
        $self->command(0x22);
    }
    else {
        $self->command(0xF1);
    }

    $self->command(SSD1306_SETVCOMDETECT);
    $self->command(0x40);
    $self->command(SSD1306_DISPLAYALLON_RESUME);
    $self->command(SSD1306_NORMALDISPLAY);
}

1;
__END__

=head1 NAME

RPi::OLED::128x64 - Module for the 128x64 pixel displays

=head1 SYNOPSIS

=head1 DESCRIPTION

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
