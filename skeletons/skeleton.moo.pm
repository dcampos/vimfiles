package ${1:`!v expand("%:t:r")`};

use Moo;

has ${2:attribute} => (
    is	    => '${3:ro|rw}',
    isa 	=> ${4:...},
    default => sub { },
);

${5}

1;
