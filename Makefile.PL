use strict;
use warnings;
use ExtUtils::MakeMaker;

my $eumm_version = version->parse($ExtUtils::MakeMaker::VERSION);
my $prereq = {
    'AppConfig' => 0,
    'autodie' => 0,
    'DBIx::Class' => 0,
    'Modern::Perl' => 0,
    'Mojolicious' => 0,
    'Moose' => 0,
};

my @args = (
    NAME           => 'PRFNeo',
    VERSION_FROM   => 'lib/PRFNeo.pm',
    ABSTRACT       => 'A new and more fun PRFdb',
    AUTHOR         => 'atxb',
    LICENSE        => 'gpl',
    test           => {TESTS => 't/*.t'}
    );

if ($eumm_version >= 6.46) {
    push @args,
    META_MERGE     => {
	requires   => {perl => '5.010001'},
	resources  => {
                license    => 'http://dev.perl.org/licenses/',
                bugtracker => 'https://github.com/abelew/NeoPRFDB/issues',
                repository => 'https://github.com/abelew/NeoPRFDB.git',
	},
    };
}

my %eumm_req = (
    'POSIX' => 0,
    'Time::Local' => 0,
    %$prereq,
    );

if ($eumm_version >= 6.64) {
    push @args, PREREQ_PM => $prereq, TEST_REQUIRES => \%eumm_req;
}
elsif ($eumm_version >= 6.5503) {
    push @args, PREREQ_PM => $prereq, BUILD_REQUIRES => \%eumm_req;
}
else {
    push @args, PREREQ_PM => \%eumm_req;
}

WriteMakefile(@args);
