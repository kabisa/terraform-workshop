#!/bin/sh

cat <<- EOF > /opt/bitnami/nginx/html/index.html
<!doctype HTML5>
<html>
  <head>
    <title>Hello, PXL</title>
  </head>
  <body>
    <h1>Hello, PXL</h1>
    <p>This team was set up by team ${team}</p>
  </body>
</html>
EOF
