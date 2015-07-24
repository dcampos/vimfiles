package ${1:`!v expand("%:t:r")`};

sub new {
    my $class = shift;
    my $self = {};
    return bless $self, $class;
}

${2}

1;

__END__
