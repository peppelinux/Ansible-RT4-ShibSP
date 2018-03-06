#!/bin/bash
# dunno why but needed with ansible, it avoids a strange installation path
set -e
set -x

cd {{ rt_path }}
./configure --enable-graphviz --enable-gd --enable-gpg --enable-smime --enable-externalauth \
            --with-db-database={{ db_name }} --with-db-rt-user={{ db_name }} --with-db-rt-pass={{ db_passwd }} \
            --with-web-user=www-data --with-web-group=www-data \
            --with-attachment-store=disk


            # \
            # --bindir={{ rt_install_dir }} --sbindir={{ rt_install_dir }} --libexecdir={{ rt_install_dir }} \
            # --libdir={{ rt_install_dir }} --prefix={{ rt_install_dir }}
