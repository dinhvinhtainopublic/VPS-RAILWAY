#!/bin/bash

echo "=========================================="
echo "  Railway VPS - SSH Information"
echo "=========================================="
echo ""
echo "  SSH Command:"
echo "  ssh root@${RAILWAY_PUBLIC_DOMAIN:-$(hostname -i)} -p ${PORT:-22}"
echo ""
echo "  Password: root"
echo ""
echo "=========================================="

python3 -c "
from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'OK')
    def log_message(self, format, *args):
        pass

HTTPServer(('0.0.0.0', 8080), Handler).serve_forever()
" &

while true; do
    curl -s http://localhost:8080 > /dev/null 2>&1
    sleep 30
done
