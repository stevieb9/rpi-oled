package RPi::OLED::SSD1306Base;

use warnings;
use strict;

use Carp qw(croak);
use RPi::Const qw(:all);
use RPi::I2C;
use RPi::OLED::Const;
use RPi::Pin;

our $VERSION = '0.01';

sub new {
    my ($self, %args) = @_;

    # width
    # height
    # rst
    # dc
    # sclk
    # din
    # cs
    # gpio
    # spi
    # i2c
    # i2c_device
    # i2c_addr

    for (keys %args){
        $self->{$_} = $args{$_};
    }

    #FIXME: write sub that handles all i2c args, and dies accordingly if
    # necessary

    if ($self->{i2c}){
        $self->{i2c} = RPi::I2C->new($self->{i2c_addr}, $self->{i2c_device});
    }

    if (defined $self->{rst}){
        $self->{rst} = RPi::Pin->new($self->{rst});
        $self->{rst}->mode(OUTPUT);
    }
    return $self;
}
sub begin {
    # initialize the display

    my ($self, $vcc_state) = @_;
    $self->{vcc_state} = $vcc_state;

    $self->reset;
    $self->initialize;
    $self->command(SSD1306_DISPLAYON);
}
sub command {
    # send command byte to display

    my ($self, $char) = @_;

    if (! defined $char){
        croak "command() requires a byte sent in as an argument\n";
    }
    if ($self->_i2c) {
        my $control = 0x00;
        $self->_i2c($control, $char);
    }
}
sub data {
    # send data byte to display

    my ($self, $char) = @_;

    if (! defined $char){
        croak "data() requires a byte sent in as an argument\n";
    }

    if ($self->_i2c){
        my $control = 0x40;
        $self->_i2c->write_byte($char, $control);
    }
}
sub initialize {
    croak "NOT IMPLEMENTED: You must write an 'initialize()' sub into your " .
          "subclass\n";
}
sub reset {
    # reset the display

    my ($self) = @_;
    return if ! defined $self->{rst};

    $self->{rst}->write(HIGH);
    select(undef, undef, undef, 0.001);
    $self->{rst}->write(LOW);
    select(undef, undef, undef, 0.01);
    $self->{rst}->write(HIGH);
}
sub _i2c {
    return $self->{i2c};
}
1;
__END__

=head1 NAME

RPi::OLED::SSD1306Base - Base class for SSD1306 related OLED displays

=head1 SYNOPSIS

use RPi::OLED::Const

=head1 DESCRIPTION

Provides constant variables for the L<RPi::OLED> distribution.

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
