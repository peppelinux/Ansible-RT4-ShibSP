# THE BASICS:

Set($rtname, '{{ rt_fqdn }}');
Set($Organization, '{{ domain }}');

Set($CorrespondAddress , '{{ rt_correspond_addr }}');
Set($CommentAddress , '{{ rt_comment_addr }}');
Set($OwnerEmail , '{{ rt_comment_addr }}');

# THE WEBSERVER:

Set($WebPath , "{{ rt_web_path }}");
Set($WebBaseURL , "https://{{ rt_fqdn }}");

Set($WebPort, "{{ rt_http_port }}");
Set($WebDomain, '{{ rt_fqdn }}'); 
