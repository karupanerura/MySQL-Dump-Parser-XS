package MySQL::Dump::Parser::XS;
use 5.008001;
use strict;
use warnings;

our $VERSION = "0.02";

use XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

1;
__END__

=encoding utf-8

=head1 NAME

MySQL::Dump::Parser::XS - mysqldump SQL parser

=head1 SYNOPSIS

    use MySQL::Dump::Parser::XS;

    open my $fh, '<:encoding(utf-8)', 'backup.sql' or die $!;

    my %rows;
    my $parser = MySQL::Dump::Parser::XS->new;
    while (my $line = <$fh>) {
        my @rows  = $parser->parse($line);
        my $table = $parser->current_target_table();
        push @{ $rows{$table} } => @rows;
    }

    for my $table ($parser->tables()) {
        my @columns = $parser->columns($table);
        my $row     = $rows{$table};
        print "[$table] id:$row->{id}\n";
    }

=head1 DESCRIPTION

MySQL::Dump::Parser::XS is ...

=head1 LICENSE

Copyright (C) karupanerura.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

karupanerura E<lt>karupa@cpan.orgE<gt>

=cut

