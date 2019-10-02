[![Actions Status](https://github.com/karupanerura/MySQL-Dump-Parser-XS/workflows/test/badge.svg)](https://github.com/karupanerura/MySQL-Dump-Parser-XS/actions)
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

MySQL::Dump::Parser::XS is `mysqldump` parser written in C/XS.
This module provides schema/data loader from `mysqldump` output SQL directly. No need `mysqld`.

# METHODS

## CLASS METHODS

### `new()`

Creates a new parser instance.
This manages parsing states amd table's meta information in the parsing context.

## INSTANCE METHODS

### `reset()`

Re-initialize parsing context.

### `parse($line)`

Parse a line of `mysqldump` output.

### `current_target_table()`

Get current target table name in the parsing context.

### `columns($table_name)`

Get column names as LIST for the table of `$table_name`.
This method can get columns from already parsed tables only.

### `tables()`

Get table names as LIST.
This method can get tables from already parsed tables only.

# LICENSE

Copyright (C) karupanerura.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

karupanerura <karupa@cpan.org>
