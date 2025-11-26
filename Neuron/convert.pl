#!/usr/bin/perl
while(my $l = <>) {
    chomp $l;
    if( $l =~ /xm(.*nmos.*)/ ) {
        print("mn$1\n");
    } elsif ($l =~ /xm(.*pmos.*)/) {
        print("mp$1\n");
    }else{
        print("$l\n");
    }
}
