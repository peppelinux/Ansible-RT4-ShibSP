use utf8;

# Any configuration directives you include  here will override
# RT's default configuration file, RT_Config.pm
#
# To include a directive here, just copy the equivalent statement
# from RT_Config.pm and change the value. We've included a single
# sample value below.
#
# If this file includes non-ASCII characters, it must be encoded in
# UTF-8.
#
# This file is actually a perl module, so you can include valid
# perl code, as well.
#
# The converse is also true, if this file isn't valid perl, you're
# going to run into trouble. To check your SiteConfig file, use
# this command:
#
#   perl -c /path/to/your/etc/RT_SiteConfig.pm
#
# You must restart your webserver after making changes to this file.
#

# You may also split settings into separate files under the etc/RT_SiteConfig.d/
# directory.  All files ending in ".pm" will be parsed, in alphabetical order,
# after this file is loaded.


# You must install Plugins on your own, this is only an example
# of the correct syntax to use when activating them:
#     Plugin( "RT::Authen::ExternalAuth" );

# Set( $DatabaseHost, '{{ db_host }}' );
# Set( $DatabaseName, '{{ db_name }}' );
# Set( $DatabasePassword, '{{ db_passwd }}' );
# Set( $DatabasePort, '' );
# Set( $DatabaseType, 'mysql' );
# Set( $DatabaseUser, '{{ db_user }}' );


Set( $CommentAddress, '{{ rt_comment_addr }}' );
Set( $CorrespondAddress, '{{ rt_correspond_addr }}' );
Set( $Organization, '{{ rt_fqdn }}' );
Set( $OwnerEmail, '{{ rt_admin_email }}' );
Set( $SendmailPath, '/usr/sbin/sendmail' );
Set( $WebDomain, '{{ rt_fqdn }}' );
Set( $WebPort, '443' );
Set( $rtname, '{{ rt_fqdn }}' );

# my $zone = “UTC”;
# $zone=/bin/cat /etc/timezone
# if -f “/etc/timezone”;
# chomp $zone;
Set($Timezone, "{{ rt_timezone }}");
Set(@LexiconLanguages, qw({{ rt_language }})); 

1;
