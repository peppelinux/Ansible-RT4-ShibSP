# [notUsableYet] Ansible-RT4-ShibSP

according to
    - https://rt-wiki.bestpractical.com/wiki/ManualInstallation


Usage
-----
Remember to customize your setup by editing variable in rt_vars.yml and playbook.yml
````
ansible-playbook -i "localhost," -c local playbook.yml [-vvv]
````

Installing RT4 by hands
-----------------------
````
# as root user
# dependencies Debian9
apt install perl-doc libgdchart-gd2-xpm build-essential libfribidi0 libfsplib0 libgc1c2 libgd3 libgsasl7 libgts-0.7-5 libgts-bin libgvc6 libgvpr2 libkyotocabinet16v5 liblua5.1-0 liblzo2-2 libmailutils5 libossp-uuid16 libpathplan4 libpq5 libtre5 libwebp6 libxdot4 links lynx lynx-common lynx-cur mailutils swaks fonts-noto gsfonts graphviz-doc fonts-dustin libgd-tools uuid tre-agrep xml-twig-tools mailutils-mh mailutils-doc fcgiwrap fonts-noto-mono graphviz guile-2.0-libs libann0 libapache2-mod-fcgid libcdt5 libcgraph6 libfribidi0 libfsplib0 libgc1c2 libgd3 libgsasl7 libgts-0.7-5 libgts-bin libgvc6 libgvpr2 libkyotocabinet16v5 liblua5.1-0 liblzo2-2 libmailutils5 libossp-uuid16 libpathplan4 libpq5 libtre5 libwebp6 libxdot4
libapache2-mod-perl2

# example about playbook's variables extraction
export DB_NAME=$(cat rt_vars.yml | grep db_name | awk -F':' {'print $2'})
export DB_PASS=$(cat rt_vars.yml | grep db_passwd | awk -F':' {'print $2'})
export DB_USER=$(cat rt_vars.yml | grep db_user | awk -F':' {'print $2'})
export WEB_USER=www-data

# attachment-store="disk" 'cause of gdrive fuse approach
./configure --enable-graphviz --enable-gd --enable-gpg --enable-smime --enable-externalauth \
            --with-db-database=$DB_NAME --with-db-rt-user=$DB_USER --with-db-rt-pass=$DB_PASS \
            --with-web-user=$WEB_USER --with-web-group=$WEB_USER \
            --with-attachment-store=disk

# check dependencies
make testdeps

