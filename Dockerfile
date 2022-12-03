FROM httpd
LABEL name="kumar"
COPY test-1/index.html /usr/local/apache2/htdocs/
