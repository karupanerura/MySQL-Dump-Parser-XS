[![Build Status](https://travis-ci.org/karupanerura/MySQL-Dump-Parser-XS.svg?branch=master)](https://travis-ci.org/karupanerura/MySQL-Dump-Parser-XS)
# NAME

MySQL::Dump::Parser::XS - mysqldump SQL parser

# SYNOPSIS

    use MySQL::Dump::Parser::XS;

    open my $fh, '<:encoding(utf-8)', 'backup.sql' or die $!;

    my %rows;
    my $parser = MySQL::Dump::Parser::XS->new;
    while (my $line = <$fh>) {
        my @rows  = $parser->parse($line);
        my $table = $parser->current_target_table();
        push @{ $rows{$table} } => @rows if $table;
    }

    for my $table ($parser->tables()) {
        my @columns = $parser->columns($table);
        my $row     = $rows{$table};
        print "[$table] id:$row->{id}\n";
    }

# DESCRIPTION

MySQL::Dump::Parser::XS is ...

# LICENSE

Copyright (C) karupanerura.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

karupanerura <karupa@cpan.org>