# perl dependencies
# this should be managed in ansible playbook!
make fixdeps
# or 
# apt install libalgorithm-c3-perl libanyevent-cachedns-perl libanyevent-http-perl libanyevent-perl libapache-logformat-compiler-perl libapache-session-perl libapache2-mod-perl2 libapache2-reload-perl libasync-interrupt-perl libb-hooks-endofscope-perl libboolean-perl libbsd-resource-perl libbusiness-hours-perl libbytes-random-secure-perl libcache-cache-perl libcache-simple-timedexpiry-perl libcarp-clan-perl libcgi-compile-perl libcgi-emulate-psgi-perl libcgi-psgi-perl libclass-accessor-chained-perl libclass-accessor-lite-perl libclass-adapter-perl libclass-c3-perl libclass-c3-xs-perl libclass-container-perl libclass-data-inheritable-perl libclass-factory-util-perl libclass-inspector-perl libclass-load-perl libclass-load-xs-perl libclass-method-modifiers-perl libclass-methodmaker-perl libclass-mix-perl libclass-returnvalue-perl libclass-singleton-perl libclass-tiny-perl libclass-xsaccessor-perl libclone-perl libcommon-sense-perl libconstant-defer-perl libconvert-asn1-perl libconvert-binhex-perl libconvert-color-perl libcookie-baker-perl libcpanel-json-xs-perl libcrypt-eksblowfish-perl libcrypt-random-seed-perl libcrypt-ssleay-perl libcrypt-x509-perl libcss-minifier-xs-perl libcss-squish-perl libdata-guid-perl libdata-ical-perl libdata-optlist-perl libdata-page-pageset-perl libdata-page-perl libdata-perl-perl libdata-stream-bulk-perl libdate-extract-perl libdate-manip-perl libdatetime-event-ical-perl libdatetime-event-recurrence-perl libdatetime-format-builder-perl libdatetime-format-flexible-perl libdatetime-format-http-perl libdatetime-format-ical-perl libdatetime-format-iso8601-perl libdatetime-format-mail-perl libdatetime-format-natural-perl libdatetime-format-strptime-perl libdatetime-format-w3cdtf-perl libdatetime-locale-perl libdatetime-perl libdatetime-set-perl libdatetime-timezone-perl libdatetimex-easy-perl libdbd-pg-perl libdbd-sqlite3-perl libdbix-dbschema-perl libdbix-searchbuilder-perl libdevel-caller-perl libdevel-globaldestruction-perl libdevel-lexalias-perl libdevel-overloadinfo-perl libdevel-partialdump-perl libdevel-stacktrace-ashtml-perl libdevel-stacktrace-perl libdevel-symdump-perl libdigest-hmac-perl libdigest-md5-file-perl libdist-checkconflicts-perl libemail-address-list-perl libemail-address-perl libemail-date-format-perl libev-perl libeval-closure-perl libexception-class-perl libexporter-lite-perl libexporter-tiny-perl libfcgi-procmanager-perl libfile-dropbox-perl libfile-find-rule-perl libfile-pushd-perl libfile-sharedir-perl libfile-which-perl libfilesys-notify-simple-perl libfreezethaw-perl libfurl-perl libgd-graph-perl libgd-perl libgd-text-perl libgnupg-interface-perl libgraphviz-perl libgssapi-perl libguard-perl libhash-multivalue-perl libhtml-formatexternal-perl libhtml-formattext-withlinks-andtables-perl libhtml-formattext-withlinks-perl libhtml-mason-perl libhtml-mason-psgihandler-perl libhtml-quoted-perl libhtml-rewriteattributes-perl libhtml-scrubber-perl libhttp-cookiejar-perl libhttp-entity-parser-perl libhttp-headers-fast-perl libhttp-multipartparser-perl libhttp-parser-xs-perl libimport-into-perl libio-interactive-perl libio-pty-perl libipc-run-perl libipc-run3-perl libipc-shareable-perl libipc-sharelite-perl libipc-signal-perl libjavascript-minifier-xs-perl libjson-maybexs-perl libjson-perl libjson-xs-perl liblist-moreutils-perl liblist-utilsby-perl liblocale-maketext-fuzzy-perl liblocale-maketext-lexicon-perl liblog-any-perl liblog-dispatch-perl liblog-log4perl-perl liblwp-useragent-determined-perl libmail-sendmail-perl libmath-random-isaac-perl libmath-random-isaac-xs-perl libmime-lite-perl libmime-tools-perl libmime-types-perl libmodule-implementation-perl libmodule-pluggable-perl libmodule-refresh-perl libmodule-runtime-conflicts-perl libmodule-runtime-perl libmodule-versions-report-perl libmoo-perl libmoose-perl libmoosex-strictconstructor-perl libmoosex-types-datetime-morecoercions-perl libmoosex-types-datetime-perl libmoosex-types-perl libmoox-handlesvia-perl libmoox-late-perl libmro-compat-perl libnamespace-autoclean-perl libnamespace-clean-perl libnet-amazon-s3-perl libnet-cidr-perl libnet-dns-lite-perl libnet-idn-encode-perl libnet-ip-perl libnet-ldap-perl libnumber-compare-perl libossp-uuid-perl libpackage-deprecationmanager-perl libpackage-stash-perl libpackage-stash-xs-perl libpadwalker-perl libparallel-prefork-perl libparams-classify-perl libparams-util-perl libparams-validate-perl libparams-validationcompiler-perl libparse-recdescent-perl libpath-class-perl libperlio-eol-perl libplack-perl libposix-strftime-compiler-perl libproc-wait3-perl libregexp-common-net-cidr-perl libregexp-common-perl libregexp-ipv6-perl librole-basic-perl librole-tiny-perl libscalar-list-utils-perl libscope-guard-perl libscope-upper-perl libserver-starter-perl libset-infinite-perl libset-intspan-perl libsignal-mask-perl libsms-send-perl libspecio-perl libstream-buffered-perl libstrictures-perl libstring-approx-perl libstring-shellquote-perl libsub-exporter-formethods-perl libsub-exporter-perl libsub-exporter-progressive-perl libsub-identify-perl libsub-install-perl libsub-uplevel-perl libsymbol-global-name-perl libsys-hostname-long-perl libterm-encoding-perl libterm-progressbar-perl libterm-progressbar-quiet-perl libterm-progressbar-simple-perl libterm-readline-perl-perl libtest-exception-perl libtest-fatal-perl libtest-mockobject-perl libtest-sharedfork-perl libtest-tcp-perl libtext-autoformat-perl libtext-glob-perl libtext-password-pronounceable-perl libtext-quoted-perl libtext-reform-perl libtext-template-perl libtext-vfile-asdata-perl libtext-wikiformat-perl libtext-wrapper-perl libthread-sigmask-perl libtie-ixhash-perl libtime-duration-parse-perl libtime-duration-perl libtime-parsedate-perl libtree-simple-perl libtry-tiny-perl libtype-tiny-perl libtype-tiny-xs-perl libtypes-serialiser-perl libuniversal-can-perl libuniversal-isa-perl libuniversal-require-perl libvariable-magic-perl libvm-ec2-perl libvm-ec2-security-credentialcache-perl libwant-perl libwww-form-urlencoded-perl libwww-form-urlencoded-xs-perl libxml-libxml-perl libxml-namespacesupport-perl libxml-parser-perl libxml-rss-perl libxml-sax-base-perl libxml-sax-expat-perl libxml-sax-perl libxml-simple-perl libxml-twig-perl libxml-xpath-perl libxml-xpathengine-perl spf-tools-perl libevent-perl libio-async-perl libpoe-perl libtask-weaken-perl libdate-calc-perl libchi-perl libhtml-mason-perl-doc libtemplate-perl libyaml-perl libppi-perl libdbd-csv-perl liblog-dispatch-filerotate-perl librrds-perl libxml-dom-perl libmojolicious-perl libtext-soundex-perl perl libbareword-filehandles-perl libindirect-perl libmultidimensional-perl libunicode-map8-perl libunicode-string-perl libalgorithm-c3-perl libanyevent-cachedns-perl libanyevent-http-perl libanyevent-perl libapache-logformat-compiler-perl libapache-session-perl libapache2-mod-perl2 libapache2-reload-perl libasync-interrupt-perl libb-hooks-endofscope-perl libboolean-perl libbsd-resource-perl libbusiness-hours-perl libbytes-random-secure-perl libcache-cache-perl libcache-simple-timedexpiry-perl libcarp-clan-perl libcgi-compile-perl libcgi-emulate-psgi-perl libcgi-psgi-perl libclass-accessor-chained-perl libclass-accessor-lite-perl libclass-adapter-perl libclass-c3-perl libclass-c3-xs-perl libclass-container-perl libclass-data-inheritable-perl libclass-factory-util-perl libclass-inspector-perl libclass-load-perl libclass-load-xs-perl libclass-method-modifiers-perl libclass-methodmaker-perl libclass-mix-perl libclass-returnvalue-perl libclass-singleton-perl libclass-tiny-perl libclass-xsaccessor-perl libclone-perl libcommon-sense-perl libconstant-defer-perl libconvert-asn1-perl libconvert-binhex-perl libconvert-color-perl libcookie-baker-perl libcpanel-json-xs-perl libcrypt-eksblowfish-perl libcrypt-random-seed-perl libcrypt-ssleay-perl libcrypt-x509-perl libcss-minifier-xs-perl libcss-squish-perl libdata-guid-perl libdata-ical-perl libdata-optlist-perl libdata-page-pageset-perl libdata-page-perl libdata-perl-perl libdata-stream-bulk-perl libdate-extract-perl libdate-manip-perl libdatetime-event-ical-perl libdatetime-event-recurrence-perl libdatetime-format-builder-perl libdatetime-format-flexible-perl libdatetime-format-http-perl libdatetime-format-ical-perl libdatetime-format-iso8601-perl libdatetime-format-mail-perl libdatetime-format-natural-perl libdatetime-format-strptime-perl libdatetime-format-w3cdtf-perl libdatetime-locale-perl libdatetime-perl libdatetime-set-perl libdatetime-timezone-perl libdatetimex-easy-perl libdbd-pg-perl libdbd-sqlite3-perl libdbix-dbschema-perl libdbix-searchbuilder-perl libdevel-caller-perl libdevel-globaldestruction-perl libdevel-lexalias-perl libdevel-overloadinfo-perl libdevel-partialdump-perl libdevel-stacktrace-ashtml-perl libdevel-stacktrace-perl libdevel-symdump-perl libdigest-hmac-perl libdigest-md5-file-perl libdist-checkconflicts-perl libemail-address-list-perl libemail-address-perl libemail-date-format-perl libev-perl libeval-closure-perl libexception-class-perl libexporter-lite-perl libexporter-tiny-perl libfcgi-procmanager-perl libfile-dropbox-perl libfile-find-rule-perl libfile-pushd-perl libfile-sharedir-perl libfile-which-perl libfilesys-notify-simple-perl libfreezethaw-perl libfurl-perl libgd-graph-perl libgd-perl libgd-text-perl libgnupg-interface-perl libgraphviz-perl libgssapi-perl libguard-perl libhash-multivalue-perl libhtml-formatexternal-perl libhtml-formattext-withlinks-andtables-perl libhtml-formattext-withlinks-perl libhtml-mason-perl libhtml-mason-psgihandler-perl libhtml-quoted-perl libhtml-rewriteattributes-perl libhtml-scrubber-perl libhttp-cookiejar-perl libhttp-entity-parser-perl libhttp-headers-fast-perl libhttp-multipartparser-perl libhttp-parser-xs-perl libimport-into-perl libio-interactive-perl libio-pty-perl libipc-run-perl libipc-run3-perl libipc-shareable-perl libipc-sharelite-perl libipc-signal-perl libjavascript-minifier-xs-perl libjson-maybexs-perl libjson-perl libjson-xs-perl liblist-moreutils-perl liblist-utilsby-perl liblocale-maketext-fuzzy-perl liblocale-maketext-lexicon-perl liblog-any-perl liblog-dispatch-perl liblog-log4perl-perl liblwp-useragent-determined-perl libmail-sendmail-perl libmath-random-isaac-perl libmath-random-isaac-xs-perl libmime-lite-perl libmime-tools-perl libmime-types-perl libmodule-implementation-perl libmodule-pluggable-perl libmodule-refresh-perl libmodule-runtime-conflicts-perl libmodule-runtime-perl libmodule-versions-report-perl libmoo-perl libmoose-perl libmoosex-strictconstructor-perl libmoosex-types-datetime-morecoercions-perl libmoosex-types-datetime-perl libmoosex-types-perl libmoox-handlesvia-perl libmoox-late-perl libmro-compat-perl libnamespace-autoclean-perl libnamespace-clean-perl libnet-amazon-s3-perl libnet-cidr-perl libnet-dns-lite-perl libnet-idn-encode-perl libnet-ip-perl libnet-ldap-perl libnumber-compare-perl libossp-uuid-perl libpackage-deprecationmanager-perl libpackage-stash-perl libpackage-stash-xs-perl libpadwalker-perl libparallel-prefork-perl libparams-classify-perl libparams-util-perl libparams-validate-perl libparams-validationcompiler-perl libparse-recdescent-perl libpath-class-perl libperlio-eol-perl libplack-perl libposix-strftime-compiler-perl libproc-wait3-perl libregexp-common-net-cidr-perl libregexp-common-perl libregexp-ipv6-perl librole-basic-perl librole-tiny-perl libscalar-list-utils-perl libscope-guard-perl libscope-upper-perl libserver-starter-perl libset-infinite-perl libset-intspan-perl libsignal-mask-perl libsms-send-perl libspecio-perl libstream-buffered-perl libstrictures-perl libstring-approx-perl libstring-shellquote-perl libsub-exporter-formethods-perl libsub-exporter-perl libsub-exporter-progressive-perl libsub-identify-perl libsub-install-perl libsub-uplevel-perl libsymbol-global-name-perl libsys-hostname-long-perl libterm-encoding-perl libterm-progressbar-perl libterm-progressbar-quiet-perl libterm-progressbar-simple-perl libterm-readline-perl-perl libtest-exception-perl libtest-fatal-perl libtest-mockobject-perl libtest-sharedfork-perl libtest-tcp-perl libtext-autoformat-perl libtext-glob-perl libtext-password-pronounceable-perl libtext-quoted-perl libtext-reform-perl libtext-template-perl libtext-vfile-asdata-perl libtext-wikiformat-perl libtext-wrapper-perl libthread-sigmask-perl libtie-ixhash-perl libtime-duration-parse-perl libtime-duration-perl libtime-parsedate-perl libtree-simple-perl libtry-tiny-perl libtype-tiny-perl libtype-tiny-xs-perl libtypes-serialiser-perl libuniversal-can-perl libuniversal-isa-perl libuniversal-require-perl libvariable-magic-perl libvm-ec2-perl libvm-ec2-security-credentialcache-perl libwant-perl libwww-form-urlencoded-perl libwww-form-urlencoded-xs-perl libxml-libxml-perl libxml-namespacesupport-perl libxml-parser-perl libxml-rss-perl libxml-sax-base-perl libxml-sax-expat-perl libxml-sax-perl libxml-simple-perl libxml-twig-perl libxml-xpath-perl libxml-xpathengine-perl libscalar-util-numeric-perl

