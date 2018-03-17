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

Plugin('RT::Authen::ExternalAuth');

# following commented are DEPRECATED !
# Insert the following directives into /etc/request-tracker3.6/RT_SiteConfig.pm to make sure that RT trusts the webserver's external authentication:
# Set($WebExternalAuth , 1);
# Set($WebFallbackToInternalAuth , true);
# Set($WebExternalAuto , 1);

# Directives to determine mapping of attributes provided by the IdP to mandatory user attributes within the RT system must also be included in the same configuration file:
# Set($ExternalAuthPriority, []);
# Set($ExternalInfoPriority, [ 'Shibboleth' ]);
# Set($ExternalServiceUsesSSLorTLS, 0);
# Set($AutoCreateNonExternalUsers, 0);

# Set($ExternalSettings,
    # { 'Shibboleth' =>
        # { 'type'            => 'shib',
          # 'auth'            => 0,
          # 'info'            => 1,
          # 'attr_match_list' =>
              # [ 'Name', 'EmailAddress', 'RealName' ],
          # 'attr_map'        =>
              # { 'Name'         => 'REMOTE_USER',
                # 'EmailAddress' => 'mail',
                # 'RealName'     => 'cn' }
        # }
    # }
# );


Set( $WebRemoteUserAuth, 1);
Set( $WebRemoteUserAutocreate , 1);
Set( $LogToSTDERR, "debug");
Set( $UserAutocreateDefaultsOnLogin, { 'Privileged' => 0 } );
# These are hacks to enable support for Shibboleth
Set( $WebRemoteUser, 1);
Set( $ExternalSettingsRemoteUser,
    { 'RemoteUser'             =>
        { 'type'               => 'shib',
          'attr_map'           =>
              { 'Name'         => [ 'HTTP_EPPN' ],
                'EmailAddress' => [ 'HTTP_MAIL' ],
                'RealName'     => [ 'HTTP_DISPLAYNAME','HTTP_CN','HTTP_GIVENNAME' ],
                'Organization' => [ 'HTTP_O' ],
		'MobilePhone'  => [ 'HTTP_MOBILE' ],
		'WorkPhone'    => [ 'HTTP_TELEPHONENUMBER' ],
		'Address1'     => [ 'HTTP_STREET' ],
		'City'         => [ 'HTTP_L' ],
		'State'        => [ 'HTTP_ST' ],
		'Zip'          => [ 'HTTP_POSTALCODE' ]
	      }
	}
    }
);

Set( $CommentAddress, '{{ rt_comment_addr }}' );
Set( $CorrespondAddress, '{{ rt_correspond_addr }}' );
Set( $Organization, '{{ rt_fqdn }}' );
Set( $OwnerEmail, '{{ rt_admin_email }}' );
Set( $SendmailPath, '/usr/sbin/sendmail' );
Set( $WebDomain, '{{ rt_fqdn }}' );
Set( $WebPort, '443' );
Set( $rtname, '{{ rt_fqdn }}' );
Set( $Timezone , '{{ rt_timezone }}');

1;
