# simple lookup
hiera -c /etc/puppetlabs/code/hiera.yaml demo::atoms

# lookup with fact values
hiera -c /etc/puppetlabs/code/hiera.yaml demo::atoms \
    clientcert=int01-web01.example.net role=webserver location=ny

# debug mode
hiera -d -c /etc/puppetlabs/code/hiera.yaml demo::atoms \
    clientcert=int01-web01.example.net role=webserver location=ny
