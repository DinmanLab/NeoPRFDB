package PRFNeo::Folders;
## Time-stamp: <Sat Apr  2 11:25:23 2016 Ashton Trey Belew (abelew@gmail.com)>
use Moose;

extends 'PRFNeo';

=head1 NAME

    PRFNeo::Folders - Methods for working with RNA sequences

=head1 SYNOPSIS

    use PRFNeo qw"";
    my $prf = new PRFNeo;
    $prf->Get_CT();

=head1 DESCRIPTION

    This should contain functions for changing file formats and folding sequences.

=cut

=head2 Methods

=over4


=head2 Get_CT

    Get a CT file formatted string given the output of a program

=cut
sub Get_CT {
    my ($me, %args) = @_;
    my @seq_array = split(//, $args{sequence});
    my @in_array = split(/\s+/, $args{output});
    my $function = $args{function};
    my $num_bases = scalar(@seq_array);
    my $output_string = "${num_bases} temporary_ct_file\n";
    foreach my $c (0 .. $#seq_array) {
        my $position = $c + 1;
        my $last = $c;
        my $next = $c+2;
        if (!defined($in_array[$c])) {  ## Why did I do this?
            $output_string .= "${c} $seq_array[$c] ${last} ${next} $seq_array[$c]\n";
        }
        elsif ($in_array[$c] eq '.') {
            $output_string .= "${position} $seq_array[$c] ${last} ${next} 0\n";
        }
        else {
            my $bound_position = $in_array[$c] + 1;
	    ## I don't understand this line at all.
	    $bound_position = $bound_position + 1 if ($function eq 'pknots');
            $output_string .= "${position} $seq_array[$c] ${last} ${next} ${bound_position}\n";
        }
    }
    $me->{ctseq} = $output_string;
    return($output_string);
}

=back

=head1 AUTHOR - atb

Email abelew@gmail.com

=head1 SEE ALSO

    L<PRFNeo>

=cut

1;

__END__
