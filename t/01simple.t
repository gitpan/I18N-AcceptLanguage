# $Id: 01simple.t,v 1.2 2002/11/14 16:57:01 cgilmore Exp $

use Test::More qw(no_plan);

# Check to see if it loads

BEGIN{ use_ok( 'I18N::AcceptLanguage' ); }

###############################################################################
# Basic tests 
###############################################################################

my $t1 = I18N::AcceptLanguage->new();
ok( $t1->accepts('en', [( 'en' )]) eq 'en' );
ok( $t1->accepts('en-us', [( 'en' )]) eq 'en' );
ok( $t1->accepts('en', [( 'en-us' )]) eq 'en-us' );
ok( $t1->accepts('en-gb', [( 'en-us' )]) eq '' );
ok( $t1->accepts('ja', [( 'en' )]) eq '' );

###############################################################################
# Basic tests with default language 
###############################################################################

my $t2 = I18N::AcceptLanguage->new(defaultLanguage => 'ja');
ok( $t2->accepts('en', [( 'en' )]) eq 'en' );
ok( $t2->accepts('en-us', [( 'en' )]) eq 'en' );
ok( $t2->accepts('en', [( 'en-us' )]) eq 'en-us' );
ok( $t2->accepts('en-gb', [( 'en-us' )]) eq 'ja' );
ok( $t2->accepts('ja', [( 'en' )]) eq 'ja' );

###############################################################################
# Basic tests with default language 
###############################################################################

my $t3 = I18N::AcceptLanguage->new(strict => 0);
ok( $t3->accepts('en-gb', [( 'en-us' )]) eq 'en-us' );
