use ExtUtils::MakeMaker;
use local::lib;
use lib 'perl5';

use ExtUtils::AutoInstall (
    -core => [ 
	 'AppConfig' => '',
	 'common::sense' => '',
	 'Mojo::Base' => '',
	 'Moose' => '',
    ]);
    
WriteMakefile(
    NAME => 'PRFNeo',
    VERSION_FROM => 'lib/PRFNeo.pm',  ## Finds $VERSION
    PREREQ_PM => {
	AppConfig => 0,
	common::sense => 0,
	Getopt::Long => 0,
	Mojo::Lite => 0,
	Moose => 0,
    },
    AUTHOR => 'Ashton Trey Belew <abelew@gmail.com>'
    );

