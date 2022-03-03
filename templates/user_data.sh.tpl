#!/bin/sh

cat <<- EOF > /opt/bitnami/nginx/html/index.html
<!doctype HTML5>
<html>
  <head>
    <title>Hello, PXL</title>
  </head>
  <body>
    <h1>Hello, PXL</h1>
    <p>This server was set up by team ${team} from instance ${instance}</p>
  </body>
</html>
EOF
