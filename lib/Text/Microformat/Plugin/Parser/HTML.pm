package Text::Microformat::Plugin::Parser::HTML;
use HTML::TreeBuilder;

sub parse {
    my $c = shift;
	$c->tree(HTML::TreeBuilder->new_from_content($c->content)) 
		if !$c->tree and $c->opts->{content_type} =~ /html/i;
    return $c->NEXT::parse(@_);
}

=head1 NAME

Text::Microformat::Plugin::Parser::HTML - HTML parser plugin for Text::Microformat

=head1 SEE ALSO

L<Text::Microformat>

=head1 AUTHOR

Keith Grennan, C<< <kgrennan at cpan.org> >>

=head1 BUGS

Log bugs and feature requests here: L<http://code.google.com/p/ufperl/issues/list>

=head1 SUPPORT

Project homepage: L<http://code.google.com/p/ufperl/>

=head1 COPYRIGHT & LICENSE

Copyright 2007 Keith Grennan, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