# Debian9 missing dependencies on official debian repository
# libmozilla-ca-perl
# perl -MCPAN -e 'install Mozilla::CA'

# install jinja2 CLI for ansible vars reuse :)
pip3 install shinto-cli

# install it in /opt/rt4 or whatever
make install

# create db and ACL using shinto-cli
j2 roles/rt4/templates/db.sql rt_vars.yml > /tmp/db.sql
mysql -u root < /tmp/db.sql

# You must now configure RT by editing /opt/rt4/etc/RT_SiteConfig.pm.
# then
make initialize-database

# or
# run standalone webserver
# /opt/rt4/sbin/rt-server --port 8081

````

Resources
---------

- https://docs.bestpractical.com/rt/4.4.2/README.html
- https://docs.bestpractical.com/rt/4.2.2/web_deployment.html#mod_fcgid
- https://www.nsrc.org/workshops/templates-old/brian/foo/exercises-rt-lab1.md.html
- http://www.sgsosu.net/nmetro/docs.html


Trouble shooting
----------------

- https://rt-wiki.bestpractical.com/wiki/RecoverRootPassword

WARNING: Both mod_speling and mod_cache are known to break RT.
mod_speling will cause RT's CSS and JS to not be loaded, making RT
appear unstyled. mod_cache will cache cookies, making users be
spontaneously logged in as other users in the system.
